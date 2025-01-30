# Mishra 1 function

# Reference: MISHRA, Sudhanshu K. Performance of differential evolution and particle swarm methods 
# on some relatively harder multi-modal benchmark functions. Available at SSRN 937147, 2006.

# 0 <= xi <= 1

function mishra1_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:(n - 1) 
        sum += x[i]
    end

    y = (1 + n - sum)^(n - sum)
    
    return y
end

function mishra1_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    sum = 0

    for i in 1:(n - 1) 
        sum += x[i]
    end

    A = n - sum

    for i in 1:(n - 1)
        g[i] = (1 + A)^A * (- log(1 + A) - A / (1 + A))
    end
 
    return g
end

function mishra1_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    sum = 0

    for i in 1:(n - 1) 
        sum += x[i]
    end

    A = n - sum

    for i in 1:(n - 1)
        for j in 1:(n - 1)
            term1 = (1 + A)^A * (- log(1 + A) - A / (1 + A))^2
            term2 = (1 + A)^A * (1 / (1 + A) + 1 / (1 + A)^2)
            H[i, j] = term1 + term2
        end
    end

    return H
end