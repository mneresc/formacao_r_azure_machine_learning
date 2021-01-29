setwd('~/projects/DataScience/R Azure ML/big_data_r_azure/Mod04')

install.packages('lattice')
library(lattice)
View(iris)
xyplot(data = iris, groups = Species, Sepal.Length ~ Petal.Length  )
