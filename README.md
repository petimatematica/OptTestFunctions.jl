# OptTestFunctions
Este documento apresenta uma coleção de funções teste para o estudo e desenvolvimento de algoritmos de Otimização Contínua, implementadas no pacote Opt.jl. As funções aqui descritas possuem importância tanto teórica quanto prática, servindo para avaliar a eficácia de métodos de otimização. Para cada função, fornecemos sua expressão matemática, bem como as respectivas derivadas e hessianas. Além disso, essas funções foram selecionadas por suas características variadas em termos de convexidade, continuidade e complexidade, contribuindo para uma análise abrangente dos métodos de Otimização Contínua.

# **Funções teste para Otimização Contínua**

**1. Função Ackley**

$f(x) = - 20 \cdot \exp\left( -0,2 \cdot \sqrt{\dfrac{1}{n} \sum_{i=1}^{n} x_i^2} \right) - \exp\left( \dfrac{1}{n} \sum_{i=1}^{n} \cos(2 \pi x_i) \right) + 20 + \exp(1)$






[![Build Status](https://github.com/petimatematica/OptTestFunctions.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/petimatematica/OptTestFunctions.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/petimatematica/OptTestFunctions.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/petimatematica/OptTestFunctions.jl)
