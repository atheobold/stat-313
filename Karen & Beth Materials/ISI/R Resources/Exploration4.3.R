
##Load the CP foot/height data dataset, e.g.
footlength= read.delim("http://www.isi-stats.com/isi2/data/footlength.txt")
head(footlength)

##Produce histogram
hist(footlength$height)
#or
library("lattice")
histogram(footlength$height)

#Numerical summaries
load(url("http://www.isi-stats.com/isi2/ISI.RData"))
isisummary(footlength$height)

#Use footlength to predict height
with(footlength, plot(height~footsize))
with(footlength, lm(height~footsize))
with(footlength, abline(lm(height~footsize)))

#remove observation
footlength[footlength$height<61,]
footlength2 = footlength[-28,]
with(footlength2, plot(height~footsize))
with(footlength2, lm(height~footsize))
with(footlength2, abline(lm(height~footsize)))

footlength = footlength2

#ANOVA table
with(footlength, Anova(lm(height~footsize)))

#R-squared
model1 = with(footlength, summary(lm(height~footsize)))
model1
model1$r.squared

#SE residuals
model1$sigma

#Regresssion of height on sex
with(footlength, isisummary(height, sex))
with(footlength, lm(height~sex))  #indicator coding
with(footlength, lm(height ~ sex, contrasts = list(sex="contr.sum")))

model2 = with(footlength, summary(lm(height~sex)))
model2$r.squared

#Coded scatterplot
plot(footlength$height ~ footlength$footsize, col = as.factor(footlength$sex))

#Added variable plot in R
library(car)
with(footlength, avPlots(lm(height~footsize + sex)))

#Two-variable model
model3 = with(footlength, lm(height~footsize + sex, contrasts = list(sex="contr.sum")))
summary(model3)$r.squared
Anova(model3)

#coefficients
model3

#residual plots
plot(model3$fitted.values ~ model3$residuals)
histogram(model3$residuals)
