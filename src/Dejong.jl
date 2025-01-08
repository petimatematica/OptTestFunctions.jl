# De Jong's function
# Reference: MOLGA, Marcin; SMUTNICKI, Czesław. Test functions for optimization needs. Test functions for optimization needs, v. 101, p. 48, 2005.

function dejong_fun(x::Vector{<:Real}, n::Int64)
   sum = 0

    for i in 1:n 
       sum += x[i]^2
    end

   return sum

end

function dejong_grad(x::Vector{<:Real}, n::Int64)
    g = zeros(Float64, n)
    
    for i in 1:n 
        g[i] = 2 * x[i]   
    end

    return g
end

function dejong_hess(x::Vector{<:Real}, n::Int64)
    H = zeros(Float64, n, n)
    
    for i in 1:n 
        H[i,i] = 2.0
    end

    return H
end


