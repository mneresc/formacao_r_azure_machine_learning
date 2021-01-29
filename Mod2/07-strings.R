texto <- "Niguém é verdadeiramente livre"
texto2 <- "Todos somos prisioneiros de nossas escolhas"
class(texto)
mode(texto)

sprintf('%s .%s',texto, texto2)
cat(texto,texto2)

nchar(texto)
substr(texto,0,8)

#pacote de string
library(stringr)

strsplit(texto,'verdadeiramente')
str_count(texto,'é')
