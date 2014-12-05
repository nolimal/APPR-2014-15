# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke geotimesexiscedvecmanj-csv.csv
uvoziPodatki1 <- function() {
  return(read.csv2("podatki/geotimesexiscedvecmanj-csv.csv",
                   header = FALSE, sep = ";", as.is = TRUE,
                   col.names = c("Država", "Spol", paste("Skupno", 2008:2013), "Primerjava 1", paste("Ravni 0-2", 2008:2013),"Primerjava 2",paste("Ravni 3-4", 2008:2013),"Primerjava 3",paste0("Ravni 5-8", 2008:2013),"Primerjava 4"),
                   na.strings = "NA", skip = 10, fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico ZaposlenostEU.
cat("Uvažam podatke o zaposlenosti v EU...razpredelnica ZaposlenostEU\n\n")
ZaposlenostEU <- uvoziPodatki1()
ZaposlenostEU$ZaposlenostEU[,3:8] <- as.numeric(ZaposlenostEU$ZaposlenostEU[,3:8])
ZaposlenostEU$ZaposlenostEU[,10:15] <- as.numeric(ZaposlenostEU$ZaposlenostEU[,10:15])
ZaposlenostEU$ZaposlenostEU[,17:22] <- as.numeric(ZaposlenostEU$ZaposlenostEU[,17:22])
ZaposlenostEU$ZaposlenostEU[,24:29] <- as.numeric(ZaposlenostEU$ZaposlenostEU[,24:29])


#Zapišimo podatke o povprečni vrednosti za razpredelnico ZaposlenostEU v matriko.
cat("Matrika povprečnih vrednosti za ZaposlenostEU...matrika povprecje\n\n")
OK.vrsticeZaposlenostEU<-!apply(is.na(ZaposlenostEU), 1, any)
stolpci.ra<-substr(names(ZaposlenostEU),1,2)=="Sk"
stolpci.rb<-substr(names(ZaposlenostEU),1,10)=="Ravni.0.2."
stolpci.rc<-substr(names(ZaposlenostEU),1,10)=="Ravni.3.4."
stolpci.rd<-substr(names(ZaposlenostEU),1,9)=="Ravni.5.8"

povprecje.ra08t<-mean(ZaposlenostEU[stolpci.ra][,1][seq(1,96,3)])
povprecje.ra08m<-mean(ZaposlenostEU[stolpci.ra][,1][seq(2,96,3)])
povprecje.ra08f<-mean(ZaposlenostEU[stolpci.ra][,1][seq(3,96,3)])
povprecje.ra09t<-mean(ZaposlenostEU[stolpci.ra][,2][seq(1,96,3)])
povprecje.ra09m<-mean(ZaposlenostEU[stolpci.ra][,2][seq(2,96,3)])
povprecje.ra09f<-mean(ZaposlenostEU[stolpci.ra][,2][seq(3,96,3)])
povprecje.ra10t<-mean(ZaposlenostEU[stolpci.ra][,3][seq(1,96,3)])
povprecje.ra10m<-mean(ZaposlenostEU[stolpci.ra][,3][seq(2,96,3)])
povprecje.ra10f<-mean(ZaposlenostEU[stolpci.ra][,3][seq(3,96,3)])
povprecje.ra11t<-mean(ZaposlenostEU[stolpci.ra][,4][seq(1,96,3)])
povprecje.ra11m<-mean(ZaposlenostEU[stolpci.ra][,4][seq(2,96,3)])
povprecje.ra11f<-mean(ZaposlenostEU[stolpci.ra][,4][seq(3,96,3)])
povprecje.ra12t<-mean(ZaposlenostEU[stolpci.ra][,5][seq(1,96,3)])
povprecje.ra12m<-mean(ZaposlenostEU[stolpci.ra][,5][seq(2,96,3)])
povprecje.ra12f<-mean(ZaposlenostEU[stolpci.ra][,5][seq(3,96,3)])
povprecje.ra13t<-mean(ZaposlenostEU[stolpci.ra][,6][seq(1,96,3)])
povprecje.ra13m<-mean(ZaposlenostEU[stolpci.ra][,6][seq(2,96,3)])
povprecje.ra13f<-mean(ZaposlenostEU[stolpci.ra][,6][seq(3,96,3)])

povprecje.ra = matrix(c(povprecje.ra08t, povprecje.ra08m, povprecje.ra08f, povprecje.ra09t, povprecje.ra09m, povprecje.ra09f,povprecje.ra10t, povprecje.ra10m, povprecje.ra10f,povprecje.ra11t, povprecje.ra11m, povprecje.ra11f, povprecje.ra12t, povprecje.ra12m, povprecje.ra12f, povprecje.ra13t, povprecje.ra13m, povprecje.ra13f), nrow=3, ncol=6)
dimnames(povprecje.ra) = list(c("oba spola", "moški","ženske"),c("2008", "2009", "2010","2011","2012","2013"))

povprecje.rb08t<-mean(ZaposlenostEU[stolpci.rb][,1][seq(1,96,3)])
povprecje.rb08m<-mean(ZaposlenostEU[stolpci.rb][,1][seq(2,96,3)])
povprecje.rb08f<-mean(ZaposlenostEU[stolpci.rb][,1][seq(3,96,3)])
povprecje.rb09t<-mean(ZaposlenostEU[stolpci.rb][,2][seq(1,96,3)])
povprecje.rb09m<-mean(ZaposlenostEU[stolpci.rb][,2][seq(2,96,3)])
povprecje.rb09f<-mean(ZaposlenostEU[stolpci.rb][,2][seq(3,96,3)])
povprecje.rb10t<-mean(ZaposlenostEU[stolpci.rb][,3][seq(1,96,3)])
povprecje.rb10m<-mean(ZaposlenostEU[stolpci.rb][,3][seq(2,96,3)])
povprecje.rb10f<-mean(ZaposlenostEU[stolpci.rb][,3][seq(3,96,3)])
povprecje.rb11t<-mean(ZaposlenostEU[stolpci.rb][,4][seq(1,96,3)])
povprecje.rb11m<-mean(ZaposlenostEU[stolpci.rb][,4][seq(2,96,3)])
povprecje.rb11f<-mean(ZaposlenostEU[stolpci.rb][,4][seq(3,96,3)])
povprecje.rb12t<-mean(ZaposlenostEU[stolpci.rb][,5][seq(1,96,3)])
povprecje.rb12m<-mean(ZaposlenostEU[stolpci.rb][,5][seq(2,96,3)])
povprecje.rb12f<-mean(ZaposlenostEU[stolpci.rb][,5][seq(3,96,3)])
povprecje.rb13t<-mean(ZaposlenostEU[stolpci.rb][,6][seq(1,96,3)])
povprecje.rb13m<-mean(ZaposlenostEU[stolpci.rb][,6][seq(2,96,3)])
povprecje.rb13f<-mean(ZaposlenostEU[stolpci.rb][,6][seq(3,96,3)])

povprecje.rb = matrix(c(povprecje.rb08t, povprecje.rb08m, povprecje.rb08f, povprecje.rb09t, povprecje.rb09m, povprecje.rb09f,povprecje.rb10t, povprecje.rb10m, povprecje.rb10f,povprecje.rb11t, povprecje.rb11m, povprecje.rb11f, povprecje.rb12t, povprecje.rb12m, povprecje.rb12f, povprecje.rb13t, povprecje.rb13m, povprecje.rb13f), nrow=3, ncol=6)
dimnames(povprecje.rb) = list(c("oba spola", "moški","ženske"),c("2008", "2009", "2010","2011","2012","2013"))

povprecje.rc08t<-mean(ZaposlenostEU[stolpci.rc][,1][seq(1,96,3)])
povprecje.rc08m<-mean(ZaposlenostEU[stolpci.rc][,1][seq(2,96,3)])
povprecje.rc08f<-mean(ZaposlenostEU[stolpci.rc][,1][seq(3,96,3)])
povprecje.rc09t<-mean(ZaposlenostEU[stolpci.rc][,2][seq(1,96,3)])
povprecje.rc09m<-mean(ZaposlenostEU[stolpci.rc][,2][seq(2,96,3)])
povprecje.rc09f<-mean(ZaposlenostEU[stolpci.rc][,2][seq(3,96,3)])
povprecje.rc10t<-mean(ZaposlenostEU[stolpci.rc][,3][seq(1,96,3)])
povprecje.rc10m<-mean(ZaposlenostEU[stolpci.rc][,3][seq(2,96,3)])
povprecje.rc10f<-mean(ZaposlenostEU[stolpci.rc][,3][seq(3,96,3)])
povprecje.rc11t<-mean(ZaposlenostEU[stolpci.rc][,4][seq(1,96,3)])
povprecje.rc11m<-mean(ZaposlenostEU[stolpci.rc][,4][seq(2,96,3)])
povprecje.rc11f<-mean(ZaposlenostEU[stolpci.rc][,4][seq(3,96,3)])
povprecje.rc12t<-mean(ZaposlenostEU[stolpci.rc][,5][seq(1,96,3)])
povprecje.rc12m<-mean(ZaposlenostEU[stolpci.rc][,5][seq(2,96,3)])
povprecje.rc12f<-mean(ZaposlenostEU[stolpci.rc][,5][seq(3,96,3)])
povprecje.rc13t<-mean(ZaposlenostEU[stolpci.rc][,6][seq(1,96,3)])
povprecje.rc13m<-mean(ZaposlenostEU[stolpci.rc][,6][seq(2,96,3)])
povprecje.rc13f<-mean(ZaposlenostEU[stolpci.rc][,6][seq(3,96,3)])

povprecje.rc = matrix(c(povprecje.rc08t, povprecje.rc08m, povprecje.rc08f, povprecje.rc09t, povprecje.rc09m, povprecje.rc09f,povprecje.rc10t, povprecje.rc10m, povprecje.rc10f,povprecje.rc11t, povprecje.rc11m, povprecje.rc11f, povprecje.rc12t, povprecje.rc12m, povprecje.rc12f, povprecje.rc13t, povprecje.rc13m, povprecje.rc13f), nrow=3, ncol=6)
dimnames(povprecje.rc) = list(c("oba spola", "moški","ženske"),c("2008", "2009", "2010","2011","2012","2013"))

povprecje.rd08t<-mean(ZaposlenostEU[stolpci.rd][,1][seq(1,96,3)])
povprecje.rd08m<-mean(ZaposlenostEU[stolpci.rd][,1][seq(2,96,3)])
povprecje.rd08f<-mean(ZaposlenostEU[stolpci.rd][,1][seq(3,96,3)])
povprecje.rd09t<-mean(ZaposlenostEU[stolpci.rd][,2][seq(1,96,3)])
povprecje.rd09m<-mean(ZaposlenostEU[stolpci.rd][,2][seq(2,96,3)])
povprecje.rd09f<-mean(ZaposlenostEU[stolpci.rd][,2][seq(3,96,3)])
povprecje.rd10t<-mean(ZaposlenostEU[stolpci.rd][,3][seq(1,96,3)])
povprecje.rd10m<-mean(ZaposlenostEU[stolpci.rd][,3][seq(2,96,3)])
povprecje.rd10f<-mean(ZaposlenostEU[stolpci.rd][,3][seq(3,96,3)])
povprecje.rd11t<-mean(ZaposlenostEU[stolpci.rd][,4][seq(1,96,3)])
povprecje.rd11m<-mean(ZaposlenostEU[stolpci.rd][,4][seq(2,96,3)])
povprecje.rd11f<-mean(ZaposlenostEU[stolpci.rd][,4][seq(3,96,3)])
povprecje.rd12t<-mean(ZaposlenostEU[stolpci.rd][,5][seq(1,96,3)])
povprecje.rd12m<-mean(ZaposlenostEU[stolpci.rd][,5][seq(2,96,3)])
povprecje.rd12f<-mean(ZaposlenostEU[stolpci.rd][,5][seq(3,96,3)])
povprecje.rd13t<-mean(ZaposlenostEU[stolpci.rd][,6][seq(1,96,3)])
povprecje.rd13m<-mean(ZaposlenostEU[stolpci.rd][,6][seq(2,96,3)])
povprecje.rd13f<-mean(ZaposlenostEU[stolpci.rd][,6][seq(3,96,3)])

povprecje.rd = matrix(c(povprecje.rd08t, povprecje.rd08m, povprecje.rd08f, povprecje.rd09t, povprecje.rd09m, povprecje.rd09f,povprecje.rd10t, povprecje.rd10m, povprecje.rd10f,povprecje.rd11t, povprecje.rd11m, povprecje.rd11f, povprecje.rd12t, povprecje.rd12m, povprecje.rd12f, povprecje.rd13t, povprecje.rd13m, povprecje.rd13f), nrow=3, ncol=6)
dimnames(povprecje.rd) = list(c("oba spola", "moški","ženske"),c("2008", "2009", "2010","2011","2012","2013"))

povprecje<-matrix(c(povprecje.ra,povprecje.rb,povprecje.rc,povprecje.rd), nrow=3)
dimnames(povprecje) = list(c("oba spola", "moški","ženske"),c("a2008", "a2009", "a2010","a2011","a2012","a2013","b2008", "b2009", "b2010","b2011","b2012","b2013","c2008", "c2009", "c2010","c2011","c2012","c2013","d2008", "d2009", "d2010","d2011","d2012","d2013"))

View(ZaposlenostEU)
View(povprecje)
# Funkcija, ki uvozi podatke iz datoteke slocsv.csv
uvoziPodatki2<-function(){
  return(read.csv2("podatki/slocsv.csv",
                   header = FALSE, sep = ";", as.is = TRUE,
                   col.names = c("Regija", "Spol", "Raven izobrazbe", "Aktivni 08", "Delež aktivnih 08", "Aktivni 09", "Delež aktivnih 09", "Aktivni 10", "Delež aktivnih 10", "Aktivni 11", "Delež aktivnih 11", "Aktivni 12", "Delež aktivnih 12", "Aktivni 13", "Delež aktivnih 13"),
                   na.strings = "N", skip = 3, fileEncoding = "Windows-1250"))
}
# Zapišimo podatke v razpredelnico AktivniSLO.
cat("Uvažam podatke o aktivnih v SLO...razpredelnica AktivniSLO\n\n")
AktivniSLO <- uvoziPodatki2()
OK.vrsticeAktivniSLO<-!apply(is.na(AktivniSLO), 1, any)



AktivniSLO$AktivniSLO[1:54,4:15] <- as.numeric(ZaposlenostEU$ZaposlenostEU[1:54,4:15])

# Dodajanje urejenostne spremenljivke v tabelo AktivniSLO.
cat("Dodam podatke o urejenostni spremenljivki Primerjava08.13...razpredelnica AktivniSLO\n\n")

urejenostna1<-rep("manj",length(AktivniSLO[,4]))
urejenostna1[AktivniSLO[,4]<AktivniSLO[,14]]<-"več"
primerjavaaktivni08in13<-factor(urejenostna1,levels=c("manj","več"),ordered=TRUE)
AktivniSLO["Primerjava.08.13"] <- primerjavaaktivni08in13

urejenostna2<-rep("manj",length(AktivniSLO[,4]))
urejenostna2[AktivniSLO[,5]<AktivniSLO[,15]]<-"več"
primerjavadeležaaktivni08in13<-factor(urejenostna2,levels=c("manj","več"),ordered=TRUE)
AktivniSLO["Primerjava.deleža.08.13"] <- primerjavadeležaaktivni08in13

AktivniSLO$Regija <- c(rep("Slovenija", 18),
                       rep("Vzhodna Slovenija", 18),
                       rep("Zahodna Slovenija", 18))
AktivniSLO$Spol <- rep(c(rep("Skupaj", 6),
                         rep("Moški", 6),
                         rep("Ženske", 6)), 3)

View(AktivniSLO)

# Funkcija, ki uvozi podatke iz spletne strani

# Ker imamo <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> potem nam ni potrebno podati parametra encoding
library(XML)
uvoziPodatki3<-function(){
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


tabelaxml1$Skupaj<-gsub("[.]", "", tabelaxml1$Skupaj, ignore.case=TRUE)
tabelaxml1$Moški<-gsub("[.]", "", tabelaxml1$Moški, ignore.case=TRUE)
tabelaxml1$Ženske<-gsub("[.]", "", tabelaxml1$Ženske, ignore.case=TRUE)
tabelaxml1$"Razmerje Ž/M"<-gsub(",", ".", tabelaxml1$"Razmerje Ž/M",)
tabelaxml1$"Razmerje Ž/M"<-as.numeric(tabelaxml1$"Razmerje Ž/M")

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