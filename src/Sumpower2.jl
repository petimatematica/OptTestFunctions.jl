# # High Conditioned Elliptic function

# # Reference: TAN, Y. Chapter 12-A CUDA-Based Test Suit. Gpu-Based Parallel Implementation of Swarm Intelligence Algorithms; Tan, Y., Ed, p. 179-206, 2016.

# using ForwardDiff

# function elliptic_fun(x::Vector{<:Real})
#     n = length(x)
#     sum = 0

#     for i in 1:n
#         sum += 10^(6 * (i - 1) / (n - 1)) * x[i]^2
#     end
    
#     return sum
# end

# function elliptic_grad(x::Vector{<:Real})
#     n = length(x)
#     g = zeros(Float64, n)

#     for i in 1:n
#         g[i] = 2 * 10^(6 * (i - 1) / (n - 1)) * x[i]
#     end
 
#     return g
# end

# function elliptic_hess(x::Vector{<:Real})
#     n = length(x)
#     H = zeros(Float64, n, n)

#     for i in 1:n
#         H[i, i] = 2 * 10^(6 * (i - 1) / (n - 1))
#     end

#     return H
# end





# x = [-858, 67, 456, 456, 56, 38, 67, 10]
# #x = [1, 2, 3]
# # # #x = [10]
# #y = elliptic_grad(x) 
# y = elliptic_hess(x)

# #t = ForwardDiff.gradient(elliptic_fun, x)
# t = ForwardDiff.hessian(elliptic_fun, x)

# println("Algébrico = ", y)
# println("ForwardDiff = ", t)