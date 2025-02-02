# Quartic function

# Reference: STORN, Rainer; PRICE, Kenneth. Differential evolution–a simple and efficient heuristic 
# for global optimization over continuous spaces. Journal of global optimization, v. 11, p. 341-359, 1997.

function quartic_fun(x::Vector{<:Real}, n::Int64)
    sum = 0
    
    for i in 1:n
        sum += i * x[i]^4
    end

    y = sum + rand()
    
    return y
end

function quartic_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)

    for i in 1:n

        g[i] = 4 * i * x[i]^3
    end
 
    return g
end

function quartic_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    
    for i in 1:n
        H[i, i] = 12 * i * x[i]^2     
    end

    return H
end