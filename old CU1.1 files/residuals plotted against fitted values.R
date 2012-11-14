par(mfrow=c(3,3))

# HUE BREAST
a = glm.HueBreast.9.6.12
names(a)
fitted = a$fitted.values
length(fitted)
residuals = a$residuals
length(residuals)
plot(residuals~fitted)
title(main = "Hue Breast: ORICOLL")

# HUE CROWN
b = glm.HueCrown.9.6.12
names(b)
fitted = b$fitted.values
length(fitted)
residuals = b$residuals
length(residuals)
plot(residuals~fitted)
title(main = "Hue Crown: ORICOLL")


# HUE SCAPS
c = glm.HueScaps.9.6.12
names(c)
fitted = c$fitted.values
length(fitted)
residuals = c$residuals
length(residuals)
plot(residuals~fitted)
title(main = "Hue Breast: ORICOLL, MTHCOLL")


# SAT BREAST
d = glm.SatBreast.9.6.12
names(d)
fitted = d$fitted.values
length(fitted)
residuals = d$residuals
length(residuals)
plot(residuals~fitted)
title(main = "Sat Breast: ORICOLL, AGECURR")


# SAT CROWN
e = glm.SatCrown.9.6.12
names(e)
fitted = e$fitted.values
length(fitted)
residuals = e$residuals
length(residuals)
plot(residuals~fitted)
title(main = "Sat Crown: ORICOLL")


# SAT SCAPS
f = glm.SatCrown.9.6.12
names(f)
fitted = f$fitted.values
length(fitted)
residuals = f$residuals
length(residuals)
plot(residuals~fitted)
title(main = "Sat Scaps: ORICOLL")


# BRIGHT BREAST
g = glm.BrightnessBreast.9.6.12
names(g)
fitted = g$fitted.values
length(fitted)
residuals = g$residuals
length(residuals)
plot(residuals~fitted)
title(main = "Brightness Breast: ORICOLL, AGECOLL, AGECURR")


# BRIGHT CROWN
h = glm.BrightnessCrown.9.6.12
names(h)
fitted = h$fitted.values
length(fitted)
residuals = h$residuals
length(residuals)
plot(residuals~fitted)
title(main = "Brightness Crown: ORICOLL, AGECOLL")


# BRIGHT SCAPS
i = glm.BrightnessCrown.9.6.12
names(i)
fitted = i$fitted.values
length(fitted)
residuals = i$residuals
length(residuals)
plot(residuals~fitted)
title(main = "Hue Breast: ORICOLL, AGECOLl")

