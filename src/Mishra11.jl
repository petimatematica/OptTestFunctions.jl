# # Mishra 11 function
# # Reference: 

# using ForwardDiff

# function mishra11_fun(x::Vector{<:Real})
#     n = length(x)
#     sum = 0
#     prod = 1

#     for i in 1:n
#         xi = x[i] 
#         sum += abs(xi)
#         prod *= abs(xi)
#     end

#     y = ((1 / n) * sum - (prod)^(1 / n))^2
    
#     return y
# end

# function mishra11_grad(x::Vector{<:Real})
#     n = length(x)
#     g = zeros(Float64, n)

#     for i in 1:n 
#         xi = x[i]
#         g[i] = 4 * xi * (xi^2 - i)
#     end
 
#     return g
# end

# function mishra11_hess(x::Vector{<:Real})
#     n = length(x)
#     H = zeros(Float64, n, n)
#     prod = 1

#     for i in 1:n 
#         prod *= x[i]
#     end

#     for i in 1:n
#         H[i, i] = 12 * x[i]^2 - 4 * i
#     end

#     return H
# end

















# x = [85, 67, 45, 45, 56, 38, 67, 10]
# #x = [10, 2, 3]
# # # #x = [10]
# #y = mishra11_grad(x) 
# y = mishra11_hess(x)

# #t = ForwardDiff.gradient(mishra11_fun, x)
# t = ForwardDiff.hessian(mishra11_fun, x)

# println("Algébrico = ", y)
# println("ForwardDiff = ", t)