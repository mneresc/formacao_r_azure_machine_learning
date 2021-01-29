setwd('~/projects/DataScience/R Azure ML/big_data_r_azure/Mod04')

install.packages("mapdata")
install.packages("maps")

# Carrega os pacotes
library(ggplot2)
library(maps)
library(mapdata)
?map_data

mapa <- map_data("world")
View(mapa)

ggplot() + geom_polygon(data=mapa, aes(x=long, y = lat, group = group), fill=NA, color='red' ) +guides(fill=FALSE) +coord_fixed(1.3)
