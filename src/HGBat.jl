# # HappyCat function

# # Reference: PLEVRIS, Vagelis; SOLORZANO, German. A collection of 30 multidimensional 
# # functions for global optimization benchmarking. Data, v. 7, n. 4, p. 46, 2022.

# using ForwardDiff

# function happycat_fun(x::Vector{<:Real})
#     n = length(x)
#     sum1 = 0
#     sum2 = 0

#     for i in 1:n
#         xi = x[i]
#         sum1 += xi^2
#         sum2 += xi
#     end
    
#     y = abs(sum1 - n)^(0.25) + (0.5 * sum1 + sum2) / n + 0.5

#     return y
# end

# function happycat_grad(x::Vector{<:Real})
#     n = length(x)
#     g = zeros(Float64, n)
#     sum = 0

#     for i in 1:n
#         sum += x[i]^2
#     end

#     for i in 1:n
#         xi = x[i]
#         g[i] = (xi / 2) * abs(sum - n)^(- 3 / 4) * sign(sum - n) + (xi + 1) / n 
#     end
 
#     return g
# end

# function happycat_hess(x::Vector{<:Real})
#     n = length(x)
#     H = zeros(Float64, n, n)
#     sum = 0

#     for i in 1:n
#         sum += x[i]^2
#     end

#     for i in 1:n
#         H[i, i] = (1 / 2) * abs(sum - n)^(-3 / 4) * sign(sum - n) - 3 * x[i]^2 / 4 * abs(sum - n)^(- 7 / 4) + 1 / n
#     end

#     for i in 1:n 
#         for j in (i + 1):n
#             if i !=j
#                 H[i, j] = - (3 / 4) * x[i] * x[j] * abs(sum - n)^(-7 / 4) * sign(sum - n)
#                 H[j, i] = H[i, j]
#             end
#         end
#     end

#     return H
# end





# x = [-858, 67, 456, 456, 56, 38, 67, 10]
# #x = [1, 2, 3]
# # # #x = [10]
# #y = happycat_grad(x) 
# y = happycat_hess(x)

# #t = ForwardDiff.gradient(happycat_fun, x)
# t = ForwardDiff.hessian(happycat_fun, x)

# println("Algébrico = ", y)
# println("ForwardDiff = ", t)