# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke geotimesexiscedvecmanj-csv.csv
uvoziPodatki1 <- function() {
  return(read.csv2("geotimesexiscedvecmanj-csv.csv",
                    header = FALSE, sep = ";", as.is = TRUE,
                    col.names = c("Država", "Spol", paste("Skupno", 2008:2013), "Primerjava 1", paste("Ravni 0-2", 2008:2013),"Primerjava 2",paste("Ravni 3-4", 2008:2013),"Primerjava 3",paste0("Ravni 5-8", 2008:2013),"Primerjava 4"),
                    na.strings = "NA", skip = 10, fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico ZaposlenostEU.
cat("Uvažam podatke o zaposlenosti...\n")
ZaposlenostEU <- uvoziPodatki1()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.