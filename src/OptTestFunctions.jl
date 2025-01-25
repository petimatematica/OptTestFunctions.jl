module OptTestFunctions

include("Ackley.jl")
include("Alpine1.jl")
include("Alpine2.jl")
include("Chung.jl")
include("CosineMix.jl")
include("Csendes.jl")
include("Deb1.jl")
include("Deb2.jl")
include("Dejong.jl")
include("DixonPrice.jl")
include("Ellipsoid1.jl")
include("Ellipsoid2.jl")
include("Griewangk.jl")
include("Levy.jl")
include("Michalewicz.jl")
include("Mishra7.jl")
include("PermBeta.jl")
include("Powell.jl")
include("Qing.jl")
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
alpine1 = problem(alpine1_fun, alpine1_grad, alpine1_hess)
alpine2 = problem(alpine2_fun, alpine2_grad, alpine2_hess)
chung = problem(chung_fun, chung_grad, chung_hess)
cosmix = problem(cosmix_fun, cosmix_grad, cosmix_hess)
csendes = problem(csendes_fun, csendes_grad, csendes_hess)
deb1 = problem(deb1_fun, deb1_grad, deb1_hess)
deb2 = problem(deb2_fun, deb2_grad, deb2_hess)
dejong = problem(dejong_fun, dejong_grad, dejong_hess)
dixon = problem(dixon_fun, dixon_grad, dixon_hess)
ellipsoid1 = problem(ellipsoid1_fun, ellipsoid1_grad, ellipsoid1_hess)
ellipsoid2 = problem(ellipsoid2_fun, ellipsoid2_grad, ellipsoid2_hess)
exponential = problem(exponential_fun, exponential_grad, exponential_hess)
griewangk = problem(griewangk_fun, griewangk_grad, griewangk_hess)
levy = problem(levy_fun, levy_grad, levy_hess)
michalewicz = problem(michalewicz_fun, michalewicz_grad, michalewicz_hess)
mishra7 = problem(mishra7_fun, mishra7_grad, mishra7_hess)
permbeta = problem(permbeta_fun, permbeta_grad, permbeta_hess)
powell = problem(powell_fun, powell_grad, powell_hess)
qing = problem(qing_fun, qing_grad, qing_hess)
rastrigin = problem(rastrigin_fun, rastrigin_grad, rastrigin_hess)
rosen = problem(dixon_fun, dixon_grad, dixon_hess)
schwefel = problem(schwefel_fun, schwefel_grad, schwefel_hess)
stytang = problem(stytang_fun, stytang_grad, stytang_hess)
sumpower = problem(sumpower_fun, sumpower_grad, sumpower_hess)
trid = problem(trid_fun, trid_grad, trid_hess)
zakharov = problem(zakharov_fun, zakharov_grad, zakharov_hess)

export ackley, alpine1, alpine2, chung, cosmix, csendes, deb1, deb2, dejong, dixon, 
       ellipsoid1, ellipsoid2, exponential, griewangk, levy, michalewicz, mishra7, permbeta, 
       powell, qing, rastrigin, rosen, schwefel, stytang, sumpower, trid, zakharov, problem
end
