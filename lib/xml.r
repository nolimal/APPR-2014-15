# # Uvoz s spletne strani
# 
# library(XML)
# 
# # Vrne vektor nizov z odstranjenimi začetnimi in končnimi "prazninami" (whitespace)
# # iz vozlišč, ki ustrezajo podani poti.
# stripByPath <- function(x, path) {
#   unlist(xpathApply(x, path,
#                     function(y) gsub("^\\s*(.*?)\\s*$", "\\1", xmlValue(y))))
# }
# 
# uvozi.obcine <- function() {
#   url.obcine <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
#   doc.obcine <- htmlTreeParse(url.obcine, useInternalNodes=TRUE)
#   
#   # Poiščemo vse tabele v dokumentu
#   tabele <- getNodeSet(doc.obcine, "//table")
#   
#   # Iz druge tabele dobimo seznam vrstic (<tr>) neposredno pod
#   # trenutnim vozliščem
#   vrstice <- getNodeSet(tabele[[2]], "./tr")
#   
#   # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
#   # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
#   seznam <- lapply(vrstice[2:length(vrstice)], stripByPath, "./td")
#   
#   # Iz seznama vrstic naredimo matriko
#   matrika <- matrix(unlist(seznam), nrow=length(seznam), byrow=TRUE)
#   
#   # Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) prve tabele
#   colnames(matrika) <- gsub("\n", " ", stripByPath(tabele[[2]][[1]], ".//th"))
#   
#   # Podatke iz matrike spravimo v razpredelnico
#   return(data.frame(apply(gsub("\\*", "",
#                           gsub(",", ".",
#                           gsub("\\.", "", matrika[,2:5]))),
#                     2, as.numeric), row.names=matrika[,1]))
# }



# Funkcija, ki uvozi podatke iz spletne strani
# Ker imamo <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> potem nam ni potrebno podati parametra encoding
library(XML)
uvoziPodatki3<-function(){
  library(XML)
  naslov = "http://www.stat.si/novica_prikazi.aspx?id=6508"
  doc <- htmlTreeParse(naslov, encoding = "UTF-8", useInternal = TRUE)
}
# Zapišimo podatke v razpredelnico .
cat("Uvažam podatke o aktivnih v SLO po regijah...razpredelnica AktivniSLO1\n\n")

Spletnastran <- uvoziPodatki3()
# Obdelava podatkov iz spletne strani, torej podatki v tabelah
naslov = "http://www.stat.si/novica_prikazi.aspx?id=6508"
doc <- htmlTreeParse(naslov, encoding = "UTF-8", useInternal = TRUE)
r <- xmlRoot(doc)
tabelaxml1<-readHTMLTable(naslov,which=23)
tabelaxml1<-tabelaxml1[2:12,]
names(tabelaxml1)<-c("Poklicne skupine","Skupaj","Moški","Ženske","Razmerje Ž/M")


tabelaxml1$Skupaj<-gsub("[.]", "", tabelaxml1$Skupaj)
tabelaxml1$Moški<-gsub("[.]", "", tabelaxml1$Moški)
tabelaxml1$Ženske<-gsub("[.]", "", tabelaxml1$Ženske)

tabelaxml1$Skupaj<-as.numeric(tabelaxml1$Skupaj)
tabelaxml1$Moški<-as.numeric(tabelaxml1$Moški)
tabelaxml1$Ženske<-as.numeric(tabelaxml1$Ženske)

rownames(tabelaxml1)<-NULL
View(tabelaxml1)


#preverixml1<-str(tabelaxml1)


tabelaxml2<-readHTMLTable(naslov,which=27)
tabelaxml2<-tabelaxml2[2:6,]
names(tabelaxml2)<-c("Sektorji","Skupaj","Osnovnošolska izobrazba ali manj","Srednješolska izobrazba","Visoka, višja izobrazba")
rownames(tabelaxml2) <-tabelaxml2$Sektorji
tabelaxml2<-tabelaxml2[-1]

tabelaxml2[,1:4]<-apply(tabelaxml2[,1:4], 2, function(x) as.numeric(gsub("[.]", "", x)))
View(tabelaxml2)
#preverixml2<-str(tabelaxml2)
