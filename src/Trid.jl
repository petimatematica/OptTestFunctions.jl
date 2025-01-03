# Trid Function 
# Reference: E. P. Adorio and U. Diliman. Mvf-multivariate test functions library in c for unconstrained
# global optimization. Quezon City, Metro Manila, Philippines, 44, 2005.

function trid_fun(x::Vector{<:Real}, n::Int64)
    sum1 = (x[1] - 1)^2
    sum2 = 0
    for i in 2:n 
        sum1 = sum1 + (x[i] - 1)^2
        sum2 = sum2 + x[i] * x[i-1]
    end
    return sum1 - sum2
end

function trid_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(n) 

    g[1] = 2 * (x[1] - 1) - x[2]

    for k in 2:(n-1)
        g[k] = 2 * (x[k] - 1) - x[k-1] - x[k+1]
    end

    g[n] = 2 * (x[n] - 1) - x[n-1]

    return g
end

function trid_hess(x::Vector{<:Real}, n::Int64)
    h = zeros(n, n)

    if n == 1
        h[1, 1] = 2  
    else
        h[1, 1] = 2
        h[1, 2] = -1 

        for i in 2:(n - 1)
            h[i, i] = 2 
            h[i, i - 1] = -1 
            h[i, i + 1] = -1 
            
            h[i - 1, i] = h[i, i - 1]
            h[i + 1, i] = h[i, i + 1]
        end

        h[n, n] = 2
        h[n, n - 1] = -1
        h[n - 1, n] = h[n, n - 1]
    end

    return h
end