setwd('~/projects/DataScience/FCD/RAzureML/big_data_r_azure/Mod04')

attach(sleep)
?boxplot
sleepbox = boxplot(data = sleep, extra ~ group, main= "Duração do sono", col.main="red", ylab="Drogas",xlab="Horas", horizontal = T, col = c('red','blue')  )
medias = by(extra, group,mean)
points(medias, col = "green")
