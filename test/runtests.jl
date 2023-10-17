if lowercase(get(ENV, "CI", "false")) == "true"
    include("install_dependencies.jl")
end

using SymPyPyCall

path = joinpath(pathof(SymPyPyCall.SymPyCore), "../../test")
include(joinpath(path, "runtests-sympycore.jl"))
