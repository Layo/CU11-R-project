par(mfrow=c(3,3))


# RESPO
a = glm.HueBreast.9.6.12
names(a)
fitted = a$fitted.values
length(fitted)
length(fitted)
length(hb)
plot(hb~fitted)
title(main = "Hue Breast: ORICOLL")

# HUE CROWN
b = glm.HueCrown.9.6.12
names(b)
fitted = b$fitted.values
length(fitted)
length(fitted)
length(hc)
hc = na.omit(hc)
plot(hc~fitted)
title(main = "Hue Crown: ORICOLL")

# HUE SCAPS
c = glm.HueScaps.9.6.12
names(c)
fitted = c$fitted.values
length(fitted)
length(fitted)
length(hs)
plot(hs~fitted)
title(main = "Hue Breast: ORICOLL, MTHCOLL")


# SAT BREAST
d = glm.SatBreast.9.6.12
names(d)
fitted = d$fitted.values
length(fitted)
length(fitted)
length(sb)
plot(sb~fitted)
title(main = "Sat Breast: ORICOLL, AGECURR")


# SAT CROWN
e = glm.SatCrown.9.6.12
names(e)
fitted = e$fitted.values
length(fitted)
length(fitted)
length(sc)
plot(sc~fitted)
title(main = "Sat Crown: ORICOLL")


# SAT SCAPS
f = glm.SatCrown.9.6.12
names(f)
fitted = f$fitted.values
length(fitted)
length(ss)
length(fitted) = length(ss)
plot(ss~fitted)
title(main = "Sat Scaps: ORICOLL")


# BRIGHT BREAST
g = glm.BrightnessBreast.9.6.12
names(g)
fitted = g$fitted.values
length(fitted)
length(fitted)
length(bb)
plot(bb~fitted)
title(main = "Brightness Breast: ORICOLL, AGECOLL, AGECURR")


# BRIGHT CROWN
h = glm.BrightnessCrown.9.6.12
names(h)
fitted = h$fitted.values
length(fitted)
length(fitted)
length(bc)
plot(bc~fitted)
title(main = "Brightness Crown: ORICOLL, AGECOLL")


# BRIGHT SCAPS
i = glm.BrightnessCrown.9.6.12
names(i)
fitted = i$fitted.values
length(fitted)
length(fitted)
length(bs)
length(fitted) = length(ss)
plot(bs~fitted)
title(main = "Hue Breast: ORICOLL, AGECOLl")


