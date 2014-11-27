# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke geotimesexiscedvecmanj-csv.csv
uvoziPodatki1 <- function() {
  return(read.csv2("geotimesexiscedvecmanj-csv.csv",
                    header = FALSE, sep = ";", as.is = TRUE,
                    col.names = c("Država", "Spol", paste("Skupno", 2008:2013), "Primerjava 1", paste("Ravni 0-2", 2008:2013),"Primerjava 2",paste("Ravni 3-4", 2008:2013),"Primerjava 3",paste0("Ravni 5-8", 2008:2013),"Primerjava 4"),
                    na.strings = "NA", skip = 10, fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico ZaposlenostEU.
cat("Uvažam podatke o zaposlenosti v EU...\n")
ZaposlenostEU <- uvoziPodatki1()


uvoziPodatki2<-function(){
  return(read.csv2("slocsv.csv",
                   header = FALSE, sep = ";", as.is = TRUE,
                   col.names = c("Regija", "Spol", "Raven izobrazbe", "Aktivni 08", "Delež aktivnih 08", "Aktivni 09", "Delež aktivnih 09", "Aktivni 10", "Delež aktivnih 10", "Aktivni 11", "Delež aktivnih 11", "Aktivni 12", "Delež aktivnih 12", "Aktivni 13", "Delež aktivnih 13"),
                   na.strings = "-", skip = 3, fileEncoding = "Windows-1250"))
}
# Zapišimo podatke v razpredelnico AktivniSLO.
cat("Uvažam podatke o aktivnih v SLO...\n")
AktivniSLO <- uvoziPodatki2()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.