# Alpine 1 Function
# Reference: RAHNAMAYAN, Shahryar; TIZHOOSH, Hamid R.; SALAMA, Magdy MA. A novel population initialization method for accelerating evolutionary algorithms. 
# Computers & Mathematics with Applications, v. 53, n. 10, p. 1605-1614, 2007.

function alpine1_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n 
        xi = x[i]
        sum += abs(xi * sin(xi) + 0.1 * xi)
    end

    return sum
end
 
function alpine1_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n) 

    for i in 1:n
        xi = x[i] 
        x_sin = xi * sin(xi) + 0.1 * xi

        g[i] = x_sin / abs(x_sin) * (sin(xi) + xi * cos(xi) + 0.1)
    end

    return g
end
 
function alpine1_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)

    for i in 1:n 
        xi = x[i] 
        x_sin = xi * sin(xi) + 0.1 * xi
        H[i, i] = x_sin / abs(x_sin) * (2 * cos(xi) - xi * sin(xi))
    end

    return H
end
