setwd('~/projects/DataScience/R Azure ML/big_data_r_azure')
getwd()

nome <- c('Orácio','Jubileu')
frase <- c('O Jubileu está esquisito hoje tenho medo','Você falou pipoca')
numero <- c(1,2)
locura <- c('X','Y')

df <- data.frame(nome, frase, numero)
df = cbind(df,locura)
head(df)
# tail(df)
View(df)

df[numero >  1]
?read.csv
df_pacientes = data.frame(read.csv('../arquivo/pacientes.csv', header = TRUE , sep=','))
View(df_pacientes)
summary(df_pacientes)
