# RAYLEIGH FUNCTION

# REFERENCE:
# BALSUBRAMANI, Akshay; DASGUPTA, Sanjoy; FREUND, Yoav. The fast convergence of incremental PCA. Advances in neural information processing systems, v. 26, 2013.

using LinearAlgebra

function rayleigh_fun(x::Vector{<:Real}, A::Matrix{<:Real})
    fx = x' * A * x / (x' * x)
    return fx[1]
end

function rayleigh_grad(x::Vector{<:Real}, A::Matrix{<:Real})
    2 * (A * x - rayleigh_fun(x, A) * x) / (x' * x)
end

#x = [1, 2, 3]
#k = michalewicz_fun(x)
# h = zakharov_grad(x)

x = [-658, 6778, 456, 456, 56, 38, 67]
#x = [1, 2, 3]
#x = [10]
y = michalewicz_grad(x) 
#z = michalewicz_hess(x)

t = ForwardDiff.gradient(michalewicz_fun, x)
#u = ForwardDiff.hessian(michalewicz_fun, x)

println("Algébrico = ", y)
println("ForwardDiff = ", t)