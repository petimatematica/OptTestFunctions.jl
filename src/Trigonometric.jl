# Trigonometric function

# Reference: FU, Michael C.; HU, Jiaqiao; MARCUS, Steven I. Model-based randomized methods for global optimization. 
# In: Proceedings of the 17th international symposium on mathematical theory of networks and systems. 2006. p. 355-363.

function trigonometric_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n 
        xi = x[i]
        sum += 8 * (sin(7 * (xi - 0.9)^2))^2 + 6 * (sin(14 * (xi - 0.9)^2))^2 + (xi - 0.9)^2
    end

    y = 1 + sum
    
    return y
end

function trigonometric_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)

    for i in 1:n
        xi = x[i]
        term1 = 224 * sin(7 * (xi - 0.9)^2) * cos(7 * (xi - 0.9)^2) * (xi - 0.9)
        term2 = (336 * sin(14 * (xi - 0.9)^2) * cos(14 * (xi - 0.9)^2) + 2) * (xi - 0.9)
        g[i] = term1 + term2
    end
 
    return g
end

function trigonometric_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    
    for i in 1:n
        xi = x[i]
        A = xi - 0.9
        term1 = 224 * sin(7 * A^2) * cos(7 * A^2) + 336 * sin(14 * A^2) * cos(14 * A^2) + 2
        term2 = A^2 * (3136 * (cos(7 * A^2)^2 - sin(7 * A^2)^2) + 9408 * (cos(14 * A^2)^2 - sin(14 * A^2)^2))
        H[i, i] = term1 + term2       
    end

    return H
end