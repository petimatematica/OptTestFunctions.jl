# Ackley function

# Reference: MOLGA, Marcin; SMUTNICKI, Czesław. Test functions for optimization needs. Test functions for optimization needs, v. 101, p. 48, 2005.

function ackley_fun(x::Vector{<:Real}, n::Int64)
    a = 20
    b = 0.2
    c = 2 * π
    sum1 = 0
    sum2 = 0

    for i in 1:n
        xi = x[i]
        sum1 += xi^2
        sum2 += cos(c * xi)
    end

    term1 = - a * exp(-b * sqrt(sum1 / n))
    term2 = - exp(sum2 / n)

    y = term1 + term2 + a + exp(1)

    return y
end
 
function ackley_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)  
    a = 20
    b = 0.2
    c = 2 * π
    sum1 = 0
    sum2 = 0

    for i in 1:n
        xi = x[i]
        sum1 += xi^2
        sum2 += cos(c * xi)
    end

    for i in 1:n 
        xi = x[i]
        term1 = a * exp(- b * sqrt(sum1 / n)) * b * xi / sqrt(n * sum1)
        term2 = exp(sum2 / n) * c * sin(c * xi) / n
        g[i] = term1 + term2        
    end

    return g
end
 
function ackley_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    a = 20
    b = 0.2
    c = 2 * π
    sum1 = 0
    sum2 = 0

    for i in 1:n
        xi = x[i]
        sum1 += xi^2
        sum2 += cos(c * xi)
    end

    for i in 1:n 
        xi = x[i]
        term1 = a * exp(- b * sqrt(sum1 / n)) * (- (b^2 * xi^2) / (n * sum1) + (b * n * sum1 - b * n * xi^2) / (n * sum1)^(3 / 2))
        term2 = exp(sum2 / n) * (- c^2 * sin(c * xi)^2 / n^2 + c^2 * cos(c * xi) / n) 
        H[i, i] = term1 + term2
    end
  
    for i in 1:n
        for j in (i + 1):n 
            xi = x[i]
            xj = x[j]
            term1 = a * exp(- b * sqrt(sum1 / n)) * (- (b^2 * xi * xj) / sum3 - (b * n * xi * xj) / sum3^(3 / 2))
            term2 = - exp(sum2 / n) * c^2 * sin(c * xi) * sin(c * xj) / n^2 
            H[i, j] = term1 + term2
            H[j, i] = H[i, j] 
        end
    end

    return H
end



