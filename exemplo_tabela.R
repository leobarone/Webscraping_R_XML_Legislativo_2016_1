library(XML)

url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=inicio&lastPage=0&currentPage=FRANGO&act=detalhe&idDocumento=&rowsPerPage=100&currentPageDetalhe=1&tpDocumento=&method=search&text=%E1gua&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate="

dados <- data.frame()
for (i in 0:19){
  print(i)
  url <- gsub("FRANGO", i, url_base)
  tabela <- readHTMLTable(url)[[1]]
  dados <- rbind(dados, tabela)
}

#----------------------------------------------------
```{r}
url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=inicio&lastPage=0&currentPage=NUM_PAG&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate=#"
dados <- data.frame()
for (i in 0:4) {
  print(i)
  url <- gsub("NUM_PAG", i, url_base)
  lista.tabelas <- readHTMLTable(url, stringsAsFactors = FALSE)
  tabela <- lista.tabelas[[1]]
  dados <- rbind(dados, tabela)
```
