# funcoes especiais 
#vetor com elementos da lista
list1 = list(c(1,2,3),c(4,5,6))
#tranforma lista em vetor
print(unlist(list1))
?unlist
#do.call()
#Aplica uma funcao a o objeto inteiro
#Diferente do apply do.call aplica para todos
do.call(rbind,list1)
?rbind

#strplit
texto <- "Seu Tranca Ruas é uma beleza eu nunca vi um Exu assim"
print(strsplit(texto," "))

#
