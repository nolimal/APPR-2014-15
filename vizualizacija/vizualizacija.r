# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

#Uvozimo zemljevid sveta
cat("Uvažam zemljevid sveta...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")

#Logični vektor držav znotraj Evrope
evropa<-svet$continent%in%"Europe" | svet$name_long == "Cyprus"
#Podatki za države na področju Evrope
Evropa<-svet[evropa,]

#Logični vektor držav EU
eu<-Evropa$name_long%in%row.names(NezaposlenostEU)
#Podatki za države EU
EU<-Evropa[eu,]
#Znebimo se kolon s samimi NA-ji
mask <- sapply(EU, function(x) any(is.na(x)))
EU<-EU[!mask]
#Naredimo matriko NNezaposlenostEU
NNezaposlenostEU <- NezaposlenostEU[as.character(EU$name_long),]
EU$Skupno13<-NNezaposlenostEU$Skupno13

#Uredim koordinate in imena

koordinate <- coordinates(EU)
imena <- as.character(EU$name_long)
rownames(koordinate)<-imena
names(imena)<-imena

koordinate["Norway",1] <- koordinate["Norway",1] - 2
koordinate["Cyprus",2] <- koordinate["Cyprus",2] - 1
koordinate["United Kingdom",1] <- koordinate["United Kingdom",1]+1
koordinate["United Kingdom",2] <- koordinate["United Kingdom",2]-1
koordinate["Sweden",1] <- koordinate["Sweden",1]-1
koordinate["Greece",1] <- koordinate["Greece",1]-0.8
imena["United Kingdom"] <- "United\nKingdom"
imena["Czech Republic"] <- "Czech\nRepublic"

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid EU...\n")
pdf("slike/EU.pdf")


print(spplot(EU, "Skupno13", xlim=c(-25, 40), ylim=c(33, 73),
             main = "Stopnja nezaposlenosti v EU v letu 2013",
             col.regions = topo.colors(100),
             sp.layout = list(
               list("sp.polygons", NNezaposlenostEU[,1], fill = "white"),
               list("sp.text", koordinate, imena, cex = 0.3)),
             par.settings = list(panel.background=list(col="lightyellow"))))


dev.off() 

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
# preuredi <- function(podatki, zemljevid) {
#   nove.regije <- c()
#   manjkajo <- ! nove.regije %in% rownames(podatki)
#   M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
#   names(M) <- names(podatki)
#   row.names(M) <- nove.regije[manjkajo]
#   podatki <- rbind(podatki, M)
#   
#   out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$name_long)[rank(zemljevid$name_long)]), ]
#   if (ncol(podatki) == 1) {
#     out <- data.frame(out)
#     names(out) <- names(podatki)
#     rownames(out) <- rownames(podatki)
#   }
#   return(out)
# }
