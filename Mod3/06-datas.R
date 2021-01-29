setwd("~/projects/DataScience/R Azure ML/big_data_r_azure/Mod3/")

#horário do sistemas
hoje <- Sys.Date()
class(hoje)

data_1 <-as.Date('2010-10-10')
class(data_1)

data_br <- format(data_1,format='%d/%m/%Y')
print(data_br)

data_add <- data_1 + 45
data_br_add <- format(data_add,format='%d/%m/%Y')
print(data_br_add)

list1 <- list(a=(1:20),b=(45:77))
sapply(list1, sum)
