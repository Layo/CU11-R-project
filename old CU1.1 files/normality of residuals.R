# HUE BREAST
mean(glm.HueBreast.9.6.12$residuals)
sd(glm.HueBreast.9.6.12$residuals)
length(glm.HueBreast.9.6.12$residuals)
ks.test(glm.HueBreast.9.6.12$residuals, pnorm(213, 5.944583e-15, 0.9897567))

par(mfrow = c(1,2), mar = c(5,4,7,2))
hist(glm.HueBreast.9.6.12$residuals, main = 'Hue Breast')
qqnorm(glm.HueBreast.9.6.12$residuals, main = '')
mtext('KS test = D = 0.8404, p-value = 0.4831', side= 3, line = 2)


# HUE CROWN
mean(glm.HueCrown.9.6.12$residuals)
sd(glm.HueCrown.9.6.12$residuals)
length(glm.HueCrown.9.6.12$residuals)
ks.test(glm.HueCrown.9.6.12$residuals, pnorm(159, 9.339873e-15, 1.338689))

par(mfrow = c(1,2), mar = c(5,4,7,2))
hist(glm.HueCrown.9.6.12$residuals, main = 'Hue Crown')
qqnorm(glm.HueCrown.9.6.12$residuals, main = '')
mtext('KS test = D = 0.7925, p-value = 0.5605', side= 3, line = 2)


# HUE SCAPULARS
mean(glm.HueScaps.9.6.12$residuals)
sd(glm.HueScaps.9.6.12$residuals)
length(glm.HueScaps.9.6.12$residuals)
ks.test(glm.HueScaps.9.6.12$residuals, pnorm(212, -2.213762e-14, 2.125055))

par(mfrow = c(1,2), mar = c(5,4,7,2))
hist(glm.HueScaps.9.6.12$residuals, main = 'Hue Scapulars')
qqnorm(glm.HueScaps.9.6.12$residuals, main = '')
mtext('KS test = D = 0.7594, p-value = 0.4883', side= 3, line = 2)

# SAT BREAST
mean(glm.SatBreast.9.6.12$residuals)
sd(glm.SatBreast.9.6.12$residuals)
length(glm.SatBreast.9.6.12$residuals)
ks.test(glm.SatBreast.9.6.12$residuals, pnorm(213, 9.702915e-15, 3.786415))

par(mfrow = c(1,2), mar = c(5,4,7,2))
hist(glm.SatBreast.9.6.12$residuals, main = 'Saturation Breast')
qqnorm(glm.SatBreast.9.6.12$residuals, main = '')
mtext('KS test = D = 0.6009, p-value = 0.8037', side= 3, line = 2)

# SAT CROWN
mean(glm.SatCrown.9.6.12$residuals)
sd(glm.SatCrown.9.6.12$residuals)
length(glm.SatCrown.9.6.12$residuals)
ks.test(glm.SatCrown.9.6.12$residuals, pnorm(159, 2.690246e-14, 3.138207))

par(mfrow = c(1,2), mar = c(5,4,7,2))
hist(glm.SatCrown.9.6.12$residuals, main = 'Saturation Crown')
qqnorm(glm.SatCrown.9.6.12$residuals, main = '')
mtext('KS test = D = 0.5975, p-value = 0.87', side= 3, line = 2)

# SAT SCAPULARS
mean(glm.SatScaps.9.6.12$residuals)
sd(glm.SatScaps.9.6.12$residuals)
length(glm.SatScaps.9.6.12$residuals)
ks.test(glm.SatScaps.9.6.12$residuals, pnorm(212, -5.554835e-14, 2.476318))

par(mfrow = c(1,2), mar = c(5,4,7,2))
hist(glm.SatScaps.9.6.12$residuals, main = 'Saturation Scapulars')
qqnorm(glm.SatScaps.9.6.12$residuals, main = '')
mtext('KS test = D = 0.6321, p-value = 0.8214', side= 3, line = 2)

# BRIGHTNESS BREAST
mean(glm.BrightnessBreast.9.6.12$residuals)
sd(glm.BrightnessBreast.9.6.12$residuals)
length(glm.BrightnessBreast.9.6.12$residuals)
ks.test(glm.BrightnessBreast.9.6.12$residuals, pnorm(240, 5.096778e-14, 5.290978))

par(mfrow = c(1,2), mar = c(5,4,7,2))
hist(glm.BrightnessBreast.9.6.12$residuals, main = 'Brightness Breast')
qqnorm(glm.BrightnessBreast.9.6.12$residuals, main = '')
mtext('KS test = D = 0.6321, p-value = 0.8214', side= 3, line = 2)

# BRIGHTNESS CROWN
mean(glm.BrightnessCrown.9.6.12$residuals)
sd(glm.BrightnessCrown.9.6.12$residuals)
length(glm.BrightnessCrown.9.6.12$residuals)
ks.test(glm.BrightnessCrown.9.6.12$residuals, pnorm(159, -2.301683e-15, 3.51022))

par(mfrow = c(1,2), mar = c(5,4,7,2))
hist(glm.BrightnessCrown.9.6.12$residuals, main = 'Brightness Crown')
qqnorm(glm.BrightnessCrown.9.6.12$residuals, main = '')
mtext('KS test = D = 0.6321, p-value = 0.8214', side= 3, line = 2)

# BRIGHTNESS SCAPULARS
mean(glm.BrightnessScaps.9.6.12$residuals)
sd(glm.BrightnessScaps.9.6.12$residuals)
length(glm.BrightnessScaps.9.6.12$residuals)
ks.test(glm.BrightnessScaps.9.6.12$residuals, pnorm(212, 3.588308e-15, 2.426406))

par(mfrow = c(1,2), mar = c(5,4,7,2))
hist(glm.BrightnessScaps.9.6.12$residuals, main = 'Brightness Scapulars')
qqnorm(glm.BrightnessScaps.9.6.12$residuals, main = '')
mtext('KS test = D = 0.6321, p-value = 0.8214', side= 3, line = 2)