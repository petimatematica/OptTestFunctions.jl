# Sum of different power 2 function

# Reference: TAN, Y. Chapter 12-A CUDA-Based Test Suit. Gpu-Based Parallel Implementation of Swarm Intelligence Algorithms; Tan, Y., Ed, p. 179-206, 2016.

function sumpower2_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n
        sum += abs(x[i])^(2 + (4 * (i - 1) / (n - 1)))
    end
    
    y = sqrt(sum)

    return y
end

function sumpower2_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    sum = 0

    for i in 1:n
        sum += abs(x[i])^(2 + (4 * (i - 1) / (n - 1)))
    end

    for i in 1:n
        xi = x[i]
        g[i] = ((2 + (4 * (i - 1) / (n - 1))) * abs(xi)^(1 + (4 * (i - 1) / (n - 1))) * sign(xi)) / (2 * sqrt(sum))
    end
 
    return g
end

function sumpower2_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    sum = 0

    for i in 1:n
        sum += abs(x[i])^(2 + (4 * (i - 1) / (n - 1)))
    end

    for i in 1:n
        xi = x[i]
        A = (2 + (4 * (i - 1) / (n - 1))) * abs(xi)^(1 + (4 * (i - 1) / (n - 1))) * sign(xi)
        d_A = (2 + 4 * ((i - 1) / (n - 1))) * (1 + 4 * ((i - 1) / (n - 1))) * abs(xi)^(4 * ((i - 1) / (n - 1)))
        B = 2 * sqrt(sum)
        d_B = ((2 + (4 * (i - 1) / (n - 1))) * abs(xi)^(1 + (4 * (i - 1) / (n - 1))) * sign(xi)) / sqrt(sum)
        H[i, i] = (d_A * B - A * d_B) / B^2
    end

    for i in 1:n 
        for j in 1:n
            if i !=j
                xi = x[i]
                xj = x[j]
                A = (2 + (4 * (i - 1) / (n - 1))) * abs(xi)^(1 + (4 * (i - 1) / (n - 1))) * sign(xi)
                B = 2 * sqrt(sum)
                d_B = ((2 + (4 * (j - 1) / (n - 1))) * abs(xj)^(1 + (4 * (j - 1) / (n - 1))) * sign(xj)) / sqrt(sum)
    
                H[i, j] = (- A * d_B) / B^2  
            end
        end
    end

    return H
end