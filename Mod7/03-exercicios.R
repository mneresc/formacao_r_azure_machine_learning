# Solução Lista de Exercícios - Capítulo 7

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod7/")
getwd()

# Formatando os dados de uma página web
install.packages('rvest')

library(rvest)
library(stringr)
library(tidyr)

library(reshape2)

# Exercício 1 - Faça a leitura da url abaixo e grave no objeto pagina
# http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I

webpage <- read_html("http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I")
webpage
# Exercício 2 - Da página coletada no item anterior, extraia o texto que contenha as tags:
# "#detailed-forecast-body b  e .forecast-text"

forecast <- webpage %>% html_nodes("#detailed-forecast-body")
forecast

forecast_text <- webpage %>% html_nodes(".forecast-text")
forecast_text


# Exercício 3 - Transforme o item anterior em texto
clima <- vector("list",length = length(forecast_text))

for(i in seq_along(forecast_text)){
  clima[i] <-   forecast_text[i]  %>% html_text(trim = TRUE)
}
clima

# Exercício 4 - Extraímos a página web abaixo para você. Agora faça a coleta da tag "table"
url <- 'http://espn.go.com/nfl/superbowl/history/winners'
pagina <- read_html(url)

vencedores <- pagina %>% html_nodes("table")
vencedores

# Exercício 5 - Converta o item anterior em um dataframe

dados_tabela <- pagina %>% html_nodes("table")

tabela <- data.frame(dados_tabela   %>% html_table(convert = TRUE,header=TRUE, trim=TRUE))

# Exercício 6 - Remova as duas primeiras linhas e adicione nomes as colunas
cabecalho_dataset <- tabela[1:1,]

colnames(tabela) <-cabecalho_dataset

table_vencedores <- tabela[-c(1, 1),]
View(table_vencedores)


# Exercício 7 - Converta de algarismos romanos para números inteiros
table_vencedores$NO. <- lapply(table_vencedores$NO., as.roman)
View(table_vencedores)

# Exercício 8 - Divida as colunas em 4 colunas
# Exercício 9 - Inclua mais 2 colunas com o score dos vencedores e perdedores
# Dica: Você deve fazer mais uma divisão nas colunas
resultado <- colsplit(string=table_vencedores$RESULT,pattern =  ',',names = c('campeao','vice'))
campeao_temp <- colsplit(string=resultado$campeao,pattern =  '[0-9]',names = c('campeao','placar_campeao'))
View(campeao_temp)


vice_temp <- colsplit(string=resultado$vice,pattern =  '[0-9]',names = c('vice','placar_vice'))
View(vice_temp)

campeonatos <- data.frame(c(table_vencedores, campeao_temp,vice_temp))
campeonatos$RESULT <- NULL
View(campeonatos)





# Exercício 10 - Grave o resultado em um arquivo csv
write.csv(campeonatos,file = 'resultado_campoenato.csv')



