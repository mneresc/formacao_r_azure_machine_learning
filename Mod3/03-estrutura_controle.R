idade <- 19

if(idade >= 18){
  print('Boletos')
}else{
  print('Facilidades da vida moderna')
}

for(i in 1:30){
  print(paste('Para ser muito bom em algo estudo por mais',as.character(i),ifelse(i >= 2, 'anos','ano'),sep=' '))
}

rep(1,5)

#apply
# lista, numrica, char - sply y laplay
# se matrix, dataframe (agrecacao por coluna) - by/taply
# se operacoes linha ou especifica - apply


lista <-list(a = (1:20), b = (35:67))
valor_a = 0
valor_b = 0
sapply(lista, sum)

?gl
tabela_basquete <-
  data.frame(equipe = gl(5, 5, labels = paste("Equipe", LETTERS[1:5])),
             jogador = sample(letters, 25),
             num_cestas = floor(runif(25, min=0, max=50)))
View(tabela_basquete)

summary(tabela_basquete)

install.packages('sqldf')
library(sqldf)
sqldf('SELECT equipe, sum(num_cestas) FROM tabela_basquete group by equipe')

#t apply soma, agrupado funcao
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, mean)
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, sum)
?tapply
