# Zakharov function
#Reference: JAMIL, Momin; YANG, Xin-She. A literature survey of benchmark functions for global optimisation problems. International Journal of Mathematical Modelling and Numerical Optimisation, v. 4, n. 2, p. 150-194, 2013.

function zakharov_fun(x::Vector{<:Real}, n::Int64)
    sum1 = 0
    sum2 = 0
    
    for i = 1:n
        xi = x[i]
        sum1 = sum1 + xi^2
        sum2 = sum2 + 0.5 * i * xi
    end 
    y = sum1 + sum2^2 + sum2^4
    return y
end

function zakharov_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    sum = 0

    for i in 1:n 
        sum = sum + 0.5 * i * x[i]
    end

    for i in 1:n
        g[i] = 2 * x[i] + i * sum + 2 * i * sum^3
    end

    return g
end

function zakharov_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    sum = 0

    for i in 1:n 
        sum = sum + 0.5 * i * x[i]
    end

    for i in 1:n
        for j in 1:n 
            if i == j
                H[i, i] = 2 + 0.5 * i^2 + 3 * i^2 * sum^2 
             else
                H[i, j] = 0.5 * i * j + 3 * i * j * sum^2
            end
        end
    end

    return H
end

