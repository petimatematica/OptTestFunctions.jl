# Exponential function

# Reference: RAHNAMAYAN, Shahryar; TIZHOOSH, Hamid R.; SALAMA, Magdy MA. Opposition-based differential evolution (ODE) with variable jumping rate. 
# In: 2007 IEEE symposium on foundations of computational intelligence. IEEE, 2007. p. 81-88.

function exponential_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n 
        sum += x[i]^2
    end

    y = - exp(- 0.5 * sum)
    
    return y
end

function exponential_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    sum = 0

    for i in 1:n 
        sum += x[i]^2
    end

    for i in 1:n 
        g[i] = x[i] * exp(- 0.5 * sum)
    end
 
    return g
end

function exponential_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    sum = 0

    for i in 1:n 
        sum += x[i]^2
    end

    for i in 1:n
        H[i, i] = exp(- 0.5 * sum) * (1 - x[i]^2)
    end
    
    for i in 1:n
        for j in (i + 1):n  
            H[i, j] = - x[i] * x[j] * exp(- 0.5 * sum)
            H[j, i] = H[i, j] 
        end
    end

    return H
end