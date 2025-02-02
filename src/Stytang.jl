# Styblinsky-Tang function

# Reference: AFFAN, Mohammad. Meta-heuristic based optimization algorithms: a comparative study of genetic algorithm and particle swarm optimization. 2017.

function stytang_fun(x::Vector{<:Real}, n::Int64)
    sum = 0
    for i = 1:n
        xi = x[i]
        new = xi^4 - 16 * xi^2 + 5 * xi
        sum = sum + new
    end

    y = sum / 2
    
    return y
end
 
function stytang_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)  

    for i in 1:n
        xi = x[i] 
        g[i] = 2 * xi^3 - 16 * xi + 5 / 2
    end

    return g
end
 
function stytang_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    
    for i in 1:n
        xi = x[i] 
        H[i, i] = 6 * xi^2 - 16
    end

    return H
end