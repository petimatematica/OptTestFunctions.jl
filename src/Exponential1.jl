# # Cosine Mixture function
# # Reference: CSENDES, Tibor; RATZ, Dietmar. Subdivision direction selection in interval methods 
# # for global optimization. SIAM Journal on Numerical Analysis, v. 34, n. 3, p. 922-938, 1997.

# # x_i >= 0

# using ForwardDiff

# function deb2_fun(x::Vector{<:Real})
#     n = length(x)
#     sum = 0

#     for i in 1:n 
#         sum += (sin(5 * π * (x[i]^(3 / 4) - 0.05)))^6
#     end

#     y = - (1 / n) * sum  
    
#     return y
# end

# function deb2_grad(x::Vector{<:Real})
#     n = length(x)
#     g = zeros(Float64, n)

#     for i in 1:n 
#         xi = x[i]
#         term = 5 * π * (xi^(3 / 4) - 0.05)
#         g[i] = - (90 * π / (4 * n * xi^(1 / 4))) * (sin(term))^5 * cos(term)
#     end
 
#     return g
# end

# function deb2_hess(x::Vector{<:Real})
#     n = length(x)
#     H = zeros(Float64, n, n)

#     for i in 1:n 
#         xi = x[i]
#         sin_term = sin(5 * π * (xi^(3 / 4) - 0.05))
#         cos_term = cos(5 * π * (xi^(3 / 4) - 0.05))

#         term1 = (90 * π / (16 * n * xi^(5 / 4))) * sin_term^5 * cos_term
#         term2 = (1350 * π^2 / (16 * n * sqrt(xi))) * (5 * sin_term^4 * cos_term^2 - sin_term^6)

#         H[i, i] = term1 - term2
#     end

#     return H
# end

















# x = [858, 6778, 456, 456, 56, 38, 67, 10]
# #x = [1, 2, 3]
# # # #x = [10]
# #y = deb2_grad(x) 
# y = deb2_hess(x)

# #t = ForwardDiff.gradient(deb2_fun, x)
# t = ForwardDiff.hessian(deb2_fun, x)

# println("Algébrico = ", y)
# println("ForwardDiff = ", t)