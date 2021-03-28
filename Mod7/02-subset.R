# Subsetting

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod7")
getwd()


# Muitas das técnicas abaixo podem ser realizadas com a aplicação das funções:
# subset(), merge(), plyr::arrange()
# Mas conhecer estas notações é fundamental para compreeder como 
# gerar subconjuntos de dados


## Vetores
x <- c("A", "E", "D", "B", "C")
x[]
x


# Índices Positivos - Elementos em posições específicas
#retornando colunas somente 1 e 3
x[c(1, 3)]
x[c(1, 1)]
#ordenada colunas
x[order(x)]


# retorna tudo menos as colunas delimitadas

x[-c(1, 3)]
x[-c(1, 4)]


# Vetor Lógico para gerar subsetting
#intercala traz a primeira não traz a segunda e assim por diante
x[c(TRUE, FALSE)]
x
x[c(TRUE, FALSE, TRUE, FALSE)]


# Vetor de caracteres
x <- c("A", "B", "C", "D")
#nomeia as colunas com os proprios indices
y <- setNames(x, letters[1:4])
y
#traz segundo o nome do verto
y[c("d", "c", "a")]
y[c("a", "a", "a")]


## Matrizes
mat <- matrix(1:9, nrow = 3)
colnames(mat) <- c("A", "B", "C")
mat
#linha de 1 a 2 e todas as colunas
mat[1:2, ]

mat[1:2, 2:3]


# Função outer() permite que uma Matriz se comporte como vetores individuais
?outer
#junta dois vetores aplicando uma funcao
vals <- outer(1:5, 1:5, FUN = "paste", sep = ",")
vals
#a função outer mesmo sendo uma matriz se comporta como um vetor indexando linhas e coluas de forma linear
vals[c(4, 15)]


## Dataframes
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
#traz somente a coluna indicada
df$x

#fintrando com elemento== 2
df[df$x == 2, ]
df[c(1, 3), ]
df[c("x", "z")]
#traz todas as linhas das colunas x e y
df[, c("x", "z")]

str(df["x"])
str(df[, "x"])


# Removendo colunas de dataframes
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df

#remove a coluna
df$z <- NULL
df


# Operadores [], [[]] e $
a <- list(x = 1:3, y = 4:5)
a
#retorna coluna e titulo
a[1]

#retorna apenas primeiro elemento da lista sem o titulo
a[[1]]

#primeiro elemento do primeiro elemento da lista
a[[1]][[1]]
a[["x"]]

b <- list(a = list(b = list(c = list(d = 1))))
b
b[[c("a", "b", "c", "d")]]
b[["a"]][["b"]][["c"]][["d"]]


# x$y é equivalente a x[["y", exact = FALSE]]
var <- "cyl"
View(mtcars)
#usando variavel trazer coluna
mtcars[[var]]

x <- list(abc = 1)
x
x$a
#não traz nada quando traz por indexação deve ser feito como nome completo
x[["a"]]
x[["abc"]]


# Subsetting e atribuição
x <- 1:5
x

#alterando os elementos 1 e 2
x[c(1, 2)] <- 2:3
x

x[-1] <- 4:1
x

# Isso é subsetting
head(mtcars)

#manterm a estrutura original da matriz
mtcars[] <- lapply(mtcars, as.integer)
head(mtcars)


# Isso não é subsetting
#sobreescreve funcao
mtcars <- lapply(mtcars, as.integer)
head(mtcars)


# Lookup tables
x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c(m = "Male", f = "Female", u = NA)
lookup[x]
unname(lookup[x])

# Usando operadores lógicos
x1 <- 1:10 %% 2 == 0
x1
which(x1)
x2 <- which(x1)
x2
y1 <- 1:10 %% 5 == 0
y2 <- which(y1)
y2
intersect(x2, y2)
x1 & y1
union(x2, y2)
setdiff(x2, y2)

??reshape2.melt
??ddply




