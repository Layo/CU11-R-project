load("~/Dropbox/Papers/CU1.1/CU11 R project/whole data/whole.cu1.2.0.Rdata")

#----------------R E G R E S S I O N   B R E A S T--------------------------- 

# ===HYS  variation in each of colour, saturation and brightness of specimens is 
# due to the geography of the current taxonomic grouping of orientalis and arquata  
# (not age, season, time of collection) =================================

library(leaps)
everyPossibleModelBreasth <- regsubsets(breasth ~ oricoll + agecoll + agecurr + mthcoll + 
                                        sex, data=whole, nbest=5)
plot(everyPossibleModelBreasth, scale='adjr2')

# WHY: agecoll + agecurr removed as not stat sig
agecollAgecurrRemoved <- regsubsets(breasth ~ oricoll + mthcoll + sex, data=whole, 
                                    nbest=3) 
plot (agecollAgecurrRemoved, scale='adjr2')

# WHY: plot suggests running a linear regression with oricoll + mthcoll + sex as predictors
agecollAgecurrRemovedLmBreasth <- lm(breasth ~ oricoll + mthcoll + sex, data=whole) 

# WHY: but oricoll only stat sig predictor so left in
finalBreasth <- lm(breasth ~ oricoll, data=whole) 

everyPossibleModelBreasts <- regsubsets(breasts ~ oricoll + agecoll + agecurr + mthcoll + 
                                        sex, data=whole, nbest=5)
plot(everyPossibleModelBreasts, scale='adjr2')

# WHY: everyPossibleModelBreasts plot suggests leaving all predictors in
allPredictorsLmBreasts <- lm(breasts ~ oricoll + agecoll + agecurr + mthcoll + sex, data=whole) 

# WHY: but oricoll + agecurr only stat sig predictors 
finalBreasts <- lm(breasts ~ oricoll + agecurr, data=whole) 

everyPossibleModelBreastb <- regsubsets(breastb ~ oricoll + agecoll + agecurr + mthcoll + 
                                        sex, data=whole, nbest=5)
plot(everyPossibleModelBreastb, scale='adjr2')

# WHY: plot suggests oricoll + agecoll + agecurr only stat sig predictors, so only these included in model
oricollAgecollAgecurrBreastb <- regsubsets(breastb ~ oricoll + agecoll + agecurr, data=whole, nbest=5) 
plot(oricollAgecollAgecurrBreastb, scale='adjr2')
finalBreastb <- lm(breastb ~ oricoll + agecoll + agecurr, data=whole)


################################ A S S U M P T I O N S   ##############################
# LINEARITY BETWEEN DV AND IV: fails = none
# INDEPENDENCE OF RESIDUALS: fails = none
# HOMOGENEITY OF RESIDUALS AGAINST FITTED VALUES: fails = breastb (sort-of fixed by oricollCatBreastb), 
# breasts (sort of fixed by oricollCatBreasts)
# HOMOGENEITY OF RESIDUALS AGAINST EACH IV: fails = breastb (sort-of fixed by oricollCatBreastb), 
# breasts (sort of fixed by oricollCatBreasts)
# NORMALITY OF RESIDUALS: fails = none
# OUTLIERS NOT HAVING TOO MUCH INFLUENCE: fails = 

library(plyr)
breastModels = list(finalBreasth, finalBreasts, finalBreastb)

# RESIDUALS ~ FITTED FOR HOMOGENEITY
for(i in seq(breastModels)) {
  plot(breastModels[[i]]$fitted, breastModels[[i]]$resid, main=paste("DV", paste(breastModels[[i]]$call), sep="=")) 
} 

# RESIDUALS HISTOGRAM FOR NORMALITY
# QQ FOR NORMALITY
for(i in seq(breastModels)) { 
  hist(breastModels[[i]]$residuals, main=paste("DV", paste(breastModels[[i]]$call), sep="=")) 
  qqnorm(breastModels[[i]]$residuals, main=paste("DV",  paste(breastModels[[i]]$call), sep="=")) 
} 

# RESIDUALS ~ EXPLANATORY FOR HOMOGENEITY
for(i in seq(breastModels)) {
  llply(breastModels[[i]]$model[, - 1, drop=FALSE], 
        function(x) plot(x, breastModels[[i]]$resid, main=paste("DV",  paste(breastModels[[i]]$call), sep="="))) 
} 

llply(breastModels, function(x) {
  ks.test(x$residuals, pnorm(length(x$mean(x$residuals), sd(x$residuals))))
}

# RESPONSE ~ EXPLANATORY FOR LINEARITY AND HOMEGENEITY
for(i in seq(breastModels)) {
  llply(breastModels[[i]]$model[, - 1, drop=FALSE], 
        function(x) plot(x, breastModels[[i]]$model[, 1], main=paste("DV", paste(breastModels[[i]]$call), sep="="))) 
}
 

library(lawstat)
levenesTestEachPredictorEachModel <- vector("list", length(breastModels)) 
for (i in seq(breastModels)) {
  levenesAll = llply(breastModels[[i]]$model[, - 1, drop=FALSE], 
                     function(x) levene.test(breastModels[[i]]$residuals, x, location='mean'))
  levenesTestEachPredictorEachModel[[i]] <- levenesAll # levenes test 
} 

      ##################### F I X  A S S U M P T I O N S   #####################
      # SOLVE HETEROSKEDASTICITY: TRANSFORMATIONS
      sqrtFinalBreasts = lm(sqrt(breasts) ~ oricoll + agecurr, data=whole) # SQUARE ROOT
      sqrtFinalBreastb = lm(sqrt(breastb) ~ oricoll + agecoll + agecurr, data=whole)
      levene.test(sqrtFinalBreasts$residuals, sqrtFinalBreasts$model[, 2], location='mean') 
      levene.test(sqrtFinalBreastb$residuals, sqrtFinalBreastb$model[, 2], location='mean')
      
      # SOLVE HETEROSKEDASTICITY: GLS
      library(nlme)
      glsFinalBreastb = gls(breastb ~ oricoll + agecoll + agecurr, na.action=na.omit, data=whole)
      varOricoll = varIdent(form= ~ 1 | oricoll)
      weightedGlsFinalBreastb = gls(breastb ~ oricoll + agecoll + agecurr, na.action=na.omit, 
                                    data=whole, weights=varOricoll)
      anova(glsFinalBreastb, weightedGlsFinalBreastb)
      
    
      # SOLVE HETEROSKEDASTICITY: LOG
      logLmBreasts = update(lmBreasts, log(breasts) ~ . , data=whole)
      logLmBreastb = update(lmBreastb, log(breastb) ~ . , data=whole)
      plot(logLmBreasts$residuals ~ logLmBreasts$model[, 2])
      plot(logLmBreastb$residuals ~ logLmBreastb$model[, 2])
      
      # ===========HYS further subgroups of arquata and orientalis can be identified using HSB values  ============
      # SOLVE HETEROSKEDASTICITY: EUROPE VS ME/AFRICA VS INDIA VS ASIA GROUPING
      oricollCatBreasts = lm(log(breasts) ~ oricoll.cat + agecurr, data=whole)
      levene.test(oricollCatBreasts$residuals, oricollCatBreasts$model[, 2], location='mean')
      plot(oricollCatBreasts$residuals ~ oricollCatBreasts$model[, 2])
      
      oricollCatBreastb = lm(log(breastb) ~ oricoll + agecoll + agecurr, data=whole)
      levene.test(oricollCatBreastb$residuals, oricollCatBreastb$model[, 2], location='mean')
      plot(oricollCatBreastb$residuals ~ oricollCatBreastb$model[, 2])
      
      latitudePlot <- whole[, c('breasth','breasts','breastb','oricoll','oricoll.cat','coordsx')]
      latitudePlot <- na.omit(latitudePlot)
      
      x <- ddply(latitudePlot, .(oricoll.cat), summarise, meanOrigin=mean(na.omit(breastb)))
      
      #  scatterplot showing increase in brightness with latitude, sharp increase in brightness between arquata dn meAfrican
      # and small increase furhter east you go. Try same for hue and sat, and do in multiplot
      (curlew <- ggplot(latitudePlot, aes(x=coordsx, y=breastb, colour=oricoll.cat, shape=oricoll)) + 
          geom_point(size=8) +
          stat_smooth(method='lm', aes(group=1)) +
          labs(x='latitude', y='brightness') +
          scale_x_continuous(breaks=seq(- 10, 140, 5)) +
          annotate("text", x = 15, y = 29, label = "needs to be arquata") +
          annotate("text", x = 16, y = 26, label = "needs to be arquata") +
          annotate("pointrange", x = mean(na.omit(latitudePlot$coordsx[latitudePlot$oricoll.cat=='arquata'])), 
                   y = x$meanOrigin[1], ymin = x$meanOrigin[1], ymax = x$meanOrigin[1],
                   colour = "black", size = 2) +
                     annotate("pointrange", x = mean(na.omit(latitudePlot$coordsx[latitudePlot$oricoll.cat=='meAfrica'])), 
                              y = x$meanOrigin[2], ymin = x$meanOrigin[2], ymax = x$meanOrigin[2],
                              colour = "black", size = 2))
      
      
      # scatterplot showing increase in brightness with latitude, sharp increase in brightness between arquata dn meAfrican
      # and small increase furhter east you go. Try same for hue and sat, and do in multiplot
      (curlew <- ggplot(latitudePlot, aes(x=coordsx, y=breasth, colour=oricoll, shape=oricoll.cat)) + 
        geom_point(size=8))  
     
      
      
      # scatterplot showing increase in brightness with latitude, 
      # sharp increase in brightness between arquata dn meAfrican
      # and small increase furhter east you go. Try same for hue and sat, and do in multiplot
      (curlew <- ggplot(latitudePlot, aes(x=coordsx, y=breasts, colour=oricoll, shape=oricoll.cat)) + 
        geom_point(size=8))  
   
      
      # ==================HYS arquata and orientalis are valid subspecies using HSB values and 75%/99% test  ======
      
      # =================HYS Orientalis brightness decreases faster than arquata  =================================
      
      # ==================HYS correlations between latitude, colour and size  =================================
      
      # ================== HYS no geographic differences within arquata indicating no differential migration in arquata  =====
      
      # ================== HYS point samples can be taken and matched to specific colours =================================
      
      # ================== HYS is the difference in colour consistent throughout the year =================================
      
      # ================= HYS does orientalis only really become paler when it reaches it's wintering grounds ===============
      
      # ================ HYS orientalis is much paler on scapulars than arquata as this is the featherpart which receives most sun ========
