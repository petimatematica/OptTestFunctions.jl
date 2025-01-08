# Rastrigin Function
# Reference: H. Pohlheim. Examples of objective functions. Retrieved, 4(10):2012, 2007.

function rastrigin_fun(x::Vector{<:Real}, n::Int64)
    sum = 0
    for i = 1:n
        xi = x[i]
        sum = sum + (xi^2 - 10 * cos(2 * π * xi))
    end
    y = 10 * n + sum
    return y
end

function rastrigin_grad(x::Vector{<:Real}, n::Int64)
    grad = zeros(n)
    for i = 1:n
        xi = x[i]
        grad[i] = 2 * xi + 20 * π * sin(2 * π * xi)
    end
    return grad
end

function rastrigin_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(n, n)
    for i = 1:n
        H[i, i] = 2 + 40 * π^2 * cos(2 * π * x[i])
    end
    return H
end
