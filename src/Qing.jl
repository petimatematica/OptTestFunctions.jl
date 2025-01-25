# Qing function
# Reference: QING, Anyong. Dynamic differential evolution strategy and applications in electromagnetic inverse 
# scattering problems. IEEE Transactions on Geoscience and remote Sensing, v. 44, n. 1, p. 116-125, 2005.

function qing_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n 
        sum += (x[i]^2 - i)^2
    end
    
    return sum
end

function qing_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)

    for i in 1:n 
        xi = x[i]
        g[i] = 4 * xi * (xi^2 - i)
    end
 
    return g
end

function qing_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    prod = 1

    for i in 1:n 
        prod *= x[i]
    end

    for i in 1:n
        H[i, i] = 12 * x[i]^2 - 4 * i
    end

    return H
end
















