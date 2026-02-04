import pathlib, pytensor, runpy

path = pathlib.Path(pytensor.__file__).parent / "misc" / "check_blas.py"
runpy.run_path(str(path), run_name="__main__")
