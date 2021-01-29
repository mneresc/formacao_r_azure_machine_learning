#Variaveis categorias que organiza e ordena por niveis
vec1 <- c('Macho','Fêmea','Macho','Macho','Fêmea','Fêmea')
fac_tipo <- factor(vec1)
print(fac_tipo)
class(fac_tipo)
levels(fac_tipo)

graduacao <- c('Mestrado','Doutorado','Bracharelado','Mestrado','Mestrado')
print(graduacao)
fac_grad = factor(graduacao, order=TRUE, levels=c('Bacharelado','Mestrado','Doutorado'))
levels(fac_grad)
summary(fac_grad)
summary(graduacao)


sexo <- c('F','M','F','F','F','F','F','M','M')
sexo_fac <- factor(sexo)
levels(sexo_fac) <- c('Fêmea','Macho')
summary(sexo_fac)

#CSV para fator
df <- read.csv2('etnias.csv',sep=',')
# View(df)
summary(lm(Idade~Etnia,data=df))

#alterando categorias
df$Estado_Civil.cat <- factor(df$Estado_Civil, labels =  c('Solteiro','Casado','Divorciado'))
df


