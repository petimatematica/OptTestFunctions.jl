# Sum of different power function
# Reference: MOLGA, Marcin; SMUTNICKI, Czesław. Test functions for optimization needs. Test functions for optimization needs, v. 101, p. 48, 2005.

function sumpower_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n 
        sum += (abs(x[i]))^(i + 1)
    end

    return sum
end

function sumpower_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n) 
    
    for i in 1:n
        xi = x[i] 
        g[i] = (i + 1) * xi * abs(xi)^(i - 1)
    end
    
    return g
end

function sumpower_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)

    for i in 1:n 
        xi = x[i]
        mod_xi = abs(xi)
        H[i, i] = (i + 1) * mod_xi^(i - 1) + (i + 1) * (i - 1) * xi^2 * mod_xi ^ (i - 3.0)
    end    
    
    return H
end