setwd('~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod04')
library(ggplot2)
data(tips, package = 'reshape2')
View(tips)

qplot(total_bill,tip,data=tips,geom = "point")

camada <- geom_point(
  mapping = aes(
    x = total_bill,
    y = tip,
    color = 'sex'
  ),
  data=tips,
  size=3
)

ggplot() + camada
