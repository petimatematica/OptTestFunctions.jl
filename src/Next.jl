# # Cosine Mixture function
# # Reference: CSENDES, Tibor; RATZ, Dietmar. Subdivision direction selection in interval methods 
# # for global optimization. SIAM Journal on Numerical Analysis, v. 34, n. 3, p. 922-938, 1997.

# using ForwardDiff

# function csendes_fun(x::Vector{<:Real})
#     n = length(x)
#     sum = 0

#     for i in 1:n 
#         xi = x[i]
#         sum += xi^6 * (2 + sin(1 / xi))
#     end
    
#     return sum
# end

# function csendes_grad(x::Vector{<:Real})
#     n = length(x)
#     g = zeros(Float64, n)

#     for i in 1:n 
#         xi = x[i]
#         g[i] = 6 * xi^5 * (2 + sin(1 / xi)) - xi^4 * cos(1 / xi)
#     end
 
#     return g
# end

# function csendes_hess(x::Vector{<:Real})
#     n = length(x)
#     H = zeros(Float64, n, n)

#     for i in 1:n 
#         xi = x[i]
#         sin_xi = sin(1 / xi)
#         cos_xi = cos(1 / xi)

#         H[i, i] = 30 * xi^4 * (2 + sin_xi) - 10 * xi^3 * cos_xi - xi^2 * sin_xi
#     end

#     return H
# end

















# x = [-858, 6778, 456, 456, 56, 38, 67, 10]
# #x = [1, 2, 3]
# # # #x = [10]
# #y = csendes_grad(x) 
# y = csendes_hess(x)

# #t = ForwardDiff.gradient(csendes_fun, x)
# t = ForwardDiff.hessian(csendes_fun, x)

# println("Algébrico = ", y)
# println("ForwardDiff = ", t)