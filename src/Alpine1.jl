# Alpine 1 Function
# Reference: JAMIL, Momin; YANG, Xin-She. A literature survey of benchmark functions for global optimisation problems. 
# International Journal of Mathematical Modelling and Numerical Optimisation, v. 4, n. 2, p. 150-194, 2013.

function alpine1_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n 
        xi = x[i]
        sum += abs(xi * sin(xi) + 0.1 * xi)
    end

    return sum
end
 
function alpine1_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n) 

    for i in 1:n
        xi = x[i] 
        x_sin = xi * sin(xi) + 0.1 * xi

        g[i] = x_sin / abs(x_sin) * (sin(xi) + xi * cos(xi) + 0.1)
    end

    return g
end
 
function alpine1_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)

    for i in 1:n 
        xi = x[i] 
        x_sin = xi * sin(xi) + 0.1 * xi
        H[i, i] = x_sin / abs(x_sin) * (2 * cos(xi) - xi * sin(xi))
    end

    return H
end
