# HUE BREAST
plot(whole.hueBreast.17.6.12$race,whole.hueBreast.17.6.12$breasthue,main='Hue Breast')

# HUE CROWN
plot(whole.hueCrown.17.6.12$race,whole.hueCrown.17.6.12$crownhue,main='Hue Crown')

# HUE SCAPULARS
par(mfrow = c(1,2))
plot(whole.hueScapulars.17.6.12$race,whole.hueScapulars.17.6.12$scapshue,main='Hue Scapulars')
plot(whole.hueScapulars.17.6.12$month,whole.hueScapulars.17.6.12$scapshue,main='Hue Scapulars')

# SATURATION BREAST
par(mfrow = c(1,2))
plot(whole.saturationBreast.17.6.12$race,whole.saturationBreast.17.6.12$breastsat,main='Saturation breast')
plot(whole.saturationBreast.17.6.12$time,whole.saturationBreast.17.6.12$breastsat,main='Saturation breast')

# SATURATION CROWN
plot(whole.saturationCrown.17.6.12$race,whole.saturationCrown.17.6.12$crownsat,main='Saturation crown')

# SATURATION SCAPULARS
plot(whole.saturationScapulars.17.6.12$race,whole.saturationScapulars.17.6.12$scapssat,main='Saturation scpaulars')

# BRIGHTNESS BREAST
par(mfrow = c(1,3))
plot(whole.brightnessBreast.17.6.12  $Race,whole.brightnessBreast.17.6.12  $B.mean,main='Brightness breast')
plot(whole.brightnessBreast.17.6.12  $Age,whole.brightnessBreast.17.6.12  $B.mean,main='Brightness breast')
plot(whole.brightnessBreast.17.6.12  $Year,whole.brightnessBreast.17.6.12  $B.mean,main='Brightness breast')

# BRIGHTNESS CROWN
par(mfrow = c(1,2))
plot(whole.brightnessCrown.17.6.12  $race,whole.brightnessCrown.17.6.12  $crownbright,main='Brightness crown')
plot(whole.brightnessCrown.17.6.12  $age,whole.brightnessCrown.17.6.12  $crownbright,main='Brightness crown')

# BRIGHTNESS SCAPULARS
par(mfrow = c(1,2))
plot(whole.brightnessScapulars.17.6.12  $race,whole.brightnessScapulars.17.6.12  $scapsbright,main='Brightness scapulars')
plot(whole.brightnessScapulars.17.6.12  $age,whole.brightnessScapulars.17.6.12  $scapsbright,main='Brightness scapulars')