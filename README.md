# OptTestFunctions
Este documento apresenta uma coleção de funções teste para o estudo e desenvolvimento de algoritmos de Otimização Contínua, implementadas no pacote Opt.jl. As funções aqui descritas possuem importância tanto teórica quanto prática, servindo para avaliar a eficácia de métodos de otimização. Para cada função, fornecemos sua expressão matemática, bem como as respectivas derivadas e hessianas. Além disso, essas funções foram selecionadas por suas características variadas em termos de convexidade, continuidade e complexidade, contribuindo para uma análise abrangente dos métodos de Otimização Contínua.

# **Funções teste para Otimização Contínua**

**1. Função Ackley**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20-20%20\cdot%20\exp\left(-0.2%20\cdot%20\sqrt{\dfrac{1}{n}%20\sum_{i=1}^{n}%20x_i^2}%20\right)%20-%20\exp\left(%20\dfrac{1}{n}%20\sum_{i=1}^{n}%20\cos(2%20\pi%20x_i)%20\right)%20+%2020%20+%20\exp(1))

**2. Função Alpine 1**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20\sum%20\limits_{i=1}^{n}%20\left|x_i%20\sin(x_i)%20+%200.1x_i%20\right|)

**3. Função Alpine 2**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20\prod%20\limits_{i=1}^{n}%20\sqrt{x_i}%20\sin(x_i))

**4. Função Chung Reynolds**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20\left(%20\sum%20\limits_{i=1}^{n}%20x_i^2%20\right)^2)

**5. Função Cosine Mixture**

![Equação](https://latex.codecogs.com/png.latex?f(x)=-0.1%20\sum_{i=1}^{n}%20\cos(5%20\pi%20x_i)%20-%20\sum_{i=1}^{n}%20x_i^2)

**6. Função Csendes**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20\sum%20\limits_{i=1}^{n}%20x_i^6%20\left(%202%20+%20\sin%20\frac{1}{x_i}%20\right))

**7. Função Deb 1**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20-\frac{1}{D}%20\sum%20\limits_{i=1}^{D}%20\sin^6(5\pi%20x_i))

**8. Função Deb 2**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20-\frac{1}{D}%20\sum%20\limits_{i=1}^{D}%20\sin^6\left(5\pi\left(x_i^{\frac{3}{4}}-0.05\right)\right))

**9. Função Dejong**

**10. Função Dixon Price**

A função Dixon-Price consiste em $f : \mathbb{R}^n \rightarrow [0, +\infty)$ definida por 

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20(x_1-1)^2%20+%20\sum%20\limits_{i=2}^{D}%20i(2x_i^2-x_{i-1})^2)

**11. Função Drop Wave**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%201-%20\dfrac{1%2B\cos%20\left(12\sqrt{\sum%20\limits_{i=1}^D%20x_i^2}\right)}{0.5%20\sum%20\limits_{i=1}^D%20x_i^2%2B2})

**12. Função Ellipsoid 1**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20\sum%20\limits_{i=1}^n%20(i%20\cdot%20x_i^2))

**13. Função Ellipsoid 2**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20\sum%20\limits_{i=1}^n%20\sum%20\limits_{j=1}^i%20x_j^2)

**14. Função High Conditioned**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20\sum%20\limits_{i=1}^D%20\left((10^6)^{\frac{i-1}{D-1}}%20\cdot%20x_i^2\right))

**15. Função Exponential**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20-\exp%7B\left(-0.5%20\sum%20\limits_{i=1}^D%20x_i^2%20\right)%7D)

**16. Função de Griewangk**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20\sum%20\limits_{i=1}^n%20\frac{x_i^2}{4000}%20-%20\prod%20\cos%20\left(\frac{x_i}{\sqrt{i}}\right)%2B1)

**17. Função HappyCat**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20\left%20\vert%20\sum%20\limits_{i=1}^D%20x_i^2-%20D%20\right\vert^{1/4}%20+%20\dfrac{0.5%20\sum%20\limits_{i=1}^D%20x_i^2%20+%20\sum%20\limits_{i=1}^D%20x_i}{D}%20+0.5)

**18. Função HGBat**

![Equação](https://latex.codecogs.com/png.latex?f(x)%20=%20\left%20\vert%20\left(\sum%20\limits_{i=1}^D%20x_i^2\right)%20-%20\left(\sum%20\limits_{i=1}^D%20x_i\right)%20\right\vert^{1/2}%20+%20\dfrac{0.5%20\sum%20\limits_{i=1}^D%20x_i^2%20+%20\sum%20\limits_{i=1}^D%20x_i}{D}%20+0.5)


**19. Função Levy**


**20. Função Michalewicz**



**21. Função Mishra 1**


**22. Função Mishra 7**

**23. Função Mishra 11**

**24. Função Perm n, $\beta$**

**25. Função Powell**

**26. Função Qing**

**27. Função Quartic**

**28. Função Função Quintic**

**29. Função de Rastrigin**

**30. Função Ridge Modificada**

**31. Função de Rosenbrock**

**32. Função Salomon**

**33. Função Schwefell**

**34. Função Styblinsky-Tang**

**35. Função Sum of different power 1**

**36. Função Sum of different power 2**

**37. Função Trid**

**38. Função Trigometric**

**39. Função Xin-She Yang**

**40. Função Zakharov**



[![Build Status](https://github.com/petimatematica/OptTestFunctions.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/petimatematica/OptTestFunctions.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/petimatematica/OptTestFunctions.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/petimatematica/OptTestFunctions.jl)
