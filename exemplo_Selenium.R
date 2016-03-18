library(RSelenium)
checkForServer()
startServer()
remDrv <- remoteDriver(browserName = 'firefox')
remDrv$open()

dados <- data.frame()
busca <- c("Petrobras","Alston","Siemens","Delta","Furnas")
for (termo in busca){
  remDrv$navigate('http://busca.estadao.com.br/')
  remDrv$findElement(using = "xpath", "//input[@id = 'myInputBusca']")$sendKeysToElement(list(termo))
  remDrv$findElement(using = "xpath", "//input[@type = 'submit']")$clickElement()
  pagina <- remDrv$getPageSource()[[1]]
  pagina <- htmlParse(pagina)
  titulos <- unlist(xpathSApply(pagina, "//h3", xmlValue))
  links <- unlist(xpathSApply(pagina, "//div[@class='listadesc']/a", xmlGetAttr, name = "href"))
  dados <- rbind(dados, data.frame(titulos, links))
}
# Seu codigo 
remDrv$closeWindow()
remDrv$quit()
remDrv$closeServer()

