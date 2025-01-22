# # Brown function
# # Reference: BEGAMBRE, O.; LAIER, José Elias. A hybrid Particle Swarm Optimization–Simplex algorithm (PSOS) for 
# # structural damage identification. Advances in Engineering Software, v. 40, n. 9, p. 883-891, 2009.

# # dim > 1

# using ForwardDiff

# function brown_fun(x::Vector{<:Real})
#     n = length(x)
#     sum = 0

#     for i in 1:(n - 1)
#         xi = x[i]
#         xi_plus = x[i + 1] 
#         sum += xi^(2 * (xi_plus^2 + 1)) + xi_plus^(2 * (xi^2 + 1)) 
#     end

#     return sum
# end
 
# function brown_grad(x::Vector{<:Real})
#     n = length(x)
#     g = zeros(Float64, n)
#     x1 = x[1]
#     x2 = x[2]
#     xn_1 = x[n - 1]
#     xn = x[n]

#     g[1] = 2 * (x2^2 + 1) * x1^(2 * x2^2 + 1) + 4 * x1 * log(x2) * x2^(2 * (x1^2 + 1))
#     g[n] = 2 * (xn_1^2 + 1) * xn^(2 * xn_1^2 + 1) + 4 * xn * log(xn_1) * xn_1^(2 * (xn^2 + 1))

     
#     for i in 2:(n - 1)
#         xi = x[i]
#         xi_plus = x[i + 1]
#         xi_minus = x[i - 1]
        
#         term1 = 2 * (xi_plus^2 + 1) * xi^(2 * xi_plus^2 + 1) + 4 * xi * log(xi_plus) * xi_plus^(2 * (xi^2 + 1))
#         term2 = 2 * (xi_minus^2 + 1) * xi^(2 * xi_minus^2 + 1) + 4 * xi * log(xi_minus) * xi_minus^(2 * (xi^2 + 1))
#         g[i] = term1 + term2
#     end
    
#     return g
# end
 
# function brown_hess(x::Vector{<:Real})
#     n = length(x)
#     H = zeros(Float64, n, n)
#     x1 = x[1]
#     x2 = x[2]
#     xn_1 = x[n - 1]
#     xn = x[n]

#     H[1, 1] = 2 * (x2^2 + 1) * (2 * x2^2 + 1) * x1^(2 * x2^2) + x2^(2 * (x1^2 + 1)) * (4 * log(x2) + 16 * (log(x2))^2 * x1^2)
#     #H[1, 1] = x1^(2 * x2^2) * (4 * x2^4 + 6 * x2^2 + 2) + x2^(2 * (x1^2 + 1)) * (4 * log(x2) + 16 * (log(x2))^2 * x1^2)
#     H[1, 2] = 4 * x2 * x1^(2 * x2^2 + 1) * (1 + 2 * (x2^2 + 1) * log(x1)) + 4 * x1 * x2^(2 * x1^2 + 1) * (1 + 2 * log(x2) * (x1^2 + 1))
#     # H[n, n - 1] = 4 * xn_1 * xn^(2 * xn_1^2 + 1) * (1 + 2 * (xn_1^2 + 1) * log(xn)) + 4 * xn * xn_1^(2 * xn^2 + 1) * (1 + 2 * log(xn_1) * (xn^2 + 1))
#     # H[n, n] = xn^(2 * xn_1^2) * (4 * xn_1^4 + 6 * xn_1^2 + 2) + xn_1^(2 * (xn^2 + 1)) * (4 * log(xn_1) + 16 * (log(xn_1))^2 * xn^2)
#     # H[n, n] = 2 * (xn_1^2 + 1) * (2 * xn_1^2 + 1) * xn^(2 * xn_1^2) + xn_1^(2 * (xn^2 + 1)) * (4 * log(xn_1) + 16 * (log(xn_1))^2 * xn^2)

#     H[n, n - 1] = 4 * xn_1 * xn^(2 * xn_1^2 + 1) * (1 + 2 * (xn_1^2 + 1) * log(xn)) + 4 * xn * xn_1^(2 * xn^2 + 1) * (1 + 2 * log(xn_1) * (xn^2 + 1))
#     H[n, n] = 2 * (xn_1^2 + 1) * (2 * xn_1^2 + 1) * xn^(2 * xn_1^2) + 4 * log(xn_1) * xn_1^(2 * (xn^2 + 1)) + 16 * (log(xn_1))^2 * xn_1^(2 * (xn^2 + 1)) * xn^2

#     for i in 2:(n - 1)
#         xi = x[i]
#         xi_plus = x[i + 1]
#         xi_minus = x[i - 1]

#         H[i, i - 1] = 4 * xi_minus * xi^(2 * xi_minus^2 + 1) * (1 + 2 * (xi_minus^2 + 1) * log(xi)) + 4 * xi * xi_minus^(2 * xi^2 + 1) * (1 + 2 * log(xi_minus) * (xi^2 + 1))
        
#         term1 = 2 * (xi_plus^2 + 1) * (2 * xi_plus^2 + 1) * xi^(2 * xi_plus^2) + xi_plus^(2 * (xi^2 + 1)) * (4 * log(xi_plus) + 16 * xi^2 * (log(xi_plus))^2)
#         term2 = 2 * (xi_minus^2 + 1) * (2 * xi_minus^2 + 1) * xi^(2 * xi_minus^2) + xi_minus^(2 * (xi^2 + 1)) * (4 * log(xi_minus) + 16 * xi^2 * (log(xi_minus))^2)

#         H[i, i] = term1 + term2

#         H[i, i + 1] = 4 * xi_plus * xi^(2 * xi_plus^2 + 1) * (1 + 2 * (xi_plus^2 + 1) * log(xi)) + 4 * xi * xi_plus^(2 * xi^2 + 1) * (1 + 2 * log(xi_plus) * (xi^2 + 1))
#     end

#     return H
# end

# #x = [100.0, 6778.0, 456.0, 456.0, 56.0, 38.0, 67.0, 10.0]
# x = [1.0, 2.0, 3.0, 4.0, 5.0, 10.0, 11.0, 20.0]
# H = zeros(length(x), length(x))
# g = zeros(length(x))
# # # #x = [10]
# #y = brown_grad(x) 
# y = brown_hess(x)

# #t = ForwardDiff.gradient(brown_fun, x)
# t = ForwardDiff.hessian(brown_fun, x)

# println("Algébrico = ", y)
# println("ForwardDiff = ", t)
