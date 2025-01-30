# High Conditioned Elliptic function

# Reference: TAN, Y. Chapter 12-A CUDA-Based Test Suit. Gpu-Based Parallel Implementation of Swarm Intelligence Algorithms; Tan, Y., Ed, p. 179-206, 2016.

function elliptic_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n
        sum += 10^(6 * (i - 1) / (n - 1)) * x[i]^2
    end
    
    return sum
end

function elliptic_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)

    for i in 1:n
        g[i] = 2 * 10^(6 * (i - 1) / (n - 1)) * x[i]
    end
 
    return g
end

function elliptic_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)

    for i in 1:n
        H[i, i] = 2 * 10^(6 * (i - 1) / (n - 1))
    end

    return H
end