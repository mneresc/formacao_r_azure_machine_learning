setwd('~/projects/DataScience/R Azure ML/big_data_r_azure/Mod3/')
getwd()

graduacao <- c('Mestrado','Doutorado','Bracharelado','Mestrado','Mestrado')
pontuacao <- c(9,5,8,5,10)
persona <- c('Persona 1','Persona 2','Persona 1','Persona 2','Persona 1')

df <- data.frame(graduacao,pontuacao,persona)
str(df)
