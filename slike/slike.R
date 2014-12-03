# 3D Exploded Pie Chart
library(plotrix)
slices <- tabelaxml2$Skupaj 
lbls <- c("Skupaj","Javni sektor","Sektor država","Javne družbe","Zasebni sektor")
pie3D(slices,labels=lbls,explode=0.1,
      main="Tortni diagram plač po sektorjih")

# Simple Bar Plot 

barplot(tabelaxml2$Skupaj,beside = TRUE,
        main="Plače po sektorjih", xlab="Sektorji",ylab="Višina povprečne plače",
        names.arg=rownames(tabelaxml2),
        col=c("blue","red","yellow","green","pink"),ylim=c(0,2000))
# 
# # Create Line Chart
# 
# # convert factor to numeric for convenience 
# Orange$Tree <- as.numeric(Orange$Tree) 
# ntrees <- max(Orange$Tree)
# 
# # get the range for the x and y axis 
# xrange <- range(Orange$age) 
# yrange <- range(Orange$circumference) 
# 
# # set up the plot 
# plot(xrange, yrange, type="n", xlab="Age (days)",
#      ylab="Circumference (mm)" ) 
# colors <- rainbow(ntrees) 
# linetype <- c(1:ntrees) 
# plotchar <- seq(18,18+ntrees,1)
# 
# # add lines 
# for (i in 1:ntrees) { 
#   tree <- subset(Orange, Tree==i) 
#   lines(tree$age, tree$circumference, type="b", lwd=1.5,
#         lty=linetype[i], col=colors[i], pch=plotchar[i]) 
# } 
# 
# # add a title and subtitle 
# title("Tree Growth", "example of line plot")
# 
# # add a legend 
# legend(xrange[1], yrange[2], 1:ntrees, cex=0.8, col=colors,
#        pch=plotchar, lty=linetype, title="Tree")