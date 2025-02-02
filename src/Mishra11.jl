# Mishra 11 function

# Reference: MISHRA, Sudhanshu K. Global optimization by differential evolution and particle 
# swarm methods: Evaluation on some benchmark functions. Available at SSRN 933827, 2006.

# x_i different of zero

function mishra11_fun(x::Vector{<:Real}, n::Int64)
    sum_xi = sum(abs.(x))
    prod_xi = prod(x)

    y = (sum_xi / n - (abs(prod_xi))^(1 / n))^2
    
    return y
end

function mishra11_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    sum_xi = sum(abs.(x))
    prod_xi = prod(x)

    for i in 1:n
        xi = x[i]
        A = sum_xi / n
        B = abs(prod_xi)^(1 / n)

        g[i] = (2 * (A - B) * sign(xi) / n) * (1 - B / abs(xi))
    end
 
    return g
end

function mishra11_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    sum_abs_x = sum(abs.(x))
    prod_xi = prod(x)
    abs_prod = abs(prod_xi)
    A = sum_abs_x / n
    B = abs_prod^(1 / n)
    
    for i in 1:n
        xi = x[i]
        sign_xi = sign(xi)
        abs_xi = abs(xi)
        term1 = (2 / n^2) * (1 - B / abs_xi) * (1 - B / abs_xi)
        term2 = ((2 * (A - B) * sign_xi) / n) * ((B * sign_xi / xi^2) * (1 - 1 / n))

        H[i, i] = term1 + term2       
    end

    for i in 1:n
        for j in 1:n
            if i != j
                xi = x[i]
                xj = x[j]
                sign_xi = sign(xi)
                sign_xj = sign(xj)
                abs_xi = abs(xi)
                abs_xj = abs(xj)
                term1 = (2 * sign_xi / n^2) * (sign_xj - B * sign_xj / abs_xj) * (1 - B / abs_xi)
                term2 = ((2 * (A - B) * sign_xi) / n) * (- B * sign_xj / (n * abs_xj * abs_xi))

                H[i, j] = term1 + term2
            end
        end
    end

    return H
end