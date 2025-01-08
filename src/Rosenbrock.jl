# Rosenbrock Function
# Reference: L. C. W. Dixon and R. Price. Truncated newton method for sparse unconstrained optimization
# using automatic differentiation. Journal of Optimization Theory and Applications, 60:261–275, 1989.
# n > 1

function rosen_fun(x::Vector{<:Real}, n::Int64)
    f = 0.0
    for i in 1:(n - 1)
        xi = x[i]
        f += 100.0 * (x[i+1] - xi^2)^2 + (1.0 - xi)^2
    end
    return f
end

function rosen_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    for i in 1:n
        xi = x[i]
        if i == 1
            g[i] = -400.0 * xi * (x[i+1] - x[i]^2) + 2.0 * (xi - 1.0)
        elseif i == n
            g[i] = 200.0 * (xi - x[i-1]^2)
        else
            g[i] = 200.0 * (xi - x[i-1]^2) - 400.0 * xi * (x[i+1] - xi^2) + 2.0 * (xi - 1.0)
        end
    end
    return g
end

function rosen_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    for i in 1:n
        xi = x[i]
        if i == 1
            H[i, i] = 1200.0 * xi^2 - 400.0 * x[i+1] + 2.0
            H[i, i+1] = -400.0 * xi
        elseif i == n
            H[i, i] = 200.0
            H[i, i-1] = -400.0 * x[i-1]
        else
            H[i, i] = 1200.0 * xi^2 - 400.0 * x[i+1] + 2.0 +200
            H[i, i-1] = -400.0 * x[i-1]
            H[i, i+1] = -400.0 * xi
        end
    end
    return H
end
