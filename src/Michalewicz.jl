#x = [1, 2, 3]
# k = zakharov_fun(x)
# h = zakharov_grad(x)


#x = [-658, 6778, 456, 456, 56, 38, 67]
#x = [1, 2, 3]
x = [10]
#y = zakharov_grad(x) 
z = zakharov_hess(x)

#t = ForwardDiff.gradient(zakharov_fun, x)
u = ForwardDiff.hessian(zakharov_fun, x)

println("Algébrico = ", z)
println("ForwardDiff = ", u)