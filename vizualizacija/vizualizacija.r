# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

#Uvozimo zemljevid sveta
cat("Uvažam zemljevid sveta...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")

#Logični vektor držav znotraj Evrope - dodana še Turčija
evropa<-svet$continent%in%"Europe" | svet$name_long %in% c("Cyprus",
                                                           "Turkey")
#Podatki za države na področju Evrope
Evropa<-svet[evropa,]
m <- match(Evropa$name_long, row.names(NezaposlenostEU))

#Logični vektor držav EU
eu<-Evropa$name_long%in%row.names(NezaposlenostEU)
#Podatki za države EU
EU<-Evropa[eu,]

#Naredimo NNezaposlenostEU s spremembo indeksov(potrebna je bila pretvorba v character)
NNezaposlenostEU <- NezaposlenostEU[as.character(EU$name_long),]
Evropa$Skupno13<-NNezaposlenostEU$Skupno13[m]
Evropa$Moški13<-NNezaposlenostEU$Moški13[m]
Evropa$Ženske13<-NNezaposlenostEU$Ženske13[m]

# podzemljevid za države s podatki - za izpis imen
EU <- Evropa[!is.na(m),]

#Uredim koordinate in imena - samo za države s podatki
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

#PRIMERJAVA MED NEZAPOSLENOSTJO POPULACIJEV V LETU 2013 ZNORAJ EU
# Narišimo zemljevid v PDF.
cat("Rišem zemljevid o skupni nezaposlenosti v EU za leto 2013...\n")
pdf("slike/EUSkupno.pdf")


print(spplot(Evropa, "Skupno13", xlim=c(-25, 40), ylim=c(33, 73),
             main = "Stopnja nezaposlenosti v EU v letu 2013 (v %)",
             col.regions = topo.colors(100),
             sp.layout = list(
               list("sp.polygons", Evropa[is.na(m),], fill = "white"),
               list("sp.text", koordinate, imena, cex = 0.5,col="red")),
             par.settings = list(panel.background=list(col="lightyellow"))))
dev.off() 
# Narišimo zemljevid v PDF.
cat("Rišem zemljevid o nezaposlenosti moških v EU za leto 2013...\n")
pdf("slike/EUMoski.pdf")

print(spplot(Evropa, "Moški13", xlim=c(-25, 40), ylim=c(33, 73),
             main = "Stopnja nezaposlenosti v EU v letu 2013 (v %)",
             col.regions = topo.colors(100),
             sp.layout = list(
               list("sp.polygons", Evropa[is.na(m),], fill = "white"),
               list("sp.text", koordinate, imena, cex = 0.5,col="red")),
             par.settings = list(panel.background=list(col="lightyellow"))))
dev.off() 
# Narišimo zemljevid v PDF.
cat("Rišem zemljevid o nezaposlenosti žensk v EU za leto 2013...\n")
pdf("slike/EUzenske.pdf")


print(spplot(Evropa, "Ženske13", xlim=c(-25, 40), ylim=c(33, 73),
             main = "Stopnja nezaposlenih žensk v EU v letu 2013 (v %)",
             col.regions = topo.colors(100),
             sp.layout = list(
               list("sp.polygons", Evropa[is.na(m),], fill = "white"),
               list("sp.text", koordinate, imena, cex = 0.5,col="red")),
             par.settings = list(panel.background=list(col="lightyellow"))))


dev.off()

# Narišimo zemljevid v PDF.
# Uporabno za predstavo deleža nezaposlenih
cat("Rišem zemljevid o skupni populaciji v EU za leto 2013...\n")
koordinate1<-koordinate
koordinate1[,2]<-koordinate1[,2]+1
koordinate1["United Kingdom",2] <- koordinate1["United Kingdom",2]+0.5
koordinate1["Czech Republic",2] <- koordinate1["Czech Republic",2]+0.5

pdf("slike/prebivalstvo.pdf")
print(spplot(Evropa, "pop_est", xlim=c(-25, 40), ylim=c(33, 73),
            main = "Celotno ocenjeno prebivalstvo v letu 2013 v državah EU",
            col.regions = topo.colors(10),
            sp.layout = list(
              list("sp.polygons", Evropa[is.na(m),], fill = "white"),
              list("sp.text", koordinate, imena, cex = 0.5,col="red")),
            par.settings = list(panel.background=list(col="lightyellow"))))
dev.off
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