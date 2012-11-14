# Hue Breast: 55,11,150
cutoff <- 4/((nrow(whole.hueBreast.17.6.12)-length(glm.HueBreast.9.6.12$coefficients)-2))
plot(glm.HueBreast.9.6.12, which=4, cook.levels=cutoff)

# Hue Crown: 8,39,91
cutoff <- 4/((nrow(whole.hueCrown.17.6.12)-length(glm.HueCrown.9.6.12$coefficients)-2))
plot(glm.HueCrown.9.6.12, which=4, cook.levels=cutoff)

# Hue Scapulars: 10, 48, 53
cutoff <- 4/((nrow(whole.hueScaps.17.6.12)-length(glm.HueScaps.9.6.12$coefficients)-2))
plot(glm.HueScaps.9.6.12, which=4, cook.levels=cutoff)

# Sat Breast: 158, 165, 182
cutoff <- 4/((nrow(whole.satBreast.17.6.12)-length(glm.SatBreast.9.6.12$coefficients)-2))
plot(glm.SatBreast.9.6.12, which=4, cook.levels=cutoff)


# Sat Crown: 15, 129, 139
cutoff <- 4/((nrow(whole.saturationCrown.17.6.12)-length(glm.SatCrown.9.6.12$coefficients)-2))
plot(glm.SatCrown.9.6.12, which=4, cook.levels=cutoff)


# Sat Scapulars: 1, 115, 192
cutoff <- 4/((nrow(whole.saturationScapulars.17.6.12)-length(glm.SatScaps.9.6.12$coefficients)-2))
plot(glm.SatScaps.9.6.12, which=4, cook.levels=cutoff)


# Brightness Breast: 86, 111, 134
cutoff <- 4/((nrow(whole.brightnessBreast.17.6.12)-length(glm.BrightnessBreast.9.6.12$coefficients)-2))
plot(glm.BrightnessBreast.9.6.12, which=4, cook.levels=cutoff)

# Brightness Crown: 4, 61, 133
cutoff <- 4/((nrow(whole.brightnessCrown.17.6.12)-length(glm.BrightnessCrown.9.6.12$coefficients)-2))
plot(glm.BrightnessCrown.9.6.12, which=4, cook.levels=cutoff)

# Brightness Scapulars: 78, 111, 130
cutoff <- 4/((nrow(whole.brightnessScapulars.17.6.12)-length(glm.BrightnessScaps.9.6.12$coefficients)-2))
plot(glm.BrightnessScaps.9.6.12, which=4, cook.levels=cutoff)