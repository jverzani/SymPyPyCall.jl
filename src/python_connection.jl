## PyCall specific usage
SymPyCore._convert(::Type{T}, x) where {T} = convert(T, x)


## Modifications for ↓, ↑
Sym(x::Nothing) = Sym(PyCall.PyObject(nothing))
SymPyCore.:↓(x::PyCall.PyObject) = x
SymPyCore.:↓(d::Dict) = Dict(↓(k) => ↓(v) for (k,v) ∈ pairs(d))
SymPyCore.:↓(x::Set) = _sympy_.sets.FiniteSet((↓(xi) for xi ∈ x)...)
SymPyCore.:↑(::Type{<:AbstractString}, x) = PyObject(x)

# ↑ for matrices
_up_matrix(m) = map(↑, m.tolist())



# hash (work around pending PyCall release with its own hash)
function Base.hash(x::SymbolicObject{T}, h::UInt) where {T <: PyCall.PyObject}
    o = ↓(x)
    px = ccall((PyCall.@pysym :PyObject_Hash), PyCall.Py_hash_t, (PyCall.PyPtr,), o) # from PyCall.jl
    reinterpret(UInt, Int(px)) - 3h                                                  # from PythonCall.jl
end


# should we also have different code path for a::String like  PyCall?
function Base.getproperty(x::SymbolicObject{T}, a::Symbol) where {T <: PyCall.PyObject}
    a == :o && return getfield(x,a)
    val = ↓(x)
    if hasproperty(val, a)
        meth = PyCall.__getproperty(val, a)
        (meth == PyObject(nothing)) && return nothing

        if hasproperty(meth, :is_Boolean)
            o = Sym(meth.is_Boolean)
            o == Sym(true) && return true
            a == :is_Boolean && return o == Sym(False) ? false : nothing
        end

        if hasproperty(meth, :__class__) && meth.__class__.__name__ == "bool"
            a = Sym(meth)
            return a == Sym(true) ? true :
                a == Sym(false) ? false : nothing
        end

        # treat modules, callsm others differently
        if hasproperty(meth, :__class__) && meth.__class__.__name__ == "module"
            return Sym(meth)
        end

        if hasproperty(meth, :__call__)
            meth = getproperty(meth, "__call__")

            return SymPyCore.SymbolicCallable(meth)
        end
        return Sym(convert(PyCall.PyAny, meth))
    end
    # nothing?
    nothing
end


# do we need this conversion?
#Base.convert(::Type{T}, o::Py) where {T <: Sym} = T(o)
