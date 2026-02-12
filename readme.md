This repo is a quick demo showing that PyMC works well with `uv` on macOS.

It includes:
- A `uv`-managed environment with `pymc` and `jupyter`
- A simple linear regression demo notebook: `pymc_linear_regression.ipynb`
- A BLAS sanity check via PyTensor’s `check_blas.py`

## Requirements

- **Xcode**
- **Xcode Command Line Tools**: Install with `xcode-select --install`
- **uv**: Install with `brew install uv` or follow instructions at https://docs.astral.sh/uv/
- Ensure PyTensor can find a C++ compiler on macOS. Add this to `~/.pytensorrc`:
```
[global]
cxx=/usr/bin/clang++
```




## Setup
From the repo root:

```
uv sync
```

## BLAS check
To test, use this:

```
uv run python check_blas.py
```

## Notebook
Launch Jupyter and open the demo notebook:

```
uv run jupyter notebook
```

Then open `pymc_linear_regression.ipynb` and run all cells.

## Docker

You can also run everything in a Docker container (no macOS-specific setup required):

```
docker build -t pymc-uv .
docker run -p 8888:8888 pymc-uv
```

Then open the URL with token that Jupyter prints to the console.

To run the BLAS check inside the container:

```
docker run pymc-uv uv run python check_blas.py
```

## Notes
- This was tested on macOS with Python 3.12.

- Installing with `uv` is unlikely to work on windows, but I don't have windows so don't know. Use `pixi` with windows.
