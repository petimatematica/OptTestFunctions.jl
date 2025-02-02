# Perm function n, β

# Reference: PLEVRIS, V.; SOLORZANO, G. A Collection of 30 Multidimensional Functions for Global Optimization Benchmarking. Data 2022, 7, 46. 2022.

function permbeta_fun(x::Vector{<:Real}, n::Int64)
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
 
function permbeta_grad(x::Vector{<:Real}, n::Int64)
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
 
function permbeta_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    β = 0.5

    for k in 1:n
        for l in 1:n
            H_kl = 0.0

            for i in 1:n
                g_i = 0.0
                for j in 1:n
                    g_i += (j^i + β) * ((x[j] / j)^i - 1)
                end

                dg_i_dk = (k^i + β) * i * (x[k] / k)^(i-1) / k
                dg_i_dl = (l^i + β) * i * (x[l] / l)^(i-1) / l

                if k == l
                    d2g_i_dk2 = (k^i + β) * i * (i-1) * (x[k] / k)^(i-2) / k^2
                else
                    d2g_i_dk2 = 0.0
                end

                H_kl += 2 * (dg_i_dk * dg_i_dl + g_i * d2g_i_dk2)
            end

            H[k, l] = H_kl
        end
    end

    return H
end
