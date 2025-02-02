# HappyCat function

# Reference: TAN, Y. Chapter 12-A CUDA-Based Test Suit. Gpu-Based Parallel Implementation of Swarm Intelligence Algorithms; Tan, Y., Ed, p. 179-206, 2016.

function happycat_fun(x::Vector{<:Real}, n::Int64)
    sum1 = 0
    sum2 = 0

    for i in 1:n
        xi = x[i]
        sum1 += xi^2
        sum2 += xi
    end
    
    y = abs(sum1 - n)^(0.25) + (0.5 * sum1 + sum2) / n + 0.5

    return y
end

function happycat_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    sum = 0

    for i in 1:n
        sum += x[i]^2
    end

    for i in 1:n
        xi = x[i]
        g[i] = (xi / 2) * abs(sum - n)^(- 3 / 4) * sign(sum - n) + (xi + 1) / n 
    end
 
    return g
end

function happycat_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    sum = 0

    for i in 1:n
        sum += x[i]^2
    end

    for i in 1:n
        H[i, i] = (1 / 2) * abs(sum - n)^(-3 / 4) * sign(sum - n) - 3 * x[i]^2 / 4 * abs(sum - n)^(- 7 / 4) + 1 / n
    end

    for i in 1:n 
        for j in (i + 1):n
            if i !=j
                H[i, j] = - (3 / 4) * x[i] * x[j] * abs(sum - n)^(-7 / 4) * sign(sum - n)
                H[j, i] = H[i, j]
            end
        end
    end

    return H
end
