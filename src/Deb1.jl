# Deb 1 function

# Reference: MOMIN, Jamil; YANG, Xin-She. A literature survey of benchmark functions for global optimization problems. 
# Journal of Mathematical Modelling and Numerical Optimisation, v. 4, n. 2, p. 150-194, 2013.

function deb1_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n 
        sum += (sin(5 * π * x[i]))^6
    end

    y = - (1 / n) * sum  
    
    return y
end

function deb1_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)

    for i in 1:n 
        xi = x[i]
        g[i] = - (30 * π / n) * (sin(5 * π * xi))^5 * cos(5 * π * xi)
    end
 
    return g
end

function deb1_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)

    for i in 1:n 
        xi = x[i]
        sin_xi = sin(5 * π * xi)
        cos_xi = cos(5 * π * xi)

        H[i, i] = (150 * π^2 / n) * sin_xi^6 - (750 * π^2 / n) * sin_xi^4 * cos_xi^2
    end

    return H
end



