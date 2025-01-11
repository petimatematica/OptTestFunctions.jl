# Schwefel's function
# Reference: MOLGA, Marcin; SMUTNICKI, Czesław. Test functions for optimization needs. Test functions for optimization needs, v. 101, p. 48, 2005.

function schwefel_fun(x::Vector{<:Real})
    n = length(x)
    sum = 0

    for i in 1:n
        xi = x[i]
        sum += - xi * sin(sqrt(abs(xi))) 
    end
    return sum
end

function schwefel_grad(x::Vector{<:Real})
    n = length(x)
    g = zeros(Float64, n)

    for i in 1:n 
        xi = x[i]
        mod_xi = abs(xi)
        sqrt_xi = sqrt(mod_xi)
        g[i] = - sin(sqrt_xi) - (xi^2 * cos(sqrt_xi)) / (2 * mod_xi * sqrt_xi)
    end

    return g
end

function schwefel_hess(x::Vector{<:Real})
    n = length(x)
    H = zeros(Float64, n, n)
    
    for i in 1:n
        xi = x[i]
        mod_xi = abs(xi)
        sqrt_xi = sqrt(mod_xi)
        sin_xi = sin(sqrt_xi)
        cos_xi = cos(sqrt_xi)
        
        term1 = (- cos_xi * xi) / (2 * sqrt_xi * mod_xi)
        term2 = (4 * xi * cos_xi * mod_xi^(3 / 2) * sqrt_xi - xi^3 * sin_xi * sqrt_xi - 3 * xi^3 * cos_xi) / (4 * mod_xi^3 * sqrt_xi)

        H[i, i] = term1 - term2
    end

    return H
end





























