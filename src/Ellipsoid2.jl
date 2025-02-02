# Rotated Hyper-Ellipsoid Function

# Reference: MOLGA, Marcin; SMUTNICKI, Czesław. Test functions for optimization needs. Test functions for optimization needs, v. 101, p. 48, 2005.
 
function ellipsoid2_fun(x::Vector{<:Real}, n::Int64)
    outer = 0

    for k in 1:n 
        inner = 0
        for j in 1:k
            inner = inner + x[j]^2
        end
        outer = outer + inner
    end

    return outer 
end

function ellipsoid2_grad(x::Vector{<:Real}, n::Int64)
    grad = zeros(Float64, n) 

    for i in 1:n
        grad[i] = 2 * x[i] * (n - i + 1)
    end

    return grad
end

function ellipsoid2_hess(x::Vector{<:Real}, n::Int64)
    h = zeros(Float64, n, n)
    for i in 1:n 
        h[i, i] = 2 * (n - i +1)
    end
    return h
end