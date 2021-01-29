setwd('~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod6')
install.packages('devtools')
library(devtools)
install_github('mongosoup/rmongodb')
library(rmongodb)

mongo <- mongo.create()
if(mongo.is.connected(mongo)){
  mongo.get.databases(mongo)
}

colecao <- "users.contatos"
mongo.count(mongo,colecao)

res <- mongo.distinct(mongo,colecao,"city")
head(res)
typeof(res)

resOne <- mongo.find.one(mongo,colecao)
print(resOne)

mongo.destroy(mongo)
