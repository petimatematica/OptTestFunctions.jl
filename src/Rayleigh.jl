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

