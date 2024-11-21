using CairoMakie

# Dados de exemplo para 10 categorias
#categorias = ["3", "4", "5", "6", "7", "8", "9", "10", "15"]
categorias = ["0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9"]  
valores = [0.6116899991035462, 0.5236700010299683, 0.1951699995994568, 0.2922499942779541, 0.48675999879837034, 0.6076900029182434, 0.3818699979782105, 0.46644999980926516, 0.37270000457763675]
# Cria o gráfico de barras
fig = Figure()
ax = Axis(fig[1, 1], 
          xlabel = "Valores do parâmetro η", 
          #ylabel = "Número médio de iterações",
          ylabel = "Tempo médio de CPU (segundos)",
          xlabelsize = 16, ylabelsize = 16,  # Define o tamanho do texto dos eixos
          xlabelfont = "calibri-bold", ylabelfont = "calibri-bold")  # Mantém a fonte padrão com negrito

# ax.xticks = (categorias, string.(categorias))
ax.xticks = (1:length(categorias), categorias)
#ax.yticks = (0:2000:10000)

# Adiciona as barras ao gráfico
#barplot!(ax, categorias, valores, color = :seagreen)
barplot!(ax, 1:length(categorias), valores, color = :cyan4)

# Exibe o gráfico
display(fig)
save("parameter_average_rosenbrock_time.png", fig, dpi=400)

