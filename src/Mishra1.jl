# # Xin-She Yang function
# # Reference: 

# using ForwardDiff

# function xinsheyang_fun(x::Vector{<:Real})
#     n = length(x)
#     sum1 = 0
#     sum2 = 0

#     for i in 1:n 
#         xi = x[i]
#         sum1 += abs(xi)
#         sum2 += sin(xi^2) 
#     end

#     y = sum1 * exp(- sum2)
    
#     return y
# end

# function xinsheyang_grad(x::Vector{<:Real})
#     n = length(x)
#     g = zeros(Float64, n)
#     sum1 = 0
#     sum2 = 0

#     for i in 1:n 
#         xi = x[i]
#         sum1 += abs(xi)
#         sum2 += sin(xi^2) 
#     end

#     E = exp(- sum2)

#     for i in 1:n
#         xi = x[i]
#         g[i] = E * (sign(xi) - 2 * xi * cos(xi^2) * sum1)
#     end
 
#     return g
# end

# function xinsheyang_hess(x::Vector{<:Real})
#     n = length(x)
#     H = zeros(Float64, n, n)
#     sum1 = 0
#     sum2 = 0

#     for i in 1:n 
#         xi = x[i]
#         sum1 += abs(xi)
#         sum2 += sin(xi^2) 
#     end

#     E = exp(- sum2)
    
#     for i in 1:n
#         xi = x[i]
#         sin_xi2 = sin(xi^2)
#         cos_xi2 = cos(xi^2)
#         term1 = 2 * xi * cos_xi2 * (sign(xi) - 2 * xi * cos_xi2 * sum1)
#         term2 = (2 * cos_xi2 - 4 * xi^2 * sin_xi2) * sum1 + 2 * xi * cos_xi2 * sign(xi)
#         H[i, i] = E * (- term1 - term2)       
#     end

#     for i in 1:n
#         for j in 1:n
#             if i != j
#                 xi = x[i]
#                 xj = x[j]
#                 cos_xi2 = cos(xi^2)
#                 cos_xj2 = cos(xj^2)
#                 term1 = 2 * xj * cos_xj2 * (sign(xi) - 2 * xi * cos_xi2 * sum1)
#                 term2 = 2 * xi * cos_xi2 * sign(xj)

#                 H[i, j] = E * (- term1 - term2)  
#             end
#         end
#     end

#     return H
# end





# x = [-858, 67, 456, 456, 56, 38, 67, 10]
# #x = [100, 20, -3]
# # # #x = [10]
# #y = xinsheyang_grad(x) 
# y = xinsheyang_hess(x)

# #t = ForwardDiff.gradient(xinsheyang_fun, x)
# t = ForwardDiff.hessian(xinsheyang_fun, x)

# println("Algébrico = ", y)
# println("ForwardDiff = ", t)