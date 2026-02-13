FROM python:3.12-slim

# Install system dependencies needed by PyTensor (C++ compiler, BLAS)
RUN apt-get update && \
    apt-get install -y --no-install-recommends g++ libopenblas-dev && \
    rm -rf /var/lib/apt/lists/*

# Configure PyTensor to use g++ and link directly to OpenBLAS
RUN mkdir -p /root && printf '[global]\ncxx=/usr/bin/g++\n\n[blas]\nldflags=-lopenblas\n' > /root/.pytensorrc

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

WORKDIR /app

# Copy dependency files first for layer caching
COPY pyproject.toml uv.lock ./

# Install dependencies
RUN uv sync --frozen --no-install-project

# Copy the rest of the project
COPY check_blas.py pymc_linear_regression.ipynb ./

EXPOSE 8888

CMD ["uv", "run", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
