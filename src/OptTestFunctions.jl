module OptTestFunctions

include("Ackley.jl")
include("Dejong.jl")
include("DixonPrice.jl")
include("Ellipsoid1.jl")
include("Ellipsoid2.jl")
include("Griewangk.jl")
include("Levy.jl")
include("Michalewicz.jl")
include("Powell.jl")
include("Rastrigin.jl")
include("Rosenbrock.jl")
include("Schwefel.jl")
include("Stytang.jl")
include("Sumpower.jl")
include("Trid.jl")
include("Zakharov.jl")

struct problem{F1, F2, F3}
    fun::F1   # Objective function
    grad::F2  # Gradient function
    hess::F3  # Hessian function
end

ackley = problem(ackley_fun, ackley_grad, ackley_hess)
dejong = problem(dejong_fun, dejong_grad, dejong_hess)
dixon = problem(dixon_fun, dixon_grad, dixon_hess)
ellipsoid1 = problem(ellipsoid1_fun, ellipsoid1_grad, ellipsoid1_hess)
ellipsoid2 = problem(ellipsoid2_fun, ellipsoid2_grad, ellipsoid2_hess)
griewangk = problem(griewangk_fun, griewangk_grad, griewangk_hess)
levy = problem(levy_fun, levy_grad, levy_hess)
michalewicz = problem(michalewicz_fun, michalewicz_grad, michalewicz_hess)
powell = problem(powell_fun, powell_grad, powell_hess)
rastrigin = problem(rastrigin_fun, rastrigin_grad, rastrigin_hess)
rosen = problem(dixon_fun, dixon_grad, dixon_hess)
schwefel = problem(schwefel_fun, schwefel_grad, schwefel_hess)
stytang = problem(stytang_fun, stytang_grad, stytang_hess)
sumpower = problem(sumpower_fun, sumpower_grad, sumpower_hess)
trid = problem(trid_fun, trid_grad, trid_hess)
zakharov = problem(zakharov_fun, zakharov_grad, zakharov_hess)

export ackley, dejong, dixon, ellipsoid1, ellipsoid2, griewangk, levy, michalewicz, 
       powell, rastrigin, rosen, schwefell, stytang, sumpower, trid, zakharov, problem
end
