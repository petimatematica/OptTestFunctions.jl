# Drop Wave function

# Reference: PLEVRIS, Vagelis; SOLORZANO, German. A collection of 30 multidimensional 
# functions for global optimization benchmarking. Data, v. 7, n. 4, p. 46, 2022.

function dropwave_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i in 1:n
        sum += x[i]^2
    end

    y = 1 - (1 + cos(12 * sqrt(sum))) / (0.5 * sum + 2)
    
    return y
end

function dropwave_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    sum = 0

    for i in 1:n 
        sum += x[i]^2
    end

    sqrt_sum = sqrt(sum)

    for i in 1:n
        xi = x[i]
        term1 = (12 * xi * sin(12 * sqrt_sum)) / (sqrt_sum * (0.5 * sum + 2))
        term2 = (xi * (1 + cos(12 * sqrt_sum))) / (0.5 * sum + 2)^2
        g[i] = term1 + term2
    end
 
    return g
end

function dropwave_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    sum = 0

    for i in 1:n 
        sum += x[i]^2
    end
    
    sqrt_sum = sqrt(sum)

    for i in 1:n
        xi = x[i]
        A = 12 * xi * sin(12 * sqrt_sum)
        d_A = A / xi + 144 * xi^2 * cos(12 * sqrt_sum) / sqrt_sum
        B = sqrt_sum * (0.5 * sum + 2)
        d_B = xi * (0.5 * sum + 2) / sqrt_sum + xi * sqrt_sum
        C = xi * (1 + cos(12 * sqrt_sum))
        d_C = C / xi - 12 * xi^2 * sin(12 * sqrt_sum) / sqrt_sum
        D = (0.5 * sum + 2)^2
        d_D = 2 * xi * (0.5 * sum + 2)

        H[i, i] = (d_A * B - A * d_B) / B^2 + (d_C * D - C * d_D) / D^2
    end

    for i in 1:n 
        for j in 1:n
            if i !=j
                xi = x[i]
                xj = x[j]
                A = 12 * xi * sin(12 * sqrt_sum)
                d_A = 144 * xi * xj * cos(12 * sqrt_sum) / sqrt_sum
                B = sqrt_sum * (0.5 * sum + 2)
                d_B = xj * (0.5 * sum + 2) / sqrt_sum + xj * sqrt_sum
                C = xi * (1 + cos(12 * sqrt_sum))
                d_C = - 12 * xi * xj * sin(12 * sqrt_sum) / sqrt_sum
                D = (0.5 * sum + 2)^2
                d_D = 2 * xj * (0.5 * sum + 2)
    
                H[i, j] = (d_A * B - A * d_B) / B^2 + (d_C * D - C * d_D) / D^2    
            end
        end
    end



    return H
end