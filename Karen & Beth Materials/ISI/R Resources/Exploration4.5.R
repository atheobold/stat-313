
##Load the patientSatisfaction dataset, e.g.
patientSatisfaction= read.delim("http://www.isi-stats.com/isi2/data/patientSatisfaction.txt")
head(patientSatisfaction)

#A way to eliminate need to repeat data frame name each time
attach(patientSatisfaction)

##Patient satisfaction by age group
library("lattice")
histogram(~satisfaction | AgeGroup)
boxplot(satisfaction ~ AgeGroup)

#Numerical summaries
load(url("http://www.isi-stats.com/isi2/ISI.RData"))
isisummary(satisfaction, AgeGroup)

#One-variable ANOVA
summary(aov(satisfaction ~ AgeGroup))

#Statistical model with effect coding
model1=lm(satisfaction ~ AgeGroup, contrasts = list(AgeGroup="contr.sum")); model1
summary(model1)$r.squared


#Statistical model with indicator coding with age50-64 as reference group
AgeGroupOld <- relevel(as.factor(AgeGroup), ref="age50-64")
model1b=lm(satisfaction ~ AgeGroupOld); model1b

#ANOVA tables
anova(model1)
anova(model1b)

## Exploration
plot(satisfaction~anxiety)
boxplot(anxiety ~ AgeGroup)

## Two-variable model
model2 = lm(satisfaction ~ anxiety + AgeGroupOld)
summary(model2)

model2b = lm(satisfaction ~ anxiety + AgeGroup, contrasts = list(AgeGroup="contr.sum"))
summary(model2b)

##Visual
AgeColors = recode(AgeGroup, "'age20-34'='blue'; 'age35-49'='yellow'; 'age50-64'='red'")
plot(satisfaction ~ anxiety, col = AgeColors)
abline(129.04, -25.01, col = "blue")
abline(113.49, -25.01, col = "yellow")
abline(104.6 , -25.01, col = "red")

#ANOVA table
Anova(model2)

##Partial F test
anova(model1, model2)

##coplot
coplot(satisfaction ~ anxiety |AgeGroup, panel=panel.smooth)

#Fit model with interaction
model3 = lm(satisfaction ~ anxiety*AgeGroupOld)

#Compare models
summary(model2)$r.squared
summary(model3)$r.squared

#Fit three separate equations
model2034 = lm(satisfaction ~ anxiety, data=patientSatisfaction[AgeGroup=="age20-34",]); model2034
model3549 = lm(satisfaction ~ anxiety, data=patientSatisfaction[AgeGroup=="age35-49",]); model3549
model5064 = lm(satisfaction ~ anxiety, data=patientSatisfaction[AgeGroup=="age50-64",]); model5064

#Fit the two-variable model with interaction, with indicator coding
summary(model3)


#Significance of interaction
Anova(model3)
anova(model2, model3)
