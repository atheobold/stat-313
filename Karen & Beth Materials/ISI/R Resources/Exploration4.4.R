
##Load the FEV dataset, e.g.
FEVdata= read.delim("http://www.isi-stats.com/isi2/data/FEV.txt")
head(FEVdata)

##Produce histogram
library("lattice")
histogram(~FEVdata$FEV | FEVdata$Smoker)

#Numerical summaries
load(url("http://www.isi-stats.com/isi2/ISI.RData"))
isisummary(FEVdata$FEV, FEVdata$Smoker)

#Regression model with Smoker?
#effect coding
lm(FEV ~ Smoker, data = FEVdata, contrasts = list(Smoker="contr.sum"))
#indicator coding
lm(FEV ~ Smoker, data = FEVdata)

#Regression model with age
plot(FEV~Age, data = FEVdata)
abline(lm(FEV~Age, data = FEVdata))
lm(FEV~Age, data = FEVdata)

#Color coding plot
SmokerNum = as.numeric(FEVdata$Smoker == "yes")
plot(FEV~jitter(as.numeric(SmokerNum),.1), col = Age, data = FEVdata)

#Fancier
install.packages("plotly")
library(plotly)
fig <- plot_ly(FEVdata, y= ~FEV, x= ~SmokerNum)
add_markers(fig, color= ~Age)

#Added variable plot in R
library(car)
with(FEVdata, avPlots(lm(FEV~SmokerNum + Age)))$Age

#Statistical model with indicator coding
lm(FEV ~ Smoker + Age, data = FEVdata)
summary(lm(FEV ~ Smoker + Age, data = FEVdata))


#Fit two separate equations
modelS = lm(FEV ~ Age, data=FEVdata[FEVdata$Smoker=="yes",]); modelS
modelNS = lm(FEV ~ Age, data=FEVdata[FEVdata$Smoker=="no",]); modelNS

with(FEVdata, plot(FEV~Age))
abline(modelS, col="blue")
abline(modelNS, col = "red")

#TWo-variable model with interaction
lm(FEV ~ Smoker + Age + Smoker:Age, data = FEVdata)

#Significance of interaction
summary(lm(FEV ~ Smoker + Age + Smoker:Age, data = FEVdata)
)
anova(lm(FEV ~ Smoker + Age + Smoker:Age, data = FEVdata)
)

