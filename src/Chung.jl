# Chung Reynolds function

# Reference: CHUNG, Chan-Jin; REYNOLDS, Robert G. CAEP: An evolution-based tool for real-valued function optimization using cultural algorithms. 
# International Journal on Artificial Intelligence Tools, v. 7, n. 03, p. 239-291, 1998.

function chung_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n
        sum += x[i]^2
    end

    return sum^2
end
 
function chung_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    sum = 0

    for i in 1:n 
        sum += x[i]^2
    end

    for i in 1:n 
        g[i] = 4 * x[i] * sum
    end
    
    return g
end
 
function chung_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    sum = 0

    for i in 1:n 
        sum += x[i]^2
    end

    for i in 1:n 
        for j in 1:n
            xi = x[i]
            xj = x[j]

            if i == j
               H[i, i] = 4 * sum + 8 * xi^2
            else
               H[i, j] = 8 * xi * xj 
            end 
        end
    end

    return H
end
