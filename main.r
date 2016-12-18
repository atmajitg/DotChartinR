library(dplyr)
data = read.csv("accdents.csv",header=TRUE)
abbs= read.table("abbs.txt", header=FALSE)
data=na.omit(data)
data = cbind(abbs,data)
data = arrange(data, desc(Rank))
brks=c(0,10,20,30,40,50,60)
col=c("#ccece6","#99d8c9","#66c2a4","#41ae76","#238b45","#005824")
clrs=cut(data$Rank,breaks = brks, right=FALSE,labels=col)
clrs=as.character(clrs)
par(bty="n", xaxt="n", mfcol=c(1,7))
dotchart(data$Rank,labels = data[,1], cex= 0.5, pch=19, color=clrs,main="Overall rank") # dotchart rank
abline(v=c(25), col="lightgrey")
#fatalities
fatalities=cut(data$Fatalities.Rate,breaks = brks, right=FALSE,labels=col) # bucket the fatalities
fatalities=as.character(fatalities)
dotchart(data$Fatalities.Rate,cex= 0.5, pch=19, color=fatalities, main="Fatalities")
abline(v=c(25), col="lightgrey")
#failure to obey
fobey=cut(data$Failure.to.Obey,breaks = brks, right=FALSE,labels=col) # bucket the failure to obey
fobey=as.character(fobey)
dotchart(data$Failure.to.Obey, cex= 0.5, pch=19, color=fobey, main ="Failure to Obey")
abline(v=c(25), col="lightgrey")
#Drunk Driving
dd=cut(data$Drunk.Driving,breaks = brks, right=FALSE,labels=col) # bucket the drunk driving
dd=as.character(dd)
dotchart(data$Drunk.Driving, cex= 0.5, pch=19, color=dd, main ="Drunk Driving")
abline(v=c(25), col="lightgrey")
# Speeding
speed=cut(data$Speeding,breaks = brks, right=FALSE,labels=col) # bucket the drunk driving
speed=as.character(speed)
dotchart(data$Speeding, cex= 0.5, pch=19, color=speed, main ="Speeding")
abline(v=c(25), col="lightgrey")
#careless driving
crldriving=cut(data$Careless.Driving,breaks = brks, right=FALSE,labels=col) # bucket the drunk driving
crldriving=as.character(crldriving)
dotchart(data$Careless.Driving, cex= 0.5, pch=19, color=crldriving, main ="Careless Driving")
abline(v=c(25), col="lightgrey")

#legend
plot(-1:15,-1:15,type="n", xaxt="n",yaxt="n", xlab="",ylab="",bty="n")
legend(-1,10,fill=c("#ccece6","#99d8c9","#66c2a4","#41ae76","#238b45","#005824"), legend=c("0-10","11-20","21-30","31-40","41-50","51-60"),bty="n")
