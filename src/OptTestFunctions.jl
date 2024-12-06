module OptTestFunctions

include("DixonPrice.jl")
include("Rosenbrock.jl")

struct problem{F1, F2, F3}
    fun::F1   # Objective function
    grad::F2  # Gradient function
    hess::F3  # Hessian function
end

dixon = problem(dixon_fun, dixon_grad, dixon_hess)
rosen = problem(dixon_fun, dixon_grad, dixon_hess)

export dixon, rosen, problem
end
