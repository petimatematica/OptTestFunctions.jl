# Salomon function
# Reference: 

# using ForwardDiff

# function quintic_fun(x::Vector{<:Real})
#     n = length(x)
#     sum = 0

#     for i in 1:n 
#         xi = x[i]
#         sum += abs(xi^5 - 3 * xi^4 + 4 * xi^3 + 2 * xi^2 - 10 * xi - 4)
#     end
    
#     return sum
# end

# function quintic_grad(x::Vector{<:Real})
#     n = length(x)
#     g = zeros(Float64, n)

#     for i in 1:n
#         xi = x[i]
#         term = xi^5 - 3 * xi^4 + 4 * xi^3 + 2 * xi^2 - 10 * xi - 4
#         g[i] = sign(term) * (5 * xi^4 - 12 * xi^3 + 12 * xi^2 + 4 * xi - 10)
#     end
 
#     return g
# end

# function quintic_hess(x::Vector{<:Real})
#     n = length(x)
#     H = zeros(Float64, n, n)
    
#     for i in 1:n
#         xi = x[i]
#         term = xi^5 - 3 * xi^4 + 4 * xi^3 + 2 * xi^2 - 10 * xi - 4
#         H[i, i] = sign(term) * (20 * xi^3 - 36 * xi^2 + 24 * xi + 4)    
#     end

#     return H
# end





# x = [-858, 67, 456, 456, 56, 38, 67, 10]
# #x = [10, 20, -3]
# # # #x = [10]
# #y = quintic_grad(x) 
# y = quintic_hess(x)

# #t = ForwardDiff.gradient(quintic_fun, x)
# t = ForwardDiff.hessian(quintic_fun, x)

# println("Algébrico = ", y)
# println("ForwardDiff = ", t)