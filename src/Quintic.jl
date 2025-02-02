# Quintic function

# Reference: MISHRA, Sudhanshu K. Global optimization by differential evolution and particle 
# swarm methods: Evaluation on some benchmark functions. Available at SSRN 933827, 2006.

function quintic_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n 
        xi = x[i]
        sum += abs(xi^5 - 3 * xi^4 + 4 * xi^3 + 2 * xi^2 - 10 * xi - 4)
    end
    
    return sum
end

function quintic_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)

    for i in 1:n
        xi = x[i]
        term = xi^5 - 3 * xi^4 + 4 * xi^3 + 2 * xi^2 - 10 * xi - 4
        g[i] = sign(term) * (5 * xi^4 - 12 * xi^3 + 12 * xi^2 + 4 * xi - 10)
    end
 
    return g
end

function quintic_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    
    for i in 1:n
        xi = x[i]
        term = xi^5 - 3 * xi^4 + 4 * xi^3 + 2 * xi^2 - 10 * xi - 4
        H[i, i] = sign(term) * (20 * xi^3 - 36 * xi^2 + 24 * xi + 4)    
    end

    return H
end

