using OptTestFunctions
using Test

# @testset "OptTestFunctions.jl" begin
#     # 2x + 3y
#     @test my_f(2,1) == 7
#     @test my_f(2,3) == 13
# end

@testset "dixon_hess Tests" begin
    x = [1.0, 2.0, 3.0]
    n = length(x)
    hessiana = dixon.hess(x, n)
    @test size(hessiana) == (n, n)  # Verifique o tamanho correto
    # Adicione mais verificações para os valores esperados
end
