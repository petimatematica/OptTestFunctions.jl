# Dixon Price Function

function dixon_fun(x::Vector, n::Int64) 
    #n= length(x)

    sum = (x[1] - 1)^2  
    for i in 2:n  
        sum += i * (2*x[i]^2 - x[i-1])^2 
    end
    return sum 
end

function dixon_grad(x::Vector, n::Int64)
    #n= length(x)

    g = zeros(Float64, n) 
    
    if n == 1
        g[1] = 2 * (x[1] - 1)
    else
        g[1] = 2 * (x[1] - 1) - 4 * (2 * x[2]^2 - x[1]) 
        for j in 2:(n-1)
            g[j] = 2 * j * (2 * x[j]^2 - x[j-1]) * (4 * x[j]) - (j+1) * 2 * (2 * x[j+1]^2 - x[j]) 
        end
        g[n] = 2 * n * (2 * x[n]^2 - x[n-1]) * (4 * x[n])
    end
    
    return g
end

function dixon_hess(x::Vector, n::Int64)
    h = zeros(n, n)

    if n == 1
        h[1, 1] = 2
    else
        h[1, 1] = 6
        h[1, 2] = -16 * x[2]

        for i in 2:(n - 1)
            h[i,i] = i*8*(6*x[i]^2-x[i-1]) +2*i + 2
            h[i, i - 1] = -i * 8 * x[i]  
            h[i, i + 1] = i*2*4*((2*x[i+1]^2-x[i] + 4*x[i+1]^2))  

            h[i - 1, i] = h[i, i - 1]
            h[i + 1, i] = h[i, i + 1]
        end

        h[n, n - 1] = -n * 8 * x[n]
        h[n, n] = n*2*4*((2*x[n]^2-x[n-1] + 4*x[n]^2))
        h[n - 1, n] = h[n, n - 1]
    end

    return h
end



