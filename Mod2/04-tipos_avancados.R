#veror - 1 dimensao e 1 tipo de dado
vetor <- c(1:20)
print(vetor[1])

#matriz 2 dimensoes e 1 tipo de dado

matriz <- matrix(1:20, nrow = 2)

# array 2 ou mais dimenssões

arr <- array(1:20, dim = c(3, 3, 3))
print(arr)

#vários tipos de dado - Dataframe
View(iris)
length(iris)
mode(iris)

#lista composta
lista1 <- list(a = matriz, b = vetor)
lista1.append(vetor)

#combinacao vetores
vetor2 <- c(1:20)
vetor3 <- c(20:40)
vetorConjunto = c(vetor2, vetor3)
View(vetorConjunto)
print(vetorConjunto)
vetor3 ** vetor2
