from distutils.core import setup
from Cython.Build import cythonize

setup(
    name = "pymaxflow",
    ext_modules = cythonize('pymaxflow.pyx'),
)
