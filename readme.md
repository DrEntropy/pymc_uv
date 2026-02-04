This repo is a quick demo showing that PyMC works well with `uv` on macOS.

It includes:
- A `uv`-managed environment with `pymc` and `jupyter`
- A simple linear regression demo notebook: `pymc_linear_regression.ipynb`
- A BLAS sanity check via PyTensor’s `check_blas.py`

## Setup
From the repo root:

```
uv sync
```

## BLAS check
To test, use this:

```
uv run python .venv/lib/python3.12/site-packages/pytensor/misc/check_blas.py
```

Or whatever path is right (use `uv run python -c "import pytensor.misc.check_blas as cb; print(cb.__file__)"` to find the path).

## Notebook
Launch Jupyter and open the demo notebook:

```
uv run jupyter notebook
```

Then open `pymc_linear_regression.ipynb` and run all cells.

## Notes
- This was tested on macOS with Python 3.12.
- This is unlikely to work on windows.
