# Solução Lista de Exercícios - Capítulo 6

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd('~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod6')
getwd()


# Exercicio 1 - Instale a carregue os pacotes necessários para trabalhar com SQLite e R
install.packages("RSQLite")
library(RSQLite)
library(dplyr)
library(dbplyr)

# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
driver <- dbDriver("SQLite")
conn <- dbConnect(driver,"./dataset/mamiferos.sqlite")

# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
src_dbi(conn,auto_disconnect = FALSE)

# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objero em R:
# SELECT year, species_id, plot_id FROM surveys
rs <- dbSendQuery(conn,"SELECT year, species_id, plot_id FROM surveys")
dados <- fetch(rs,n=-1)
head(dados)

# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
typeof(dados)

# Exercicio 6 - Já carregamos a tabela abaixo para você. Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5
# Exercicio 7 - Grave o resultado do item anterior em um objeto R. O objeto final deve ser um dataframe
conn2 <- src_sqlite("./dataset/mamiferos.sqlite")
pesquisas <- conn2 %>%
  tbl("surveys") %>%
  select(species_id, sex , weight)%>%
  filter(weight > 5) %>%
  collect()
class(pesquisas)


# Exercicio 8 - Liste as tabelas do banco de dados carregado
conn <- dbConnect(driver,"./dataset/mamiferos.sqlite")
dbListTables(conn)

# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados
dbWriteTable(conn,name="surveys_2",value = pesquisas)

# Exercicio 10 - Imprima os dados da tabela criada no item anterior
rs <- dbSendQuery(conn,"SELECT * FROM surveys_2")
dados <- fetch(rs,n=-1)
head(dados)



