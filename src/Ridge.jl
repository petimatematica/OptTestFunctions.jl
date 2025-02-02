# Modified Ridge function

# Reference: PLEVRIS, Vagelis; SOLORZANO, German. A collection of 30 multidimensional 
# functions for global optimization benchmarking. Data, v. 7, n. 4, p. 46, 2022.

function ridge_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 2:n
        sum += x[i]^2
    end
    
    y = abs(x[1]) + 2 * sum^(0.1)

    return y
end

function ridge_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    sum = 0

    for i in 2:n
        sum += x[i]^2
    end

    g[1] = sign(x[1]) 

    for i in 2:n
        g[i] = 0.4 * x[i] * sum^(- 0.9)
    end
 
    return g
end

function ridge_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    sum = 0

    for i in 2:n
        sum += x[i]^2
    end

    for i in 2:n
        H[i, i] = 0.4 * sum^(-0.9) - 0.72 * x[i]^2 * sum^(- 1.9)
    end

    for i in 2:n 
        for j in (i + 1):n
            if i !=j
                H[i, j] = - 0.72 * x[i] * x[j] * sum^(- 1.9)  
                H[j, i] = H[i, j]
            end
        end
    end

    return H
end

