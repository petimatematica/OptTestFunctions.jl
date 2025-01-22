# Cosine Mixture function
# Reference: ALI, M. Montaz; KHOMPATRAPORN, Charoenchai; ZABINSKY, Zelda B. A numerical evaluation 
# of several stochastic algorithms on selected continuous global optimization test problems. Journal of global optimization, v. 31, p. 635-672, 2005.

function cosmix_fun(x::Vector{<:Real}, n::Int64)
    sum1 = 0
    sum2 = 0

    for i in 1:n
        xi = x[i] 
        sum1 += cos(5 * π * xi)
        sum2 += xi^2
    end
    
    y = - 0.1 * sum1 - sum2
    
    return y
end

function cosmix_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)

    for i in 1:n 
        xi = x[i]
        g[i] = 0.5 * π * sin(5 * π * xi) - 2 * xi
    end
    
    return g
end

function cosmix_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)

    for i in 1:n 
        H[i, i] = 2.5 * π^2 * cos(5 * π * x[i]) - 2
    end

    return H
end














