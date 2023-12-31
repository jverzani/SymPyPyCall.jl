module SymPyPyCall

using SymPyCore

using PyCall

const _PyType = PyCall.PyObject
_pynull() = PyCall.PyNULL()   # for more generic usage
_copy!(a, b) = PyCall.copy!(a,b)     # for more generic usage
_pyimport(a) = PyCall.pyimport(a)
_pyimport_conda(a,b) = PyCall.pyimport_conda(a, b)
_pyobject(x) = PyCall.PyObject(x)
_pytype_mapping(typ,a)  = PyCall.pytype_mapping(typ, a)

core_src_path = joinpath(pathof(SymPyPyCall.SymPyCore), "../../src/SymPy")
include(joinpath(core_src_path, "sympy.jl"))

include("python_connection.jl")
include("deprecated.jl")

end
