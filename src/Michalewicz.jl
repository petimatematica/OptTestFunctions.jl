# Michalewicz function

# Reference: MOLGA, Marcin; SMUTNICKI, Czesław. Test functions for optimization needs. Test functions for optimization needs, v. 101, p. 48, 2005.

function michalewicz_fun(x::Vector{<:Real}, n::Int64)
    sum = 0
    
    for i = 1:n
        xi = x[i]
        new = sin(xi) * (sin(i * xi^2/π))^20
        sum  = sum + new
    end

    return -sum
end

function michalewicz_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)

    for i in 1:n 
       xi = x[i]
       t = i * xi^2/π
       sin_t = sin(t)
       g[i] = - cos(xi) * (sin_t)^20 - sin(xi) * (sin_t)^19 * cos(t) * (40 * i * xi)/π
    end

    return g
end

function michalewicz_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)

    for i in 1:n
        xi = x[i]
        t = i * xi^2/π
        sin_t = sin(t)
        sin_xi = sin(xi)
        cos_t = cos(t)
        cos_xi = cos(xi)
        A = sin_xi * (sin_t)^20 - cos_xi * (sin_t)^19 * cos_t * (40 * i * xi)/π
        C = sin_xi * sin_t^19 
        C_d = cos_xi * sin_t^19 + (38 * i * xi) / π * sin_xi * sin_t^18 * cos_t
        D = xi * cos_t 
        D_d = cos_t - (2 * i * xi^2 * sin_t) / π
        B = (- 40 * i / π) * (C_d * D + C * D_d) 
        
        H[i, i] =  A + B
    end

    return H
end

