# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke geotimesexiscedvecmanj-csv.csv
uvoziPodatki1 <- function() {
  return(read.table("geotimesexiscedvecmanj-csv.csv",
                    header = FALSE, sep = ";", as.is = TRUE,
                    col.names = c("Država", "Spol", paste("Vse ISCED ravni", 2008:2013), "Primerjava", paste("Ravni 0-2", 2008:2013),"Primerjava",paste("Ravni 3-4", 2008:2013),"Primerjava",paste0("Ravni 5-8", 2008:2013),"Primerjava"),
                    na.strings = "NA", skip = 8, fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico Podatki1.
cat("Uvažam podatke o zaposlenosti...\n")
Podatki1 <- uvoziPodatki1()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.