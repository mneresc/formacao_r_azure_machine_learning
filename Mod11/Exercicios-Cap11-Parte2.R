# Lista de Exercícios Parte 2 - Capítulo 11

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod11")
getwd()


# Regressão Linear
# Definição do Problema: Prever as notas dos alunos com base em diversas métricas
# https://archive.ics.uci.edu/ml/datasets/Student+Performance
# Dataset com dados de estudantes
# Vamos prever a nota final (grade) dos alunos

# Carregando o dataset
df <- read.csv2('estudantes.csv')

# Explorando os dados
head(df)
summary(df)
str(df)
any(is.na(df))
View(df)

# install.packages("ggplot2")
# install.packages("ggthemes")
# install.packages("dplyr")
library(ggplot2)
library(ggthemes)
library(dplyr)

#Pegando dados devo levar em consideracao as notas anteriores pois isso pode impactar o quanto o aluno estuda pra a próxima


# por ser uma variável numérica utilizarei regressão linear pra resolver
hist(df$G3, main = 'Histograma', xlab = 'Nota')

# A acurácia ficou ruim vou tentar adicinar somente as variáveis relevantes
lm_g1 <- lm(G3 ~., data = df)
summary(lm_g1)



# reduziu a acurancia na verdade
lm_g1_v2 <- lm(G3 ~ sex+studytime+failures+schoolsup+famsup+famrel+G1+G2, data = df)
summary(lm_g1_v2)

# mudando de algoritmo para analise
library(e1071)
library(caret)


g1_svm_v1 <- svm(G3 ~ ., data = df, kernel = "linear", cost = 10, scale = FALSE)
summary(g1_svm_v1)
table(predict(g1_svm_v1),df$G3,dnn=c("Prediction", "Actual") )



ConfusionMatrix(df_g1$G1, predict(g1_svm_v1))

