load("~/Dropbox/Papers/CU1.1/CU11 R project/whole data/whole.cu1.2.0.Rdata")

# test

# test 2
# test 3
# test 4


#-----------------------------------------------R E G R E S S I O N   B R E A S T --------------------------------------------------
# ================================= HYS  variation in each of colour, saturation and brightness of specimens is due to the geography of the current taxonomic grouping of orientalis and arquata  (not age, season, time of collection) =================================
library(leaps)
allSubsetsBreastH <- regsubsets(BREASTH ~ ORICOLL + AGECOLL + AGECURR + MTHCOLL + SEX, data=whole, nbest=5)
plot (allSubsetsBreastH, scale='adjr2')
allSubsetsBreastH <- regsubsets(BREASTH ~ ORICOLL + MTHCOLL + SEX, data=whole, nbest=3) # suggests best model is one with fewest predictors ie ORICOLL, MTHCOLL and SEX
plot (allSubsetsBreastH, scale='adjr2')
lmBreastH <- lm(BREASTH ~ ORICOLL + MTHCOLL + SEX, data=whole) #  MTHCOLL + SEX NOT SIG IE REMOVED LEAVING....
lmBreastH <- lm(BREASTH ~ ORICOLL, data=whole) 

allSubsetsBreastS <- regsubsets(BREASTS ~ ORICOLL + AGECOLL + AGECURR + MTHCOLL + SEX, data=whole, nbest=5)
plot (allSubsetsBreastS, scale='adjr2')
lmBreastS <- lm(BREASTS ~ ORICOLL + AGECURR, data=whole) #  ONLY SIG VARIABLES ARE ORICOLL AND AGECURR SO ALL OTHERS REMOVED

allSubsetsBreastB <- regsubsets(BREASTB ~ ORICOLL + AGECOLL + AGECURR + MTHCOLL + SEX, data=whole, nbest=5)
plot (allSubsetsBreastB, scale='adjr2')
allSubsetsBreastB <- regsubsets(BREASTB ~ ORICOLL + AGECOLL + AGECURR + SEX, data=whole, nbest=5) # suggests best model is one with fewest predictors ie ORICOLL, AGECOLL and AGECUR
plot (allSubsetsBreastB, scale='adjr2')
lmBreastB <- lm(BREASTB ~ ORICOLL + AGECOLL + AGECURR, data=whole)


################################################# A S S U M P T I O N S   #################################################
# LINEARITY BETWEEN DV AND IV: fails = none
# INDEPENDENCE OF RESIDUALS: fails = none
# HOMOGENEITY OF RESIDUALS AGAINST FITTED VALUES: fails = BREASTB (sort-of fixed by ORICOLL4groups.lmBREASTB), BREASTS (sort of fixed by ORICOLL4groups.lmBREASTS)
# HOMOGENEITY OF RESIDUALS AGAINST EACH IV: fails = BREASTB (sort-of fixed by ORICOLL4groups.lmBREASTB), BREASTS (sort of fixed by ORICOLL4groups.lmBREASTS)
# NORMALITY OF RESIDUALS: fails = none
# OUTLIERS NOT HAVING TOO MUCH INFLUENCE: fails = 
library(plyr)

models = list(lmBreastH,lmBreastS,lmBreastB)

for(i in seq(models)) {
  plot(models[[i]]$fitted, models[[i]]$resid, main=paste("DV", paste(models[[i]]$call), sep="=")) # RESIDUALS~FITTED FOR HOMOGENEITY
} 


for(i in seq(models)) { 
  hist(models[[i]]$residuals, main=paste("DV",  paste(models[[i]]$call), sep="=")) # RESIDUALS HISTOGRAM FOR NORMALITY
  qqnorm(models[[i]]$residuals, main=paste("DV",  paste(models[[i]]$call), sep="=")) # QQ FOR NORMALITY
} 

for(i in seq(models)) {
  llply(models[[i]]$model[, -1, drop=FALSE], 
        function(x) plot(x, models[[i]]$resid, main=paste("DV",  paste(models[[i]]$call), sep="="))) # RESIDUALS~EXPLANATORY FOR HOMOGENEITY
} 


for(i in seq(models)) {
  llply(models[[i]]$model[, -1, drop=FALSE], 
        function(x) plot(x,models[[i]]$model[, 1], main=paste("DV", paste(models[[i]]$call), sep="="))) # RESPONSE~EXPLANATORY FOR LINEARITY AND HOMEGENEITY
}

ddply(lmBreastH$model, .(ORICOLL), summarise, var=var(BREASTH))

ddply(lmBreastS$model, .(ORICOLL), summarise, var=var(BREASTS))
ddply(lmBreastS$model, .(AGECURR), summarise, var=var(BREASTS))

ddply(lmBreastB$model, .(ORICOLL), summarise, var=var(BREASTB))
ddply(lmBreastB$model, .(AGECOLL), summarise, var=var(BREASTB))
ddply(lmBreastB$model, .(AGECURR), summarise, var=var(BREASTB))


library(lawstat)
LEVENES <- vector("list", length(models)) 
for (i in seq(models)) 
{
  levenesALL = llply(models[[i]]$model[,-1,drop=FALSE], 
                     function(x) levene.test(models[[i]]$residuals,x,location='mean'))
  LEVENES[[i]] <- levenesALL # LEVENES TEST 
} 

llply(models, function(x)  {
  ks.test(x$residuals, pnorm(length(x$mean(x$residuals), sd(x$residuals)))) # KS TEST FOR NORMALITY
}

# INFLUENTIALS AND OUTLIERS
# COOKS DISTANCES 
# plot(lm.CROWNB, which=4, cook.levels=(4/((length(na.omit(whole$CROWNB))-length(lm.CROWNB$coefficients)-2)))
# remove: 1949.46.20, 1951.13.331, 1922.12.19.14
# cooks.lm.CROWNB = update(lm.CROWNB, subset=-c(whole[c('1949.46.20','1951.13.331', '1922.12.19.14'),])

################################################ F I X  A S S U M P T I O N S   #################################################
# SOLVE HETEROSKEDASTICITY: TRANSFORMATIONS
      sqrt.BREASTS = lm(sqrt(BREASTS)~ORICOLL+AGECURR, data=whole) # SQUARE ROOT
sqrt.BREASTB = lm(sqrt(BREASTB)~ORICOLL+AGECOLL+AGECURR, data=whole)
levene.test(sqrt.BREASTS$residuals,sqrt.BREASTS$model[,2],location='mean')
levene.test(sqrt.BREASTB$residuals,sqrt.BREASTB$model[,2],location='mean')

# SOLVE HETEROSKEDASTICITY: GLS
#library(nlme)
BREASTB.m1 = gls(BREASTB~ORICOLL + AGECOLL + AGECURR, na.action=na.omit,data=whole)
varORICOLL = varIdent(form=~1 | ORICOLL)
gls.BREASTB = gls(BREASTB~ORICOLL+AGECOLL+AGECURR, na.action=na.omit,data=whole, weights=varORICOLL)
anova(BREASTB.m1, gls.BREASTB)

# SOLVE HETEROSKEDASTICITY: CHOP OFF ORIENTALIS WITH RESIDUALS >7
library(R2G2)
x = subset(x=whole,subset=whole$BREASTB > 0, select =  c(BREASTB,ORICOLL,AGECOLL,AGECURR, COORDSX, COORDSY))
y = na.omit(x)
y <- data.frame(y,lmBreastB$residuals,lmBreastB$fitted)
x = subset(y,y$lmBreastB.residuals >= 8, select =  
  c(BREASTB,ORICOLL,AGECOLL,AGECURR,COORDSX, COORDSY, lmBreastB.residuals,lmBreastB.fitted))
coords = cbind(x[,5],x[,6])
labels = 1:18
Dots2GE(coords, labels, goo = "Dots2GE.kml")

                        # SOLVE HETEROSKEDASTICITY: LOG
log.lmBREASTS = update(lmBreastS, log(BREASTS)~., data=whole)
log.lmBREASTB = update(lmBreastB, log(BREASTB)~., data=whole)
plot(log.lmBREASTS$residuals~ log.lmBREASTS$model[,2])
plot(log.lmBREASTB$residuals~ log.lmBREASTB$model[,2])
      

# ================================= HYS further subgroups of arquata and orientalis can be identified using HSB values  =================================
# SOLVE HETEROSKEDASTICITY: EUROPE VS ME/AFRICA VS INDIA VS ASIA GROUPING
load("~/Dropbox/Papers/CU1.1/CU11 R project/BREASTB4groups.RData")

ORICOLL4groups.lmBREASTS = lm(log(BREASTS)~ORICOLL+AGECURR, data=BREASTB4groups)
levene.test(ORICOLL4groups.lmBREASTS$residuals,ORICOLL4groups.lmBREASTS$model[,2],location='mean')
plot(ORICOLL4groups.lmBREASTS$residuals~ ORICOLL4groups.lmBREASTS$model[,2])

ORICOLL4groups.lmBREASTB = lm(log(BREASTB)~ORICOLL + AGECOLL + AGECURR,, data=BREASTB4groups)
levene.test(ORICOLL4groups.lmBREASTB$residuals,ORICOLL4groups.lmBREASTB$model[,2],location='mean')
plot(ORICOLL4groups.lmBREASTB$residuals~ ORICOLL4groups.lmBREASTB$model[,2])

# ================================= HYS arquata and orientalis are valid subspecies using HSB values and 75%/99% test  =================================

# ================================= HYS Orientalis brightness decreases faster than arquata  =================================

# ================================= HYS correlations between latitude, colour and size  =================================

# ================================= HYS no geographic differences within arquata indicating no differential migration in arquata  =================================

# ================================= HYS point samples can be taken and matched to specific colours =================================

# ================================= HYS is the difference in colour consistent throughout the year =================================

# ================================= HYS does orientalis only really become paler when it reaches it's wintering grounds =================================

# ================================= HYS orientalis is much paler on scapulars than arquata as this is the featherpart which receives most sun =================================
