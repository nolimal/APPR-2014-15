# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

#Uvozimo zemljevid sveta
cat("Uvažam zemljevid sveta...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")

#Logični vektor držav znotraj Evrope
evropa<-svet$continent%in%"Europe"
#Podatki za države na področju Evrope
Evropa<-svet[evropa,]

#Logični vektor držav EU
eu<-Evropa$name_long%in%NezaposlenostEU$Država
#Podatki za države EU
EU<-Evropa[eu,]

#Dodamo mankajoče države
manjkajoca.drzava <- c("Cyprus")
#Logični vektor kjer leži manjkajoča država
manjka<-svet$name_long%in%manjkajoca.drzava
#Podatki za manjkajočo državo
manjkajoca<-svet[manjka,]
#Združimo manjkajočo(manjkajoca) in data frame EU
EU<-merge(EU, manjkajoca, by = 0:63, all = TRUE)
#Opomba:Sedaj se velikost EU po vrsticah ujema z velikostjo NezaposlenostEU po vrsticah
#Znebimo se kolon s samimi NA-ji
mask <- sapply(EU, function(x) any(is.na(x)))
EU<-EU[!mask]

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
preuredi <- function(podatki, zemljevid) {
  nove.regije <- c()
  manjkajo <- ! nove.regije %in% rownames(podatki)
  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
  names(M) <- names(podatki)
  row.names(M) <- nove.regije[manjkajo]
  podatki <- rbind(podatki, M)
  
  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$NAME_1)[rank(zemljevid$NAME_1)]), ]
  if (ncol(podatki) == 1) {
    out <- data.frame(out)
    names(out) <- names(podatki)
    rownames(out) <- rownames(podatki)
  }
  return(out)
}

NNezaposlenostEU <- preuredi(NezaposlenostEU,EU)

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
# manjkajo <- ! manjkajoce.drzave %in% rownames(euro)
# M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(euro)))
# names(M) <- names(euro)
# row.names(M) <- manjkajoce.drzave[manjkajo]
# eeuro <- rbind(euro, M)[as.character(EU$name_long),]
# 
# izbor <- !is.na(eeuro[,6])
# koordinate <- coordinates(EU[izbor,])
# imena <- as.character(EU$name[izbor])
# rownames(koordinate) <- imena
# names(imena) <- imena
# koordinate["Norway",1] <- koordinate["Norway",1] - 2
# koordinate["Cyprus",2] <- koordinate["Cyprus",2] - 1
# koordinate["United Kingdom",1] <- koordinate["United Kingdom",1]+1
# koordinate["United Kingdom",2] <- koordinate["United Kingdom",2]-1
# koordinate["Sweden",1] <- koordinate["Sweden",1]-1
# koordinate["Greece",1] <- koordinate["Greece",1]-0.8
# imena["United Kingdom"] <- "United\nKingdom"
# 
# 
# # Narišimo zemljevid v PDF.
# cat("Rišem zemljevid europe...\n")
# pdf("slike/europa.pdf")
# 
# 
# EU$ <- eeuro[,6]
# print(spplot(EU, "voda2005", xlim=c(-25, 40), ylim=c(33, 73),
#              main = "Preskrba z vodo v Evropi (leto 2005)",
#              col.regions = topo.colors(100),
#              sp.layout = list(
#                list("sp.polygons", EU[is.na(eeuro[,6]),], fill = "white"),
#                list("sp.text", koordinate, imena, cex = 0.3)),
#              par.settings = list(panel.background=list(col="lightyellow"))))
# 
# 
# dev.off()