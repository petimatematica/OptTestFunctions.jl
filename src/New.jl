# # HGBat function

# # Reference: TAN, Y. Chapter 12-A CUDA-Based Test Suit. Gpu-Based Parallel Implementation of Swarm Intelligence Algorithms; Tan, Y., Ed, p. 179-206, 2016.

# using ForwardDiff

# function hgbat_fun(x::Vector{<:Real})
#     n = length(x)
#     sum1 = 0
#     sum2 = sum(x)

#     for i in 1:n
#         xi = x[i]
#         sum1 += xi^2
#     end

#     y = sqrt(abs(sum1^2 - sum2^2)) + (0.5 * sum1 + sum2) / n + 0.5

#     return y
# end

# function hgbat_grad(x::Vector{<:Real})
#     n = length(x)
#     g = zeros(Float64, n)
#     sum1 = 0
#     sum2 = sum(x)

#     for i in 1:n
#         xi = x[i]
#         sum1 += xi^2
#     end

#     for i in 1:n
#         xi = x[i]
#         g[i] = (sign(sum1^2 - sum2^2) * (2 * xi * sum1 - sum2)) / sqrt(abs(sum1^2 - sum2^2)) + (xi + 1) / n 
#     end
 
#     return g
# end

# function hgbat_hess(x::Vector{<:Real})
#     n = length(x)
#     H = zeros(Float64, n, n)
#     sum1 = 0
#     sum2 = sum(x)

#     for i in 1:n
#         xi = x[i]
#         sum1 += xi^2
#     end

#     for i in 1:n
#         xi = x[i]
#         A = sign(sum1^2 - sum2^2) * (2 * xi * sum1 - sum2)
#         B = sqrt(abs(sum1^2 - sum2^2))
#         H[i, i] = (sign(sum1^2 - sum2^2) * (2 * sum1 + 4 * xi^2 - 1) * B - A^2 / B) / B^2 + 1 / n
#     end

#     for i in 1:n 
#         for j in (i + 1):n
#             if i !=j
#                 xi = x[i]
#                 xj = x[j]
#                 A_i = sign(sum1^2 - sum2^2) * (2 * xi * sum1 - sum2)
#                 A_j = sign(sum1^2 - sum2^2) * (2 * xj * sum1 - sum2)
#                 B = sqrt(abs(sum1^2 - sum2^2))
#                 H[i, j] = (sign(sum1^2 - sum2^2) * (4 * xi * xj - 1) * B - A_i * A_j / B) / B^2 
#                 H[j, i] = H[i, j]
#             end
#         end
#     end

#     return H
# end





# x = [-858, 67, 456, 456, 56, 38, 67, 10]
# #x = [1, 2, 3]
# # # #x = [10]
# #y = hgbat_grad(x) 
# y = hgbat_hess(x)

# #t = ForwardDiff.gradient(hgbat_fun, x)
# t = ForwardDiff.hessian(hgbat_fun, x)

# println("Algébrico = ", y)
# println("ForwardDiff = ", t)