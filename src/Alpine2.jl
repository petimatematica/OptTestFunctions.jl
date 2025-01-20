# Alpine 2 Function
# Reference: JAMIL, Momin; YANG, Xin-She. A literature survey of benchmark functions for global optimisation problems. 
# International Journal of Mathematical Modelling and Numerical Optimisation, v. 4, n. 2, p. 150-194, 2013.

# x_i >= 0

function alpine2_fun(x::Vector{<:Real}, n::Int64)
    prod = 1

    for i in 1:n
        xi = x[i] 
        prod *= sqrt(xi) * sin(xi)
    end

    return prod
end
 
function alpine2_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    prod = 1 

    for i in 1:n
        xi = x[i] 
        prod *= sqrt(xi) * sin(xi)
    end

    for i in 1:n
        xi = x[i]
        g[i] = prod * (1 / (2 * xi) + cot(xi))
    end

    return g
end
 
function alpine2_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    prod = 1

    for i in 1:n
        xi = x[i] 
        prod *= sqrt(xi) * sin(xi)
    end

    for i in 1:n
        for j in 1:n
            xi = x[i]
            xj = x[j]
            cot_xi = cot(xi) 
            if i == j
               H[i, i] = prod * (1 / (2 * xi) + cot_xi)^2 - prod * (1 / (2 * xi^2) + csc(xi)^2)
            else
               H[i, j] = prod * (1 / (2 * xj) + cot(xj)) * (1 / (2 * xi) + cot_xi)
            end
        end 
    end

    return H
end
