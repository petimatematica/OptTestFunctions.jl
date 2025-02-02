# Mishra 07 function

# Reference: JAMIL, Momin; YANG, Xin-She. A literature survey of benchmark functions for global optimisation problems. 
# International Journal of Mathematical Modelling and Numerical Optimisation, v. 4, n. 2, p. 150-194, 2013.

function mishra7_fun(x::Vector{<:Real}, n::Int64)
    prod = 1

    for i in 1:n 
        prod *= x[i]
    end

    y = (prod - factorial(n))^2
    
    return y
end

function mishra7_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    prod = 1

    for i in 1:n 
        prod *= x[i]
    end

    for i in 1:n 
        g[i] = 2 * (prod - factorial(n)) * prod / x[i]
    end
 
    return g
end

function mishra7_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    prod = 1

    for i in 1:n 
        prod *= x[i]
    end

    for i in 1:n
        H[i, i] = 2 * prod^2 / x[i]^2
    end
    
    for i in 1:n
        for j in (i + 1):n
            xi = x[i]
            xj = x[j]  
            H[i, j] = 2 * prod^2 / (xi * xj) + 2 * (prod - factorial(n)) * prod / (xi * xj)
            H[j, i] = H[i, j] 
        end
    end

    return H
end










