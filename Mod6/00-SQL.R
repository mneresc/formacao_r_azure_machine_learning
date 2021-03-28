setwd('~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod6')
install.packages('RMySQL')
install.packages('ggplot2')
install.packages('dbplyr')

library(RMySQL)
library(ggplot2)
library(dbplyr)
library(dplyr)

con = dbConnect(MySQL(),user = 'root', password='root',dbname='titanic',host='localhost')
query <- "select pclass, survived, avg(age) as media_idade FROM titanic.titanic WHERE survived = 1 GROUP BY pclass,survived"
dados <- dbGetQuery(con, query)
head(dados)
?aes
ggplot(dados,aes(pclass, media_idade))+ geom_bar(stat="identity")

con2 = src_mysql(user = 'root', password='root',dbname='titanic',host='localhost')
dados2 <- con2  %>%
  tbl('titanic') %>%
  select(pclass,sex,survived) %>%
  group_by(pclass,sex) %>%
  summarise(survavival_ratio = avg(survived)) %>%
  collect()
  View(dados2)
  
  #gravando resultado da análise 
  
  
  