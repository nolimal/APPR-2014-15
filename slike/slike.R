pdf("grafi.pdf")


# Graf plač po sektorjih 

barplot(tabelaxml2$Skupaj,beside = TRUE,
        main="Plače po sektorjih", xlab="SEKTORJI",ylab="POVPREČNE PLAČE [€]",
        names.arg=rownames(tabelaxml2),
        col=rainbow(5),ylim=c(0,2000),xlim=c(0,8))

abline(h = seq(0,2000,250), col = "black", lty = "dotted")

legend("topright", rownames(tabelaxml2), fill = rainbow(5), cex=.60, pch=1, title="LEGENDA",bg = "white")


#Graf plač po poklicih

op <- par(cex=.64)

barplot(tabelaxml1$Skupaj,beside = TRUE,
        main="Plače po poklicih", xlab="POKLICI",ylab="POVPREČNE PLAČE [€]",
        col=rainbow(11),ylim=c(0,3000),xlim=c(0,25))

abline(h = seq(0,3000,250), col = "black", lty = "dotted")

legend("topright", c("Skupaj","Zakonodajalci, visoki uradniki, menedžerji",
"Strokovnjaki","Tehniki in drugi strokovni sodelavci","Uradniki",
"Poklici za storitve, prodajalci","Kmetovalci, gozdarji, ribiči, lovci",
"Poklici za neindustrijski način dela","Upravljalci strojev in naprav, industrijski izdelovalci in sestavljalci",
"Poklici za preprosta dela","Vojaški poklici"), 
       fill = rainbow(11), cex=.83, pch=2, title="LEGENDA",text.font=1)
text(20,100,"Vir: SURS (obdelal Nolimal Matevž)")
par(op)



#3D tortni diagram

library(plotrix)

slices <- tabelaxml2$Skupaj 
lbls <- c("Skupaj","Javni sektor","Sektor država","Javne družbe","Zasebni sektor")
pie3D(slices,labels=lbls,explode=0.15,
      main="Tortni diagram plač po sektorjih")

#shranimo v mapo APPR-2014-15
dev.off()



# Graf plač po sektorjih 

barplot(tabelaxml2$Skupaj,beside = TRUE,
        main="Plače po sektorjih", xlab="SEKTORJI",ylab="POVPREČNE PLAČE [€]",
        names.arg=rownames(tabelaxml2),
        col=rainbow(5),ylim=c(0,2000),xlim=c(0,8))

abline(h = seq(0,2000,250), col = "black", lty = "dotted")

legend("topright", rownames(tabelaxml2), fill = rainbow(5), cex=.60, pch=1, title="LEGENDA",bg = "white")

#Graf plač po poklicih

op <- par(cex=.64)

barplot(tabelaxml1$Skupaj,beside = TRUE,
        main="Plače po poklicih", xlab="POKLICI",ylab="POVPREČNE PLAČE [€]",
        col=rainbow(11),ylim=c(0,3000),xlim=c(0,25))

abline(h = seq(0,3000,250), col = "black", lty = "dotted")

legend("topright", c("Skupaj","Zakonodajalci, visoki uradniki, menedžerji",
                     "Strokovnjaki","Tehniki in drugi strokovni sodelavci","Uradniki",
                     "Poklici za storitve, prodajalci","Kmetovalci, gozdarji, ribiči, lovci",
                     "Poklici za neindustrijski način dela","Upravljalci strojev in naprav, industrijski izdelovalci in sestavljalci",
                     "Poklici za preprosta dela","Vojaški poklici"), 
       fill = rainbow(11), cex=.83, pch=2, title="LEGENDA",text.font=1)
text(20,100,"Vir: SURS (obdelal Nolimal Matevž)")
par(op)


# Tortni diagram

library(plotrix)

slices <- tabelaxml2$Skupaj 
lbls <- c("Skupaj","Javni sektor","Sektor država","Javne družbe","Zasebni sektor")
pie3D(slices,labels=lbls,explode=0.15,
      main="Tortni diagram plač po sektorjih")



# Graf oz. plot

# Opazovani po izobrazbi
Opazovani <- c("Skupaj","Brez izobrazbe, nepopolna osnovnošolska",
               "Osnovnošolska","Nižja ali srednja poklicna","Srednja strokovna, splošna",
               "Višješolska, visokošolska")
nopazovanih <- 6

# range x in y osi 
xrange <- range(2008:2013) 
yrange <- range(4:969) 

# postavimo plot 
plot(xrange, yrange, type="n", xlab="Leta",
     ylab="Aktivnost (v 1000)" ) 
colors <- rainbow(nopazovanih) 
linetype <- c(1:nopazovanih) 
plotchar <- seq(2008,2013,1)
tabelca<-AktivniSLO[1:6,seq(4,14,2)]
izobrazba<-AktivniSLO[1:6,3]
#dodajmo črte 

# dodamo naslov in podnaslov 
title("Aktivnost v Sloveniji", "primer Okunovega zakon")

# dodamo legendo
legend(xrange[1], yrange[2], 1:nopazovanih, cex=0.5, col=colors,
       pch=plotchar, lty=linetype, title="Izobrazba")
