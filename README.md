# OptTestFunctions
Este documento apresenta uma coleção de funções teste para o estudo e desenvolvimento de algoritmos de Otimização Contínua, implementadas no pacote Opt.jl. As funções aqui descritas possuem importância tanto teórica quanto prática, servindo para avaliar a eficácia de métodos de otimização. Para cada função, fornecemos sua expressão matemática, bem como as respectivas derivadas e hessianas. Além disso, essas funções foram selecionadas por suas características variadas em termos de convexidade, continuidade e complexidade, contribuindo para uma análise abrangente dos métodos de Otimização Contínua.

# **Funções teste para Otimização Contínua**

**1. Função Ackley**

$f(x) = - 20 \cdot \exp\left( -0,2 \cdot \sqrt{\dfrac{1}{n} \sum \limits_{i=1}^{n} x_i^2} \right) - \exp\left( \dfrac{1}{n} \sum \limits_{i=1}^{n} \cos(2 \pi x_i) \right) + 20 + \exp(1)$

**2. Função Alpine 1**

$f(x) = \sum \limits_{i=1}^{n} \left|x_i \text{sen}(x_i) + 0,1x_i \right|$

**3. Função Alpine 2**

$f(x) = \prod \limits_{i=1}^{n} \sqrt{x_i} \text{sen}(x_i)$

**4. Função Chung Reynolds**

$f(x) = \left( \sum \limits_{i=1}^{n} x_i^2 \right)^2$

**5. Função Cosine Mixture**

$f(x)=-0,1 \sum \limits_{i=1}^{n} \cos(5 \pi x_i) - \displaystyle\sum \limits_{i=1}^{n} x_i^2$

$$ 
f(x) = -0.1 \sum\limits_{i=1}^{n} \cos(5 \pi x_i) 
- \sum\limits_{i=1}^{n} x_i^2 
$$


**6. Função Csendes**

$f(x)=\sum \limits_{i=1}^{n} x_i^6 \left( 2 + \text{sen} \ \dfrac{1}{x_i} \right)$

**7. Função Deb 1**

$f(x)= -\frac{1}{D}\sum \limits_{i=1}^D \sin^6(5\pi x_i)$

**8. Função Deb 2**

$f(x)= -\frac{1}{D}\sum \limits_{i=1}^D \sin^6(5\pi(x_i^{3/4}-0.05))$

**9. Função Dejong**

**10. Função Dixon Price**

$f(x)=(x_1-1)^2+\sum \limits_{i=2}^D i(2x_i^2-x_{i_1})^2$

**11. Função Drop Wave**

$f(x)= 1- \dfrac{1+\cos \left(12\sqrt{\sum \limits_{i=1}^D x_i^2}\right)}{0.5 \sum \limits_{i=1}^D x_i^2+2}$

**12. Função Ellipsoid 1**

$f(x)= \sum \limits_{i=1}^n (i \cdot x_i^2)$

**13. Função Ellipsoid 2**

$f(x)= \sum \limits_{i=1}^n \sum \limits_{j=1}^i x_j^2$

**14. Função High Conditioned**

$f(x)=\sum \limits_{i=1}^D \left((10^6)^{\frac{i-1}{D-1}} \cdot x_i^2\right)$

**15. Função Exponential**

$f(x)= -\exp{\left(-0.5 \sum \limits_{i=1}^D x_i^2 \right)}$

**16. Função de Griewangk**

$f(x)= \sum \limits_{i=1}^n \frac{x_i^2}{4000} - \prod \cos \left(\frac{x_i}{\sqrt{i}} \right)+1$

**17. Função HappyCat**

$f(x)= \left \vert \sum \limits_{i=1}^D x_i^2- D \right\vert^{1/4} + \dfrac{0.5 \sum \limits_{i=1}^D x_i^2+\sum \limits_{i=1}^D x_i}{D}+0.5$

**18. Função HGBat**

$f(x)= \left \vert (\sum \limits_{i=1}^D x_i^2)- (\sum \limits_{i=1}^D x_i) \right \vert^{1/2} + \dfrac{0.5 \sum \limits_{i=1}^D x_i^2+\sum \limits_{i=1}^D x_i}{D}+0.5$


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

**31. Função de Rosenbroc**

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
