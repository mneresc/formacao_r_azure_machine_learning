# Exercício 1 - Crie um vetor com 30 números inteiros
vector_int = c(1:30)
length(vector_int)

# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros
matriz_ex2 = matrix(c(1:16), nrow = 4, ncol = 4)
View(matriz_ex2)

# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente
list_ex3 = list(vector_int,matriz_ex2)


# Exercício 4 - Usando a função read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat
df_table = data.frame(read.table('arquivo/effort.dat'))
head(df_table)


# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")
colnames(df_table) <- c("config", "esfc", "chang")
head(df_table)


# Exercício 6 - Imprima na tela o dataframe iris, verifique quantas dimensões existem no dataframe iris e imprima um resumo do dataset
View(iris)
length(iris)
summary(iris)

# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
library(ggplot2)
qplot(Sepal.Length, Petal.Length, data = iris, color = Species)

# Exercício 8 - Usando a função subset, crie um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()

irs_sub = subset(iris, Sepal.Length > 5.1 )
View(irs_sub)

# Exercícios 9 (Desafio) - Crie um dataframe que seja cópia do dataframe iris e usando a função slice(), divida o dataframe em um subset de 15 linhas
# Dica 1: Você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a função slice()

# Exercícios 10 - Use a função filter no seu novo dataframe criado no item anterior e retorne apenas valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a função filter
library(dplyr)
filter(iris, Sepal.Length > 5.1)
