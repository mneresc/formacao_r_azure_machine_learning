#libs utilizadas remodelagem de dados
install.packages("tidyr")

# gather  - linha pra coluna
# spread - coluna pra linha
# separate - separa uma coluna
# unit - junta em uma coluna
library(tidyr)

# transformacao dos dados
# select
# filter - where
# group_by
# summarise - resumo
# arrange - organizar os dados
# mutate - calculos em uma coluna
# join
library(dplyr)
library(readr)

setwd("~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod7")

#carregando CSV
sono_df <- read_csv('./dataset/sono.csv')
View(sono_df)

?glimpse
glimpse(mutate(sono_df,peso_libras = sono_total / 0.45))

# select() no dataframe
sleep <- select(sono_df, nome:pais, sono_total)
head(sleep)

# filter()
sleepF <- filter(sono_df,cidade  %in% c("Recife",'Curitiba'))
head(sleepF)

# arrange() - ordenacao
ordenado <- sono_df %>%
  select(nome,cidade,sono_total) %>%
  arrange(cidade,desc(sono_total))
head(ordenado)

# mutate() - novo campo
mudado <- sono_df %>%
  mutate(indice_massa = sono_total/peso)
  
head(mudado)

#sumarize() e group_by
mudado <- sono_df %>%
  group_by(cidade) %>%
  summarise(media = mean(sono_total),minimo = min(sono_total), maximo = max(sono_total))
head(mudado)

