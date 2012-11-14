#  models appear to violate homogenity of variance:
  # Hue Scapulars (ORICOLL)
  # Sat Breast (ORICOLL, AGECURR)
  # Bright Breast (ORICOLL,AGECOLL, AGECURR)


# HUE BREAST
#oricoll
1.093967    #var orientalis
0.8183962   #var arquata

levene.test(glm.HueBreast.9.6.12$residuals, whole.hueBreast.17.6.12[,"race"], location="mean")


# HUE CROWN
#oricoll
1.56586 #var orientalis
2.148825 #var arquata

levene.test(glm.HueCrown.9.6.12$residuals, whole.hueCrown.17.6.12[,"race"], location="mean")

# HUE SCAPULARS
#oricoll
3.72582 #var orientalis
7.247224 #var arquata

#mthcoll
5.135211 #j
2.89104 #f
4.598348 #m
3.821399 #a
2.67534 #m
4.699535 #j
0.7130151 #j
13.73382 #a
4.411453 #s
7.329744 #o
6.134607 #n
4.417851 #d

levene.test(hueScaps$residuals, whole.hueScaps[,"race"], location="mean")
levene.test(hueScaps$residuals, whole.hueScaps[,"month"], location="mean")

# SAT BREAST
#oricoll
18.58698 #var orientalis
9.026716 #var arquata

#time

levene.test(satBreast$residuals, whole.satBreast[,"race"], location="mean")
levene.test(satBreast$residuals, whole.satBreast[,"time"], location="mean")


# SAT CROWN
#oricoll
#var orientalis
#var arquata

levene.test(glm.SatCrown.9.6.12$residuals, whole.saturationCrown.17.6.12[,"race"], location="mean")


# SAT SCAPULARS
#oricoll
10.43995 #var orientalis
9.142542 #var arquata

levene.test(glm.SatScaps.9.6.12$residuals, whole.saturationScapulars.17.6.12[,"race"], location="mean")



# BRIGHTNESS BREAST
#oricoll
40.34323 #var orientalis
13.42268 #var arquata

#agecoll
32.40567# var 1y 
49.24977 # var ad

# time

levene.test(brightBreast$residuals, whole.brightBreast[,"Race"], location="mean")
levene.test(brightBreast$residuals, whole.brightBreast[,"Age"], location="mean")
levene.test(brightBreast$residuals, whole.brightBreast[,"Year"], location="mean")


# BRIGHTNESS CROWN
#oricoll
14.58001 #var orientalis
11.27425 #var arquata

#agecoll
13.39416 # var 1y 
14.9787 # var ad

levene.test(glm.BrightnessCrown.9.6.12$residuals, whole.brightnessCrown.17.6.12[,"race"], location="mean")
levene.test(glm.BrightnessCrown.9.6.12$residuals, whole.brightnessCrown.17.6.12[,"age"], location="mean")


# BRIGHTNESS SCAPULARS
#oricoll
7.935329 #var orientalis
3.870091 #var arquata

#agecoll
12.22603 # var 1y 
6.897042 # var ad

levene.test(glm.BrightnessCrown.9.6.12$residuals, whole.brightnessCrown.17.6.12[,"race"], location="mean")
levene.test(glm.BrightnessCrown.9.6.12$residuals, whole.brightnessCrown.17.6.12[,"age"], location="mean")

# INTERACTIONS
# Hue Scapulars:
summary((interaction.scapsHue = glm(scapshue~race+month+race*month, data = whole.hueScaps)))

# Sat Breast:
summary((interaction.breastSat = glm(breastsat~race+time+race*time, data = whole.satBreast)))

# Brightness Breast: 
summary((interaction.breastBright1 = glm(B.mean~Race+Age+Year+Race*Year, data = whole.brightBreast)))


# RE-RUN OF BRIGHTNESS BREAST TO SEE IF INTERACION GET RID OF VIOLATION OF HOMOGENITY: seemingly the variance problem remains
library(lawstat)
levene.test(interaction.breastBright1$residuals, whole.brightBreast[,"Race"], location="mean")
levene.test(interaction.breastBright1$residuals, whole.brightBreast[,"Age"], location="mean")
levene.test(interaction.breastBright1$residuals, whole.brightBreast[,"Year"], location="mean")
levene.test(interaction.breastBright1$residuals, whole.brightBreast[,"Race*Year"], location="mean")

# SQUARE ROOT TRANSFORMATIONS
# Hue Scapulars: 
scapshue = whole.hueScaps$scapshue
sqrt.scapshue = sqrt((scapshue+0.5))
x = whole.hueScaps[,2:5]
sqrt.whole.hueScaps = cbind(sqrt.scapshue,x)
sqrt.hueScaps = glm(sqrt.scapshue~race+month, data = sqrt.whole.hueScaps)
library(lawstat)
levene.test(sqrt.hueScaps$residuals, sqrt.whole.hueScaps[,"race"], location="mean")
levene.test(sqrt.hueScaps$residuals, sqrt.whole.hueScaps[,"month"], location="mean")

# Sat Breast: 
breastsat = whole.satBreast$breastsat
sqrt.breastsat = sqrt((breastsat+0.5))
x = whole.satBreast[,2:5]
sqrt.whole.satBreast = cbind(sqrt.breastsat,x)
sqrt.satBreast = glm(sqrt.breastsat~race+time, data = sqrt.whole.satBreast)
library(lawstat)
levene.test(sqrt.whole.satBreast$residuals, sqrt.whole.satBreast[,"race"], location="mean")
levene.test(sqrt.whole.satBreast$residuals, sqrt.whole.satBreast[,"time"], location="mean")

# Brightness Breast: 
breastbright = whole.brightBreast$B.mean
sqrt.breastbright = sqrt((breastbright+0.5))
x = whole.brightBreast[,2:5]
sqrt.breastbright = cbind(sqrt.breastbright,x)
sqrt.brightBreast = glm(sqrt.breastbright~Race+Age+Year, data = sqrt.breastbright)
library(lawstat)
levene.test(sqrt.brightBreast$residuals, sqrt.brightBreast[,"Race"], location="mean")
levene.test(sqrt.brightBreast$residuals, sqrt.brightBreast[,"Age"], location="mean")
levene.test(sqrt.brightBreast$residuals, sqrt.brightBreast[,"Year"], location="mean")