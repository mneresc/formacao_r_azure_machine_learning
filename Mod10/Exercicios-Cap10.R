# Solução Lista de Exercícios - Capítulo 10

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod10/")
getwd()


# Pacotes
install.packages("dplyr")
install.packages('nycflights13')
library('ggplot2')
library('dplyr')
library('nycflights13')
View(flights)
?flights

# Definindo o Problema de Negócio
# Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)


##### ATENÇÃO #####
# Você vai precisar do conhecimento adquirido em outros capítulos do curso 
# estudados até aqui para resolver esta lista de exercícios!


# Exercício 1 - Construa o dataset pop_data com os dados de voos das 
# companhias aéreas UA (United Airlines) e DL (Delta Airlines). 
# O dataset deve conter apenas duas colunas, nome da companhia e atraso nos voos de chegada.
# Os dados devem ser extraídos do dataset flights para construir o dataset pop_data
# Vamos considerar este dataset como sendo nossa população de voos
View(flights)

pop_data <- na.omit(flights) %>%
            select(carrier, arr_delay) %>%
            filter(carrier == 'UA' | carrier == 'DL', arr_delay > 0) %>%
            sample_n(17000)

View(pop_data)

# Exercício 2  - Crie duas amostras de 1000 observações cada uma a partir do 
# dataset pop_data apenas com dados da companhia DL para amostra 1 e apenas dados 
# da companhia UA na amostra 2

DL <- na.omit(pop_data) %>%
  filter(carrier == 'DL') %>%
  sample_n(1000)

DL$sample_id <- 1

UA <- na.omit(pop_data) %>%
  filter(carrier == 'UA') %>%
  sample_n(1000)

UA$sample_id <- 2

View(DL)
View(UA)


# Dica: inclua uma coluna chamada sample_id preenchida com número 1 para a primeira 
# amostra e 2 para a segunda amostra



# Exercício 3 - Crie um dataset contendo os dados das 2 amostras criadas no item anterior. 

delay <- rbind(DL,UA)

# Exercício 4 - Calcule o intervalo de confiança (95%) da amostra1

# Usamos a fórmula: erro_padrao_amostra1 = sd(amostra1$arr_delay) / sqrt(nrow(amostra1))

# Esta fórmula é usada para calcular o desvio padrão de uma distribuição da média amostral
# (de um grande número de amostras de uma população). Em outras palavras, só é aplicável 
# quando você está procurando o desvio padrão de médias calculadas a partir de uma amostra de 
# tamanho n𝑛, tirada de uma população.

# Digamos que você obtenha 10000 amostras de uma população qualquer com um tamanho de amostra de n = 2.
# Então calculamos as médias de cada uma dessas amostras (teremos 10000 médias calculadas).
# A equação acima informa que, com um número de amostras grande o suficiente, o desvio padrão das médias 
# da amostra pode ser aproximado usando esta fórmula: sd(amostra) / sqrt(nrow(amostra))
  
# Deve ser intuitivo que o seu desvio padrão das médias da amostra será muito pequeno, 
# ou em outras palavras, as médias de cada amostra terão muito pouca variação.

# Com determinadas condições de inferência (nossa amostra é aleatória, normal, independente), 
# podemos realmente usar esse cálculo de desvio padrão para estimar o desvio padrão de nossa população. 
# Como isso é apenas uma estimativa, é chamado de erro padrão. A condição para usar isso como 
# uma estimativa é que o tamanho da amostra n é maior que 30 (dado pelo teorema do limite central) 
# e atende a condição de independência n <= 10% do tamanho da população.

# Erro padrão
erro_padrao_amostra1 = sd(UA$arr_delay) / sqrt(nrow(UA))


# Limites inferior e superior
# 1.96 é o valor de z score para 95% de confiança
lower = mean(UA$arr_delay) - 1.96 * erro_padrao_amostra1  
upper = mean(UA$arr_delay) + 1.96 * erro_padrao_amostra1


# Intervalo de confiança

ic_1 = c(lower,upper)
mean(UA$arr_delay)
ic_1


# Exercício 5 - Calcule o intervalo de confiança (95%) da amostra2
erro_padrao_amostra2 = sd(DL$arr_delay) / sqrt(nrow(DL))

lower = mean(DL$arr_delay) - 1.96 * erro_padrao_amostra2  
upper = mean(DL$arr_delay) + 1.96 * erro_padrao_amostra2

ic_2 = c(lower,upper)
mean(UA$arr_delay)
ic_2

# Exercício 6 - Crie um plot Visualizando os intervalos de confiança criados nos itens anteriores
# Dica: Use o geom_point() e geom_errorbar() do pacote ggplot2
toPlot = summarise(group_by(delay, sample_id), mean = mean(arr_delay))
toPlot = mutate(toPlot, lower = ifelse(toPlot$sample_id == 1,ic_1[1],ic_2[1]))
toPlot = mutate(toPlot, upper = ifelse(toPlot$sample_id == 1,ic_1[2],ic_2[2]))

dev.off()
ggplot(toPlot, aes(x = sample_id, y=mean, colour = sample_id )) + 
  geom_point() +
  geom_errorbar(aes(ymin=lower, ymax=upper), width=.1)


# Exercício 7 - Podemos dizer que muito provavelmente, as amostras vieram da mesma população? 
# Por que?



# Exercício 8 - Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)

# H0 e H1 devem ser mutuamente exclusivas.

