setwd('~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod04')
##total de casamentos igreja

dados <- matrix(c(10,20,30,40,50,60,70,80,90,100,110,120), nrow=3, byrow = T)
colnames(dados) <- c('0', '100-200','151-300','>300')
rownames(dados) <- c("Jovem", "Adulto","Idoso")
barplot(dados,beside = T, col = c('red','blue','green'))

legend("topright", pch = 1, col =  c('red','blue','green'), legend = c("Jovem", "Adulto","Idoso") )
