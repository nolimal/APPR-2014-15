# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke geotimesexiscedvecmanj-csv.csv
uvoziPodatki1 <- function() {
  setwd("C:/Users/matevž/FMF/drugi letnik/APPR-2014-15/uvoz/program za uvoz")
  return(read.csv2("geotimesexiscedvecmanj-csv.csv",
                    header = FALSE, sep = ";", as.is = TRUE,
                    col.names = c("Država", "Spol", paste("Skupno", 2008:2013), "Primerjava 1", paste("Ravni 0-2", 2008:2013),"Primerjava 2",paste("Ravni 3-4", 2008:2013),"Primerjava 3",paste0("Ravni 5-8", 2008:2013),"Primerjava 4"),
                    na.strings = "NA", skip = 10, fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico ZaposlenostEU.
cat("Uvažam podatke o zaposlenosti v EU...razpredelnica ZaposlenostEU\n")
ZaposlenostEU <- uvoziPodatki1()

#Zapišimo podatke o povprečni vrednosti za razpredelnico ZaposlenostEU v matriko.
cat("Povprečne vrednosti za stolpce... matrike povprečij(.ra in .rb in .rc. in rd)\n")
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



# Funkcija, ki uvozi podatke iz datoteke slocsv.csv
uvoziPodatki2<-function(){
  setwd("C:/Users/matevž/FMF/drugi letnik/APPR-2014-15/uvoz/program za uvoz")
  return(read.csv2("slocsv.csv",
                   header = FALSE, sep = ";", as.is = TRUE,
                   col.names = c("Regija", "Spol", "Raven izobrazbe", "Aktivni 08", "Delež aktivnih 08", "Aktivni 09", "Delež aktivnih 09", "Aktivni 10", "Delež aktivnih 10", "Aktivni 11", "Delež aktivnih 11", "Aktivni 12", "Delež aktivnih 12", "Aktivni 13", "Delež aktivnih 13"),
                   na.strings = "-", skip = 3, fileEncoding = "Windows-1250"))
}
# Zapišimo podatke v razpredelnico AktivniSLO.
cat("Uvažam podatke o aktivnih v SLO...razpredelnica AktivniSLO\n")
AktivniSLO <- uvoziPodatki2()
