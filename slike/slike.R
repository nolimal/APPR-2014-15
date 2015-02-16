# pdf("slike/grafsektorji.pdf")
# 
# # Graf plač po sektorjih 
# 
# barplot(tabelaxml2$Skupaj,beside = TRUE,
#         main="Plače po sektorjih", xlab="SEKTORJI",ylab="POVPREČNE PLAČE [€]",
#         col=rainbow(5),ylim=c(0,2000),xlim=c(0,6.25))
# 
# abline(h = seq(0,2000,250), col = "black", lty = "dotted")
# 
# legend("topright", rownames(tabelaxml2), fill = rainbow(5), cex=.80, pch=-1, title="LEGENDA",bg = "white")
# text(5.5,1525,"Vir: SURS")
# 
# dev.off()
# 
# 
# pdf("slike/grafpoklici.pdf")
# 
# #Graf plač po poklicih
# 
# op <- par(cex=.64)
# 
# barplot(tabelaxml1$Skupaj,beside = TRUE, xlab="POKLICI",ylab="POVPREČNE PLAČE [€]",
#         col=rainbow(11),ylim=c(0,3000),xlim=c(0,13))
# title(main="Plače po poklicih", col.main="black", font.main=4)
# 
# abline(h = seq(0,3000,250), col = "black", lty = "dotted")
# 
# legend("topright", c("Skupaj","Zakonodajalci, visoki uradniki, menedžerji",
#                      "Strokovnjaki","Tehniki in drugi strokovni sodelavci","Uradniki",
#                      "Poklici za storitve, prodajalci","Kmetovalci, gozdarji, ribiči, lovci",
#                      "Poklici za neindustrijski način dela","Upravljalci strojev in naprav, industrijski izdelovalci in sestavljalci",
#                      "Poklici za preprosta dela","Vojaški poklici"), 
#        fill = rainbow(11), cex=1.3, pch=-1,bg = "white", title="LEGENDA",text.font=1)
# text(9,1800,"Vir: SURS (obdelal Nolimal Matevž)")
# par(op)
# 
# dev.off()
# 
# pdf("slike/graftorta.pdf")
# 
# # Tortni diagram
# 
# library(plotrix)
# 
# slices <- tabelaxml2$Skupaj 
# lbls <- c("Skupaj","Javni\nsektor","Sektor\ndržava","Javne\ndružbe","Zasebni\nsektor")
# pie3D(slices,labels=lbls,explode=0.15,start=1.5,labelrad=1.18,labelcex=1,
#       main="Tortni diagram plač po sektorjih")
# 
# dev.off()
# 
# pdf("slike/grafplot.pdf")
# 
# # Graf
# # Define 7 vectors
# 
# Skupaj <- c(996, 981, 966, 936, 924, 906)
# Brez_izobrazbe <- c(13, 11, 11, 7, 4, 4)
# Nepopolna_osnovnosolska<-c(13, 11, 11, 7, 4 ,4)
# Osnovnosolska<-c(134, 126, 121, 104, 99, 92)
# Nizja_ali_srednja_poklicna<-c(267, 252, 238, 228, 232, 222)
# Srednja_strokovna_splosna<-c(343, 345, 343, 331, 313, 302)
# Visjesolska_visokosolska<-c(238, 247, 253, 265, 276, 286)
# # Calculate range from 0 to max value of vectors
# g_range <- range(0, Skupaj, Brez_izobrazbe,
#                  Nepopolna_osnovnosolska, Osnovnosolska, 
#                  Nizja_ali_srednja_poklicna, Srednja_strokovna_splosna,
#                  Visjesolska_visokosolska)
# 
# # Graph Skupaj using y axis that ranges from 0 to max 
# # value in vectors.  Turn off axes and 
# # annotations (axis labels) so we can specify them ourself
# plot(Skupaj, type="o",pch=0, col=rainbow(1), ylim=g_range, 
#      axes=FALSE, ann=FALSE)
# 
# # Make x axis using 2008-2013 labels
# axis(1, at=1:6, lab=c("2008","2009","2010","2011","2012","2013"))
# 
# # Make y axis with horizontal labels that display ticks at 
# # every 250 marks. 20*0:g_range[2] is equivalent to c(0,4,8,12).
# axis(2, las=1, at=250*0:g_range[2])
# 
# # Create box around plot
# box()
# 
# # Graph Brez_izobrazbe with dashed line and square points
# lines(Brez_izobrazbe, type="o", pch=1, lty=2, col="#FFDB00FF")
# lines(Nepopolna_osnovnosolska, type="o", pch=2, lty=3, col="#49FF00FF")
# lines(Osnovnosolska, type="o", pch=3, lty=2, col="#00FF92FF")
# lines(Nizja_ali_srednja_poklicna, type="o", pch=4, lty=4, col="#0092FFFF")
# lines(Srednja_strokovna_splosna, type="o", pch=5, lty=5, col="#4900FFFF")
# lines(Visjesolska_visokosolska, type="o", pch=6, lty=6, col="#FF00DBFF")
# 
# # Create a title with a red, bold/italic font
# title(main="Aktivnost v Sloveniji", col.main="black", font.main=4)
# 
# # Label the x and y axes with dark green text
# title(xlab="Leta", col="black")
# title(ylab="Aktivnost (v 1000)", col="black")
# 
# # Create a legend at (1, g_range[2]) that is slightly smaller 
# # (cex) and uses the same line colors and points used by 
# # the actual plots 
# legend("right", c("Skupaj", "Brez izobrazbe","Nepopolna osnovnošolska", "Osnovnošolska", 
#                   "Nižja ali srednja poklicna", "Srednja strokovna splošna",
#                   "Višješolska visokošolska"), cex=0.8, 
#        col=rainbow(7), pch=0:6, lty=1:6)
# dev.off()

cairo_pdf("porocilo/graf.pdf", onefile = TRUE, family = "Arial")

barplot(tabelaxml2$Skupaj,beside = TRUE,main="Plače po sektorjih", xlab="SEKTORJI",
        ylab="POVPREČNE PLAČE [€]",col=rainbow(5),ylim=c(0,2000),xlim=c(0,6.25))

abline(h = seq(0,2000,250), col = "black", lty = "dotted")

legend("topright", rownames(tabelaxml2), fill = rainbow(5), cex=.80, pch=-1, title="LEGENDA",bg = "white")
text(5.5,1525,"Vir: SURS")

op <- par(cex=.64)

barplot(tabelaxml1$Skupaj,beside = TRUE, xlab="POKLICI",ylab="POVPREČNE PLAČE [€]",
        col=rainbow(11),ylim=c(0,3000),xlim=c(0,13))
title(main="Plače po poklicih", col.main="black", font.main=4)

abline(h = seq(0,3000,250), col = "black", lty = "dotted")

legend("topright", c("Skupaj","Zakonodajalci, visoki uradniki, menedžerji",
                     "Strokovnjaki","Tehniki in drugi strokovni sodelavci","Uradniki",
                     "Poklici za storitve, prodajalci","Kmetovalci, gozdarji, ribiči, lovci",
                     "Poklici za neindustrijski način dela","Upravljalci strojev in naprav, industrijski izdelovalci in sestavljalci",
                     "Poklici za preprosta dela","Vojaški poklici"), 
       fill = rainbow(11), cex=1.3, pch=-1,bg = "white", title="LEGENDA",text.font=1)
text(9,1800,"Vir: SURS (obdelal Nolimal Matevž)")
par(op)

library(plotrix)

slices <- tabelaxml2$Skupaj 
lbls <- c("Skupaj","Javni\nsektor","Sektor\ndržava","Javne\ndružbe","Zasebni\nsektor")
pie3D(slices,labels=lbls,explode=0.15,start=1.5,labelrad=1.18,labelcex=1,
      main="Tortni diagram plač po sektorjih")
# Graf
# Define 7 vectors

Skupaj <- c(996, 981, 966, 936, 924, 906)
Brez_izobrazbe <- c(13, 11, 11, 7, 4, 4)
Nepopolna_osnovnosolska<-c(13, 11, 11, 7, 4 ,4)
Osnovnosolska<-c(134, 126, 121, 104, 99, 92)
Nizja_ali_srednja_poklicna<-c(267, 252, 238, 228, 232, 222)
Srednja_strokovna_splosna<-c(343, 345, 343, 331, 313, 302)
Visjesolska_visokosolska<-c(238, 247, 253, 265, 276, 286)
# Calculate range from 0 to max value of vectors
g_range <- range(0, Skupaj, Brez_izobrazbe,
                 Nepopolna_osnovnosolska, Osnovnosolska, 
                 Nizja_ali_srednja_poklicna, Srednja_strokovna_splosna,
                 Visjesolska_visokosolska)

# Graph Skupaj using y axis that ranges from 0 to max 
# value in vectors.  Turn off axes and 
# annotations (axis labels) so we can specify them ourself
plot(Skupaj, type="o",pch=0, col=rainbow(1), ylim=g_range, 
     axes=FALSE, ann=FALSE)

# Make x axis using 2008-2013 labels
axis(1, at=1:6, lab=c("2008","2009","2010","2011","2012","2013"))

# Make y axis with horizontal labels that display ticks at 
# every 250 marks. 20*0:g_range[2] is equivalent to c(0,4,8,12).
axis(2, las=1, at=250*0:g_range[2])

# Create box around plot
box()

# Graph Brez_izobrazbe with dashed line and square points
lines(Brez_izobrazbe, type="o", pch=1, lty=2, col="#FFDB00FF")
lines(Nepopolna_osnovnosolska, type="o", pch=2, lty=3, col="#49FF00FF")
lines(Osnovnosolska, type="o", pch=3, lty=2, col="#00FF92FF")
lines(Nizja_ali_srednja_poklicna, type="o", pch=4, lty=4, col="#0092FFFF")
lines(Srednja_strokovna_splosna, type="o", pch=5, lty=5, col="#4900FFFF")
lines(Visjesolska_visokosolska, type="o", pch=6, lty=6, col="#FF00DBFF")

# Create a title with a red, bold/italic font
title(main="Aktivnost v Sloveniji", col.main="black", font.main=4)

# Label the x and y axes with dark green text
title(xlab="Leta", col="black")
title(ylab="Aktivnost (v 1000)", col="black")

# Create a legend at (1, g_range[2]) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots 
legend("right", c("Skupaj", "Brez izobrazbe","Nepopolna osnovnošolska", "Osnovnošolska", 
                  "Nižja ali srednja poklicna", "Srednja strokovna splošna",
                  "Višješolska visokošolska"), cex=0.8, 
       col=rainbow(7), pch=0:6, lty=1:6)

dev.off()