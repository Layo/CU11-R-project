# HUE BREAST
plot(whole.hueBreast.17.6.12$race,glm.HueBreast.9.6.12$residuals,main='Hue Breast')

# HUE CROWN
plot(whole.hueCrown.17.6.12$race,glm.HueCrown.9.6.12$residuals,main='Hue Crown')

# HUE SCAPULARS
par(mfrow = c(1,2))
plot(whole.hueScapulars.17.6.12$race,glm.HueScaps.9.6.12$residuals,main='Hue Scapulars')
plot(whole.hueScapulars.17.6.12$month,glm.HueScaps.9.6.12$residuals,main='Hue Scapulars')

# SATURATION BREAST
par(mfrow = c(1,2))
plot(whole.saturationBreast.17.6.12$race,glm.SatBreast.9.6.12$residuals,main='Saturation breast')
plot(whole.saturationBreast.17.6.12$time,glm.SatBreast.9.6.12$residuals,main='Saturation breast')

# SATURATION CROWN
plot(whole.saturationCrown.17.6.12$race,glm.SatCrown.9.6.12$residuals,main='Saturation crown')

# SATURATION SCAPULARS
plot(whole.saturationScapulars.17.6.12$race,glm.SatScaps.9.6.12$residuals,main='Saturation scpaulars')

# BRIGHTNESS BREAST
par(mfrow = c(1,3))
plot(whole.brightnessBreast.17.6.12  $Race,glm.BrightnessBreast.9.6.12$residuals,main='Brightness breast')
plot(whole.brightnessBreast.17.6.12  $Age,glm.BrightnessBreast.9.6.12$residuals,main='Brightness breast')
plot(whole.brightnessBreast.17.6.12  $Year,glm.BrightnessBreast.9.6.12$residuals,main='Brightness breast')

# BRIGHTNESS CROWN
par(mfrow = c(1,2))
plot(whole.brightnessCrown.17.6.12  $race,glm.BrightnessCrown.9.6.12$residuals,main='Brightness crown')
plot(whole.brightnessCrown.17.6.12  $age,glm.BrightnessCrown.9.6.12$residuals,main='Brightness crown')

# BRIGHTNESS SCAPULARS
par(mfrow = c(1,2))
plot(whole.brightnessScapulars.17.6.12  $race,glm.BrightnessScaps.9.6.12$residuals,main='Brightness scapulars')
plot(whole.brightnessScapulars.17.6.12  $age,glm.BrightnessScaps.9.6.12$residuals,main='Brightness scapulars')