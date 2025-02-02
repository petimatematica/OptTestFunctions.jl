# Griewangk's function

# Reference: MOLGA, Marcin; SMUTNICKI, Czesław. Test functions for optimization needs. Test functions for optimization needs, v. 101, p. 48, 2005.

function griewangk_fun(x::Vector{<:Real}, n::Int64)
    sum = 0
    prod = 1

    for i = 1:n
        xi = x[i]
        sum += xi^2 / 4000
        prod *= cos(xi / sqrt(i))
    end

    y = sum - prod + 1
    return y

end

function griewangk_grad(x::Vector{<:Real}, n::Int64)
    grad = zeros(Float64, n)
    cos_prod = prod(cos(x[i] / sqrt(i)) for i in 1:n)
    
    for i = 1:n
        xi = x[i]
        sqi = sqrt(i)
        partial_sum = xi / 2000
        partial_cos_prod = cos_prod / cos(xi / sqi)  
        partial_prod = sin(xi / sqi) * (1 / sqi) * partial_cos_prod
        grad[i] = partial_sum + partial_prod
    end

    return grad
end

function griewangk_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)

    cos_prod = prod(cos(x[i] / sqrt(i)) for i in 1:n)

    for i = 1:n
        for j = 1:n
    
            xi = x[i]
            xj = x[j]
            sqi = sqrt(i)
            sqj = sqrt(j)

            if i == j
                H[i, i] = 1 / 2000 + (cos_prod / i)
            else
                term1 = sin(xi / sqi) * sin(xj / sqj) / (sqi * sqj)
                term2 = cos_prod / (cos(xi / sqi) * cos(xj / sqj))
                H[i, j] = - term1 * term2
            end
        end
    end

    return H
end