# Levy function
# Reference: MOLGA, Marcin; SMUTNICKI, Czesław. Test functions for optimization needs. Test functions for optimization needs, v. 101, p. 48, 2005.

function levy_fun(x::Vector{<:Real}, n::Int64)
    w = zeros(eltype(x), n)  
    for i = 1:n 
        w[i] = 1.0 + (x[i] - 1.0) / 4.0
    end
    term1 = (sin(pi * w[1]))^2
    term3 = (w[n] - 1)^2 * (1 + (sin(2 * pi * w[n]))^2)

    sum = zero(eltype(x)) 
    for i = 1:(n - 1)
        wi = w[i]
        new = (wi - 1)^2 * (1 + 10 * (sin(pi * wi + 1))^2)
        sum += new
    end

    y = term1 + sum + term3
    
    return y
end

function levy_grad(x::Vector{<:Real}, n::Int64)
    w = zeros(Float64, n) 
    
    for i in 1:n
        w[i] = 1 + (x[i] - 1) / 4
    end

    g = zeros(Float64, n)

    w1 = w[1]
    sin_pi_w1 = sin(π * w1 + 1)

    g_1 = 0.5 * π * sin(π * w1) * cos(π * w1)
    g_2 = 0.5 * (w1 - 1) * (1 + 10 * sin_pi_w1^2)
    g_3 = 5 * π * (w1 - 1)^2 * sin_pi_w1 * cos(π * w1 + 1)
    
    g[1] = g_1 + g_2 + g_3         

    for i = 2:(n-1)
        sin_pi_wi = sin(π * w[i] + 1)
        wi = w[i]
        g[i] = 0.5 * (wi - 1) * (1 + 10 * sin_pi_wi^2) + 5 * π * (wi - 1)^2 * sin_pi_wi * cos(π * wi + 1)
    end

    wn = w[n]
    sin_2pi_wi = sin(2 * π * w[n])
    g[n] = 0.5 * (wn - 1) * (1 + sin_2pi_wi^2) + (wn - 1)^2 * sin_2pi_wi * π * cos(2 * π * wn)
    
    return g
end

function levy_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(n, n)

    w1 = 1 + (x[1] - 1) / 4
    sin_pi_w1 = sin(π * w1 + 1)
    cos_pi_w1 = cos(π * w1 + 1)
    hess_11 = (π^2 / 8) * cos(2 * π * w1)
    hess_12 = 1 / 8 * (1 + 10 * sin_pi_w1^2) + (5 * π / 2) * (w1 - 1) * sin_pi_w1 * cos_pi_w1
    hess_13 = 5 / 2 * π * (w1 - 1) * sin_pi_w1 * cos_pi_w1 + 5 / 4 * π^2 * (w1 - 1)^2 * cos(2 * π * w1 + 2)

    H[1, 1] = hess_11 + hess_12 + hess_13

    for i in 2:(n - 1)
        wi = 1 + (x[i] - 1) / 4
        sin_pi_wi = sin(π * wi + 1)
        cos_pi_wi = cos(π * wi + 1)
        hess_21 = 1 / 8 * (1 + 10 * sin_pi_wi^2) + (5 * π / 2) * (wi- 1) * sin_pi_wi * cos_pi_wi
        hess_22 = 5 / 2 * π * (wi - 1) * sin_pi_wi * cos_pi_wi + 5 / 4 * π^2 * (wi - 1)^2 * cos(2 * π * wi + 2)      
        
        H[i, i] = hess_21 + hess_22
    end

    xn = x[n]
    wn = 1 + (xn - 1) / 4
    sin_2pi_wn = sin(2 * π * wn)
    cos_2pi_wn = cos(2 * π * wn)
    hess_31 = 1 / 8 * (1 + sin_2pi_wn^2) + 0.5 * π * (wn - 1) * sin_2pi_wn * cos_2pi_wn
    hess_32 = π / 32 * ((π * xn^2 - 2 * π * xn + π) * cos(4 * π * wn) + 4 * sin_2pi_wn * cos_2pi_wn * (xn - 1))
    
    H[n, n] = hess_31 + hess_32
    
    return H
end
