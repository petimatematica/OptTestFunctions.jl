# Powell Function

# Reference: L. C. W. Dixon and R. Price. Truncated newton method for sparse unconstrained optimization
# using automatic differentiation. Journal of Optimization Theory and Applications, 60:261–275, 1989.

function powell_fun(x::Vector{<:Real}, n::Int64)
    sum = 0

    for i = 1:(n ÷ 4)
        term1 = (x[4*i-3] + 10*x[4*i-2])^2;
        term2 = 5 * (x[4*i-1] - x[4*i])^2;
        term3 = (x[4*i-2] - 2*x[4*i-1])^4;
        term4 = 10 * (x[4*i-3] - x[4*i])^4;
        sum = sum + term1 + term2 + term3 + term4
    end
    return sum
end

function powell_grad(x::Vector{<:Real}, n::Int64)
    
    grad = zeros(n)
    
    for i = 1:(n ÷ 4)
        idx1 = 4*i-3
        idx2 = 4*i-2
        idx3 = 4*i-1
        idx4 = 4*i
        
        # Termo 1: (x[4*i-3] + 10*x[4*i-2])^2
        grad[idx1] += 2 * (x[idx1] + 10 * x[idx2])
        grad[idx2] += 20 * (x[idx1] + 10 * x[idx2])
        
        # Termo 2: 5 * (x[4*i-1] - x[4*i])^2
        grad[idx3] += 10 * (x[idx3] - x[idx4])
        grad[idx4] += -10 * (x[idx3] - x[idx4])
        
        # Termo 3: (x[4*i-2] - 2*x[4*i-1])^4
        grad[idx2] += 4 * (x[idx2] - 2 * x[idx3])^3
        grad[idx3] += -8 * (x[idx2] - 2 * x[idx3])^3
        
        # Termo 4: 10 * (x[4*i-3] - x[4*i])^4
        grad[idx1] += 40 * (x[idx1] - x[idx4])^3
        grad[idx4] += -40 * (x[idx1] - x[idx4])^3
    end
    
    return grad
end

function powell_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(n, n) 

    for i = 1:(n ÷ 4)
        idx1 = 4*i-3
        idx2 = 4*i-2
        idx3 = 4*i-1
        idx4 = 4*i

        # Termo 1: (x[4*i-3] + 10*x[4*i-2])^2
        H[idx1, idx1] += 2
        H[idx1, idx2] += 20
        H[idx2, idx1] += 20
        H[idx2, idx2] += 200

        # Termo 2: 5 * (x[4*i-1] - x[4*i])^2
        H[idx3, idx3] += 10
        H[idx3, idx4] += -10
        H[idx4, idx3] += -10
        H[idx4, idx4] += 10

        # Termo 3: (x[4*i-2] - 2*x[4*i-1])^4
        term3_factor = 12 * (x[idx2] - 2 * x[idx3])^2
        H[idx2, idx2] += term3_factor
        H[idx2, idx3] += -24 * (x[idx2] - 2 * x[idx3])^2
        H[idx3, idx2] += -24 * (x[idx2] - 2 * x[idx3])^2
        H[idx3, idx3] += 48 * (x[idx2] - 2 * x[idx3])^2

        # Termo 4: 10 * (x[4*i-3] - x[4*i])^4
        term4_factor = 120 * (x[idx1] - x[idx4])^2
        H[idx1, idx1] += term4_factor
        H[idx1, idx4] += -term4_factor
        H[idx4, idx1] += -term4_factor
        H[idx4, idx4] += term4_factor
    end

    return H
end
