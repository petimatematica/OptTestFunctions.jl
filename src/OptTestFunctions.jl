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
include("DropWave.jl")
include("Ellipsoid1.jl")
include("Ellipsoid2.jl")
include("Elliptic.jl")
include("Exponential.jl")
include("Griewangk.jl")
include("HappyCat.jl")
include("HGBat.jl")
include("Levy.jl")
include("Michalewicz.jl")
include("Mishra7.jl")
include("Mishra11.jl")
include("PermBeta.jl")
include("Powell.jl")
include("Qing.jl")
include("Quartic.jl")
include("Quintic.jl")
include("Rastrigin.jl")
include("Ridge.jl")
include("Rosenbrock.jl")
include("Salomon.jl")
include("Schwefel.jl")
include("Stytang.jl")
include("Sumpower1.jl")
include("Sumpower2.jl")
include("Trid.jl")
include("Trigonometric.jl")
include("Xinsheyang.jl")
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
dropwave = problem(dropwave_fun, dropwave_grad, dropwave_hess)
ellipsoid1 = problem(ellipsoid1_fun, ellipsoid1_grad, ellipsoid1_hess)
ellipsoid2 = problem(ellipsoid2_fun, ellipsoid2_grad, ellipsoid2_hess)
elliptic = problem(elliptic_fun, elliptic_grad, elliptic_hess)
exponential = problem(exponential_fun, exponential_grad, exponential_hess)
griewangk = problem(griewangk_fun, griewangk_grad, griewangk_hess)
happycat = problem(happycat_fun, happycat_grad, happycat_hess)
hgbat = problem(hgbat_fun, hgbat_grad, hgbat_hess)
levy = problem(levy_fun, levy_grad, levy_hess)
michalewicz = problem(michalewicz_fun, michalewicz_grad, michalewicz_hess)
mishra7 = problem(mishra7_fun, mishra7_grad, mishra7_hess)
mishra11 = problem(mishra11_fun, mishra11_grad, mishra11_hess)
permbeta = problem(permbeta_fun, permbeta_grad, permbeta_hess)
powell = problem(powell_fun, powell_grad, powell_hess)
qing = problem(qing_fun, qing_grad, qing_hess)
quartic = problem(quartic_fun, quartic_grad, quartic_hess)
quintic = problem(quintic_fun, quintic_grad, quintic_hess)
rastrigin = problem(rastrigin_fun, rastrigin_grad, rastrigin_hess)
ridge = problem(ridge_fun, ridge_grad, ridge_hess)
rosen = problem(rosen_fun, rosen_grad, rosen_hess)
salomon = problem(salomon_fun, salomon_grad, salomon_hess)
schwefel = problem(schwefel_fun, schwefel_grad, schwefel_hess)
stytang = problem(stytang_fun, stytang_grad, stytang_hess)
sumpower1 = problem(sumpower1_fun, sumpower1_grad, sumpower1_hess)
sumpower2 = problem(sumpower2_fun, sumpower2_grad, sumpower2_hess)
trid = problem(trid_fun, trid_grad, trid_hess)
trigonometric = problem(trigonometric_fun, trigonometric_grad, trigonometric_hess)
xinsheyang = problem(xinsheyang_fun, xinsheyang_grad, xinsheyang_hess)
zakharov = problem(zakharov_fun, zakharov_grad, zakharov_hess)

export ackley, alpine1, alpine2, chung, cosmix, csendes, deb1, deb2, dejong, dixon, 
       dropwave, ellipsoid1, ellipsoid2, elliptic, exponential, griewangk, happycat,
       hgbat, levy, michalewicz, mishra7, mishra11, permbeta, powell, qing, quartic, 
       quintic, rastrigin, ridge, rosen, salomon, schwefel, stytang, sumpower1, sumpower2, 
       trid, trigonometric, xinsheyang, zakharov, problem
end
