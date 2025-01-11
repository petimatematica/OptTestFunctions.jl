# Levy function
# Reference: MOLGA, Marcin; SMUTNICKI, Czesław. Test functions for optimization needs. Test functions for optimization needs, v. 101, p. 48, 2005.

using ForwardDiff

function levy_fun(x::Vector{<:Real})
    n = length(x)  
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

function levy_grad(x::Vector{<:Real})
    n = length(x)
    w = zeros(Float64, n) 
    for i in 1:n
        w[i] = 1 + (x[i] - 1) / 4
    end

    g = zeros(Float64, n)

    sin_pi_w1 = sin(π * w[1] + 1)
    w1 = w[1]

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

function levy_hess(x::Vector{<:Real})
    n = length(x)
    H = zeros(n, n)

    w1 = 1 + (x[1] - 1) / 4
    hess1 = (π^2 / 8) * cos(2 * π * w1)  # Certo
    hess2 = 1 / 8 * (1 + 10 * sin(π * w1 + 1)) + 5 * π / 4 * (w1 - 1) * cos(π * w1 + 1)
    hess3 = 5 / 2 * π * (w1 - 1) * sin(π * w1 + 1) * cos(π * w1 + 1) + 5 / 4 * π^2 * (w1 - 1)^2 * cos(2 * π * w1 + 2)
    #H[1, 1] = 1 / 16 * (2 * π^2 * cos(2 * pi))

    H[1, 1] = hess1 + hess2 + hess3

    for i in 2:(n - 1)      
        wn = 1 + (x[n] - 1) / 4
        d2 = (2 * pi^2 / 16) * (cos(2 * pi * wn)^2 - sin(2 * pi * wn)^2) + (1 / 16)
        H[i, i] = d2
    end

    wn = 1 + (x[n] - 1) / 4
    d3 = (2 * pi^2 / 16) * (10 * cos(pi * wn + 1)^2 - 10 * sin(pi * wn + 1)^2) + (1 / 16)
    H[n, n] = d3
    
    return H
end


#x = [-658.0, 6778.0, 456.0, 456.0, 56.0, 38.0, 67.0]
#x = [1, 2, 3]
x = [1.0, 2.0, 3.0]
#x = [10]
#y = levy_grad(x) 
y = levy_hess(x)

#t = ForwardDiff.gradient(levy_fun, x)
t = ForwardDiff.hessian(levy_fun, x)

println("Algébrico = ", y)
println("ForwardDiff = ", t)