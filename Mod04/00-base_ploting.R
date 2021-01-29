search()
setwd('~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod04')
# install.packages('plotrix')
library(datasets)
library(plotrix)
demo('graphics')

x = 1:20
y = 40:60
par(mfrow = c(1,2), col.axis = "red")
plot(x,y,xlab = "Abississas",ylab= "Ordenadas",las = 0)
plot(iris)

png('costa_oca.png',width = 500,height = 500, res = 72)
plot(iris$Sepal.Length, pch='*',las = 1,main="Sepalas do iris")

dev.off()
?hist

