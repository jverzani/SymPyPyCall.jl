# deprecations
# names(SymPy)

# ["@symfuns", "@syms", "@vars", "Abs", "And", "Differential", "DiracDelta", "Eq", "Equality", "False", "Ge", "GreaterThan", "Gt", "Heaviside", "IM", "Lambda", "Le", "LessThan", "Lt", "Max", "Min", "N", "Ne", "Not", "Or", "PI", "Permutation", "PermutationGroup", "StrictGreaterThan", "StrictLessThan", "Sym", "SymFunction", "SymMatrix", "SymPermutation", "SymPermutationGroup", "SymPy", "True", "Unequality", "VectorField", "Wild", "Xor", "apart", "ask", "bernfrac", "cancel", "conjugate", "cse", "degree", "denom", "doctests", "doit", "dsolve", "e1", "ei", "elements", "expand", "expj", "expjpi", "fac", "factor", "fib", "flatten", "free_symbols", "hessian", "import_from", "integrate", "interpolate", "intersection", "intervals", "isolate", "isprime", "lambdify", "lhs", "limit", "line_integrate", "linsolve", "ln", "monitor", "multiplicity", "nint", "nonlinsolve", "nroots", "nsimplify", "nsolve", "numer", "ode_order", "oo", "pdsolve", "plot_implicit", "plot_parametric_surface", "prime", "real_root", "real_roots", "refine", "rgamma", "rhs", "root", "rootof", "roots", "rsolve", "series", "simplify", "solve", "solveset", "srepr", "subs", "summation", "symbols", "sympify", "sympy", "sympy_core", "sympy_matrices", "sympy_plotting", "timing", "together", "transpositions", "unflatten", "zoo", "¬", "∧", "∨", "≦", "≧", "≪", "≫", "≶", "≷", "⩵", "𝑄"]

## lots to do here
Base.@deprecate expand_trig(x) x.expand_trig() true
Base.@deprecate_binding Q 𝑄

function unSym(x)
    Base.depwarn("`unSym` is deprecated. Use `↓(x)`.", :unSym)
    ↓(x)
end

function asSymbolic(x)
    Base.depwarn("`asSymbolic` is deprecated. Use `↑(x)`.", :asSymbolic)
    ↑(x)
end

function VectorField(args...; kwargs...)
    Base.depwarn("`VectorField` has been removed", :VectorField)
    nothing
end

function plot_implicit(args...; kwargs...)
    Base.depwarn("`plot_implicit` has been removed. See `sympy.plotting.plot_implicit`", :VectorField)
    nothing
end

function plot_parametric_surface(args...; kwargs...)
    Base.depwarn("`VectorField` has been removed. See `sympy.plotting.plot3d_parametric_surface`", :plot_parametric_surface)
    nothing
end
