# Deb 2 function

# Reference: MOMIN, Jamil; YANG, Xin-She. A literature survey of benchmark functions for global optimization problems. 
# Journal of Mathematical Modelling and Numerical Optimisation, v. 4, n. 2, p. 150-194, 2013.

# x_i >= 0

function deb2_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n 
        sum += (sin(5 * π * (x[i]^(3 / 4) - 0.05)))^6
    end

    y = - (1 / n) * sum  
    
    return y
end

function deb2_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)

    for i in 1:n 
        xi = x[i]
        term = 5 * π * (xi^(3 / 4) - 0.05)
        g[i] = - (90 * π / (4 * n * xi^(1 / 4))) * (sin(term))^5 * cos(term)
    end
 
    return g
end

function deb2_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)

    for i in 1:n 
        xi = x[i]
        sin_term = sin(5 * π * (xi^(3 / 4) - 0.05))
        cos_term = cos(5 * π * (xi^(3 / 4) - 0.05))

        term1 = (90 * π / (16 * n * xi^(5 / 4))) * sin_term^5 * cos_term
        term2 = (1350 * π^2 / (16 * n * sqrt(xi))) * (5 * sin_term^4 * cos_term^2 - sin_term^6)

        H[i, i] = term1 - term2
    end

    return H
end













