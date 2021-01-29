# Solução Lista de Exercícios - Capítulo 5

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/projects/DataScience/RAzureML/big_data_r_azure/Mod5")
getwd()


# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
View(mtcars)
?write.table
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = TRUE, qmethod = "double")


# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)
df_iris <- read_csv("dataset/iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))


# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")


# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("httr")
install.packages("plotly")
library(plotly)
head(iris)

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))


# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.


# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
install.packages("rjson")
library(rjson)
json_data <- fromJSON(file = 'dataset/input.json')

# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
data_json <- as.data.frame(json_data)

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
install.packages("XML")
library(XML)

data_xml <- xmlToList( xmlParse(file = 'dataset/input.xml'))

# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
data_frame_xml <- as.data.frame(data_xml)

# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:
csv_read <- read.csv('dataset/input.csv')
class(csv_read)
# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
nrow(csv_read)
# Pergunta 2 - Qual o maior salário?
max_salary <- max(csv_read$salary)
# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
subset(csv_read,(salary==max_salary))
# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
subset(csv_read,(dept=='IT'))
# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 
subset(csv_read,(dept=='IT' & salary > 600))

