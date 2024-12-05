module OptTestFunctions

include("DixonPrice.jl")
include("Rosenbrock.jl")

struct problem
    fun::Function   # Objective function
    grad::Function  # Gradient function
    hess::Function  # Hessian function
end

dixon = problem(dixon_fun, dixon_grad, dixon_hess)
rosen = problem(dixon_fun, dixon_grad, dixon_hess)

export dixon, rosen, problem
end
