
##Load the fattyAcid dataset, e.g.
fattyAcid= read.delim("http://www.isi-stats.com/isi2/data/fattyAcid.txt")
head(fattyAcid)

##Produce histogram
hist(fattyAcid$FattyAcidRatio)
#or
library("lattice")
histogram(fattyAcid$FattyAcidRatio)

#Numerical summaries
load(url("http://www.isi-stats.com/isi2/ISI.RData"))
isisummary(fattyAcid$FattyAcidRatio)

#Subset by Cystosine
histogram(~fattyAcid$FattyAcidRatio | fattyAcid$Cytosine, layout=c(1,3))
isisummary(fattyAcid$FattyAcidRatio,fattyAcid$Cytosine)
boxplot(fattyAcid$FattyAcidRatio ~ fattyAcid$Cytosine, ylab="Fatty Acid Ratio", xlab = "Cytosine")

#ANOVA
with(fattyAcid, summary(aov(FattyAcidRatio ~ Cytosine)))

#residual SE
with(fattyAcid, (aov(FattyAcidRatio ~ Cytosine)))

#scatterplot with Copies
plot(fattyAcid$FattyAcidRatio~ fattyAcid$Copies)

#Fit regression line
with(fattyAcid, lm(FattyAcidRatio ~ Copies))

#Add regression line to scatterplot
abline(with(fattyAcid, lm(FattyAcidRatio ~ Copies)))

#ANOVA table for linear model
with(fattyAcid, Anova(lm(FattyAcidRatio ~ Copies)))

#Residual plots
modelLM = with(fattyAcid, lm(FattyAcidRatio ~ Copies))
plot(modelLM)
histogram(modelLM$residuals)
plot(modelLM$residuals ~ modelLM$fitted.values)

