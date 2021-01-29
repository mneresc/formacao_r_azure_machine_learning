setwd('~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod5')
######### DICAS #######
#Evitar espaco e numero para o titulo
#Primeira linha normalmente e cabecalho
#comcatenacao . ou _
#Nomes curtos para colunas
#Tratar NA depois do processo de limpeza



######### #IMPORTANDO TXT #######
#pacote utils
#importantdo txt
df1 <- read.table('./dataset/pedidos.txt',sep=',', stringsAsFactors = FALSE)
#se tornando um datable
View(df1)
dim(df1)

#csv
df2 <- read.csv('./dataset/pedidos.txt', stringsAsFactors = FALSE)
View(df2)

?read.delim

df2 <- read.delim('./dataset/pedidos.txt',sep=',', stringsAsFactors = FALSE)
View(df2)

#escrevendo 

write.csv(mtcars,file='./dataset/mtcars.csv')

################3 IMPORTANDO CSV ##################
install.packages('readr')
library(readr)
df3 <- read_csv('./dataset/pedidos.txt')
View(df3)

################3 IMPORTANDO XLSX #################
install.packages('rJava')
install.packages("xlsx")
install.packages("XLConnect")
install.packages("readxl")
install.packages("gdata")
library(rJava)
library(readxl)


urb_pop <- read_excel("./dataset/UrbanPop.xlsx", sheet = 1)
head(urb_pop)

#XlConnect
library(XLConnect)

arq <- XLConnect::loadWorkbook("./dataset/UrbanPop.xlsx")
urb1  <- readWorksheet(arq, sheet = 1, header = T)
View(urb1)
class(urb1)

#gdata
library(gdata)
arqToCsv <- gdata::xls2csv("./dataset/UrbanPop.xlsx", sheet=1, na.strings = "EMPTY")
read.csv(arqToCsv)
