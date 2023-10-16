using SymPyPyCall

path = joinpath(pathof(SymPyPyCall.SymPyCore), "../../test")
include(joinpath(path, "runtests-sympycore.jl"))
