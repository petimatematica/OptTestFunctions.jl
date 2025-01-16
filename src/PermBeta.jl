# Perm function n, β
# Reference:

using ForwardDiff

function permbeta_fun(x::Vector{<:Real})
    n = length(x)
    β  = 0.5
    outer = 0
    
    for i = 1:n
        inner = 0
        for j = 1:n
            xj = x[j]
            inner += (j^i + β) * ((xj / j)^i - 1)
        end
        outer += inner^2
    end
    
    y = outer
    
    return y
end
 
function permbeta_grad(x::Vector{<:Real})
    n = length(x)
    g = zeros(Float64, n) 
    β = 0.5

    for k in 1:n
        g_k = 0

        for i in 1:n
            g_i = 0

            for j in 1:n
                j_power_i = j^i + β
                xj_term = (x[j] / j)^i - 1
                g_i += j_power_i * xj_term
            end

            k_power_i = k^i + β
            partial_g_i_xk = k_power_i * i * (x[k] / k)^(i - 1) / k
            g_k += 2 * g_i * partial_g_i_xk
        end

        g[k] = g_k
    end

    return g
end
 
function permbeta_hess(x::Vector{<:Real})
    H = zeros(Float64, n, n)
    


    return H
end

#x = [-858.0, 6778.0, 456.0, 456.0, 56.0, 38.0, 67.0, 10.0]
x = [10, 2, 3]
# #x = [10]
#y = permbeta_grad(x) 
#y = permbeta_hess(x)

#t = ForwardDiff.gradient(permbeta_fun, x)
t = ForwardDiff.hessian(permbeta_fun, x)

#println("Algébrico = ", y)
println("ForwardDiff = ", t)