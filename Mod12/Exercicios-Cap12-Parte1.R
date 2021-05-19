# Solução Lista de Exercícios - Capítulo 12

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod12")
getwd()

# Existem diversos pacotes para arvores de recisao em R. Usaremos aqui o rpart.
#install.packages('rpart')
library(rpart)
library(rpart.plot)
library(rpart.summary)

# Vamos utilizar um dataset que é disponibilizado junto com o pacote rpart
str(kyphosis)
head(kyphosis)
View(kyphosis)
summary(kyphosis)
?kyphosis
?rpart

# Exercício 1 - Depois de explorar o dataset, crie um modelo de árvore de decisão
split <- createDataPartition(y = kyphosis$Kyphosis, p = 0.7, list = FALSE)
dados_treino <- kyphosis[split,]
dados_teste <- kyphosis[-split,]

fit_k <- rpart(Kyphosis~., data = dados_treino, method = 'class')


# Para examinar o resultado de uma árvore de decisao, existem diversas funcões, mas você pode usar printcp()
?printcp
printcp(fit_k)

# Visualizando a ávore (execute uma função para o plot e outra para o texto no plot)
# Utilize o zoom para visualizar melhor o gráfico
rpart.plot(fit_k)
predict_k <-predict(fit_k, dados_teste, type = 'class')

table_mat <- table(dados_teste$Kyphosis, predict_k)
table_mat
# Este outro pacote faz a visualizaco ficar mais legivel
prp(fit_k)
