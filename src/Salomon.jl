# Salomon function

# Reference: SALOMON, Ralf. Re-evaluating genetic algorithm performance under coordinate rotation of benchmark functions. 
# A survey of some theoretical and practical aspects of genetic algorithms. BioSystems, v. 39, n. 3, p. 263-278, 1996.

function salomon_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n 
        sum += x[i]^2
    end

    sqrt_sum = sqrt(sum)
    y = 1 - cos(2 * π * sqrt_sum) + 0.1 * sqrt_sum
    
    return y
end

function salomon_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    sum = 0

    for i in 1:n 
        sum += x[i]^2
    end

    sqrt_sum = sqrt(sum)

    for i in 1:n
        xi = x[i]
        g[i] = (xi / sqrt_sum) * (2 * π * sin(2 * π * sqrt_sum) + 0.1)
    end
 
    return g
end

function salomon_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    sum = 0

    for i in 1:n 
        sum += x[i]^2
    end

    sqrt_sum = sqrt(sum)
    
    for i in 1:n
        xi = x[i]
        term1 = (1 / sqrt_sum - xi^2 / sum^(3 / 2)) * (2 * π * sin(2 * π * sqrt_sum) + 0.1)
        term2 = (4 * π^2 * xi^2 / sum) * cos(2 * π * sqrt_sum)
        H[i, i] = term1 + term2       
    end

    for i in 1:n
        for j in (i + 1):n
            xi = x[i]
            xj = x[j]
            term1 = (- xi * xj / sum^(3 / 2)) * (2 * π * sin(2 * π * sqrt_sum) + 0.1)
            term2 = (4 * π^2 * xi * xj / sum) * cos(2 * π * sqrt_sum)

            H[i, j] = term1 + term2
            H[j, i] = H[i, j]
        end
    end

    return H
end