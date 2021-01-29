setwd('~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod04')

set.seed(67)

x = rnorm(10,5,7)
y = rpois(10,7)
z = rnorm(10,6,7)
t = rpois(10,9)

plot(x, y, col = "red", pch = 10, main="Scatter Plot", cex.main = 1.5, xlab = "variável independente", ylab = "Variável dependente")
points(z,t, col = "blue", pch=4)
