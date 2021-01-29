# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/projects/DataScience/R Azure ML/big_data_r_azure/Mod3/")
getwd()

# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
list.files(path=".")

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números

df1 <- data.frame(caracter = c("One","Zero","One"),boleano = c(TRUE,FALSE,TRUE),numerico = c(0,1,0))
View(df1)

# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.
# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1
for(x in vec1){
  if(x > 10){
    print(x)
  }
}
# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2
for(y in lst2){
    print(y)
}

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat1*mat2

# Multiplicação de matrizes
mat1%*%mat2

# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos
vec_my = c(10,20,30)
list1 = list(nomeado = vec_my, inominado=c('0',3,1))
df_my <- data.frame(lista = list1, vec = vec_my)
View(df_my)

# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2
index <- which(mat2 %in% sample(mat2,50))
mat2[index] <- NA
View(mat2)
?which
  # Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
rowSums(mat1)

# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a
sort(a)

# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
View(mat1)
vec_forced <-sort( unlist(mat1))
for(x in vec_forced){
  if(x > 15){
    print(x)
  }
}
