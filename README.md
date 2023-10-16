# SymPyPyCall

[![Docs](https://img.shields.io/badge/docs-dev-blue.svg)](https://jverzani.github.io/SymPyCore.jl/dev)
[![Build Status](https://github.com/jverzani/SymPyPyCall.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/jverzani/SymPyPyCall.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/jverzani/SymPyPyCall.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/jverzani/SymPyPyCall.jl)


[SymPyCore](https://github.com/jverzani/SymPyCore.jl) provides a `Julia`n interface to the [SymPy](https://www.sympy.org/) library of Python.


`SymPyPyCall`  utilizes `SymPyCore` and the `PyCall` package (to provide the interop between `Julia` and `Python`) to enable access to Python's SymPy library using the practices and idioms of `Julia`.

The package [SymPyPythonCall](https://github.com/jverzani/SymPyPythonCall.jl) does a similar thing with the `PythonCall` package providing the interop.

!!! note
    It is anticipated that this package will be renamed `SymPy` at the next breaking change of the [SymPy](https://github.com/JuliaPy/SymPy.jl) package. As such, it is not expected that this package will be registered. To install this package, use `Pkg.add(PackageSpec(url="https://github.com/jverzani/SymPyPyCall.jl"))`.


## Installation

Installing this package should install the `SymPyCore` package and the `PyCall` package. The `PyCall` package installs a `Conda` package that installs the underlying SymPy library for Python.
