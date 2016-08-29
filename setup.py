from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
from Cython.Distutils import build_ext
import numpy as np


numpy_include = np.get_include()
ext_modules = cythonize([Extension("pymaxflow", ["pymaxflow.pyx"],
                                   extra_compile_args=['-std=c++11'],
                                   include_dirs=[numpy_include])])

setup(
    name="pymaxflow",
    ext_modules=ext_modules,
    cmdclass={'build_ext': build_ext}
)
