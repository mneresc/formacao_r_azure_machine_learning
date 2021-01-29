setwd('~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod04')

attach(cars)
?cars

#extraindo pra verificar via histograma
dados = cars$speed
grafico<- hist(dados, breaks = 10, main="Velocidades", col.main = "red")

#validando distribuição normal
xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados))
yaxis = yaxis*diff(grafico$mids) * length(dados)
lines(xaxis, yaxis, col="red")

