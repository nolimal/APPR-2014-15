# 4. faza: Analiza podatkov

# Uvozimo funkcijo za uvoz spletne strani.
source("lib/uvozi.zemljevid.r")

# Zapišimo podatke v razpredelnico GdpEU.
GdpEU <- read.csv2("podatki/nama_10_gdp_1_Data.csv", row.names=2,sep = ",",as.is = TRUE,
                   skip=0,
                   fileEncoding = "Windows-1250")

cat("Uvažam podatke o GDP v EU...razpredelnica GdpEU\n\n")

# Narišemo graf v datoteko PDF.
# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")
#Uvozimo zemljevid sveta
cat("Uvažam zemljevid sveta1...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")

#Logični vektor držav znotraj Evrope - dodana še Turčija
evropa1<-svet$continent%in%"Europe" | svet$name_long %in% c("Cyprus",
                                                           "Turkey")
#Podatki za države na področju Evrope
Evropa1<-svet[evropa1,]
h <- match(Evropa1$name_long, row.names(GdpEU))

#Logični vektor držav EU
eu1<-Evropa1$name_long%in%row.names(GdpEU)
#Podatki za države EU
EU1<-Evropa1[eu1,]

#Naredimo NNezaposlenostEU s spremembo indeksov(potrebna je bila pretvorba v character)
GGdpEU <- GdpEU[as.character(EU1$name_long),]
Evropa1$GDP13<-GdpEU$Trenutno[h]
Evropa1$GDP12<-GdpEU$Predhodno[h]
# podzemljevid za države s podatki - za izpis imen
EU1 <- Evropa1[!is.na(h),]

#Uredim koordinate in imena - samo za države s podatki
koordinate1 <- coordinates(EU1)
imena1 <- as.character(EU1$name_long)
rownames(koordinate1)<-imena1
names(imena1)<-imena1

koordinate1["Norway",1] <- koordinate1["Norway",1] - 2
koordinate1["Cyprus",2] <- koordinate1["Cyprus",2] - 1
koordinate1["United Kingdom",1] <- koordinate1["United Kingdom",1]+1
koordinate1["United Kingdom",2] <- koordinate1["United Kingdom",2]-1
koordinate1["Sweden",1] <- koordinate1["Sweden",1]-1
koordinate1["Greece",1] <- koordinate1["Greece",1]-0.8
imena1["United Kingdom"] <- "United\nKingdom"
imena1["Czech Republic"] <- "Czech\nRepublic"

Evropa1$GDP13[28]<-"8122.6"
Evropa1$GDP12[28]<-"8110.5"
Evropa1$Sprememba<-as.numeric(Evropa1$GDP13)-as.numeric(Evropa1$GDP12)
Evropa1$Rast<-Evropa1$Sprememba/as.numeric(Evropa1$GDP12)*100

#Narišimo zemljevid v PDF.
cat("Rišem zemljevid o stopnje rasti za države EU za leto 2013 v primerjavi za leto 2012...\n")
pdf("slike/EURast.pdf")
rot <- ifelse(imena1 == "Portugal", 90, 0)
print(spplot(Evropa1, "Rast", xlim=c(-25, 40), ylim=c(33, 73),
             main = "Stopnje rasti za države EU (v %)",
             col.regions = topo.colors(20),
             sp.layout = list(
               list("sp.polygons", Evropa1[is.na(h),], fill = "white"),
               list("sp.text", koordinate1, imena1, cex = 0.5,col="red", srt = rot)),
             par.settings = list(panel.background=list(col="lightyellow"))))
dev.off()

#Poiščimo povezave med BDP-jem in stopnjo nezaposlenosti po državah EU v letu 2013

#Dodajmo podatek o nezaposlenosti v razpredelnico Evropa1 iz razpredelnice Evropa
Evropa1$Nezaposleni<-Evropa$Skupno13
#Začnimo tako kot na vajah:
GdpEU$Sprememba<-as.numeric(GdpEU$Trenutno)-as.numeric(GdpEU$Predhodno)
GdpEU$Rast<-GdpEU$Sprememba/as.numeric(GdpEU$Predhodno)*100
GdpEU<-GdpEU[-16,]
GdpEU$Nezaposleni<-NezaposlenostEU$Skupno13
GdpEU<-GdpEU[,-1]

GdpEU[,2]<-as.numeric(GdpEU[,2])
GdpEU[,3]<-as.numeric(GdpEU[,3])
GdpEU[,4]<-as.numeric(GdpEU[,4])
GdpEU[,5]<-as.numeric(GdpEU[,5])
GdpEU[,6]<-as.numeric(GdpEU[,6])
zanima<-GdpEU[,5:6]
#1.primer LINEARNA ZVEZA
pdf("slike/EUOkunl.pdf")
attach(zanima)
plot(Rast,Nezaposleni)
lin <- lm(Nezaposleni ~ Rast)
abline(lin, col="blue")
predict(lin, data.frame(Rast=seq(-4,8,1)))
detach(zanima)
dev.off()
#2.primer NELINEARNA ZVEZA
#Narišimo graf v PDF.
cat("Rišem zemljevid Okunovega zakona za države EU...\n")
pdf("slike/EUOkunk.pdf")
attach(zanima)
plot(Rast,Nezaposleni)
kv <- lm(Nezaposleni ~ I(Rast^2) + Rast)
curve(predict(kv, data.frame(Rast=x)), add = TRUE, col = "red")
detach(zanima)
dev.off()

#Začnimo z analizo podatkov za Slovenijo
#Podatki so iz SURS-a
zanima1<-AktivniSLO[1,seq(4,14,2)]
zanima1[2,]<-AktivniSLO[1,seq(5,15,2)]
#dodajmo vrstico s podatki o bruto domačem proizvodu za Slovenijo v milijonih EUR
zanima1[3,1:6]<-c(37951,36166,36220,36868,23006,36144)
#uredimo imena
row.names(zanima1)<-c("Aktivni","Aktivni (v %)","BDP (v mio EUR)")
#Transponirajmo
zanima1<-t(zanima1)
#Definirajmo kot data frame
zanima1<-as.data.frame(zanima1, row.names = row.names(zanima1))
#Dodajmo stolpec deleža nezaposlenih
zanima1[,4]<-100-zanima1[,2]
#sprememnimo ime stolpca
names(zanima1)[4]<-"Neaktivni"
#Definirajmo kot data frame
zanima1<-as.data.frame(zanima1, row.names = row.names(zanima1))
#Dodajmo podatke o stopnji rasti
zanima1$RastBDP<-c(3.3,-7.8,1.2,0.6,-2.6,-1.0)
#Definirajmo kot data frame
zanima1<-as.data.frame(zanima1, row.names = row.names(zanima1))

#1.primer LINEARNA ZVEZA
pdf("slike/EUOkuns.pdf")
attach(zanima1)
plot(RastBDP,Neaktivni)
lin1 <- lm(Neaktivni ~ RastBDP)
abline(lin1, col="blue")
predict(lin1, data.frame(RastBDP=seq(-8,6,1)))
detach(zanima1)
dev.off()

#Narišimo graf v PDF.
# cat("Rišem zemljevid Okunovega zakona za Slovenijo med leti 2008 in 2013...\n")
# pdf("slike/EUOkuns.pdf")
# attach(zanima1)
# plot(Delež,Bruto)
# detach(zanima)
#dev.off()
