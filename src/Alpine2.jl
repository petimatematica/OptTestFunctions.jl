# Alpine 2 Function
# Reference: CLERC, Maurice. The swarm and the queen: towards a deterministic and adaptive particle swarm optimization. 
# In: Proceedings of the 1999 congress on evolutionary computation-CEC99 (Cat. No. 99TH8406). IEEE, 1999. p. 1951-1957.

# x_i >= 0

function alpine2_fun(x::Vector{<:Real}, n::Int64)
    prod = 1

    for i in 1:n
        xi = x[i] 
        prod *= sqrt(xi) * sin(xi)
    end

    return prod
end
 
function alpine2_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    prod = 1 

    for i in 1:n
        xi = x[i] 
        prod *= sqrt(xi) * sin(xi)
    end

    for i in 1:n
        xi = x[i]
        g[i] = prod * (1 / (2 * xi) + cot(xi))
    end

    return g
end
 
function alpine2_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    prod = 1

    for i in 1:n
        xi = x[i] 
        prod *= sqrt(xi) * sin(xi)
    end

    for i in 1:n
        for j in 1:n
            xi = x[i]
            xj = x[j]
            cot_xi = cot(xi) 
            if i == j
               H[i, i] = prod * (1 / (2 * xi) + cot_xi)^2 - prod * (1 / (2 * xi^2) + csc(xi)^2)
            else
               H[i, j] = prod * (1 / (2 * xj) + cot(xj)) * (1 / (2 * xi) + cot_xi)
            end
        end 
    end

    return H
end
