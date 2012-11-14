# deviance based r-squared value (R2D) = 
# deviance of the model being tested (DMT)
# minus deviance of a general model containing all the main and first order interaction terms in the model set (DMG)
# divided by deviance of the null (intercept only) model (DMN)

# HUE BREAST
dmt.glm.hueBreast = glm(breasthue~race, data = whole.hueBreast)
dmt.hueBreast = dmt.glm.hueBreast$deviance

dmg.glm.hueBreast = glm(breasthue~race+age+month+time, data = whole.hueBreast)
dmg.hueBreast = dmg.glm.hueBreast$deviance

dmn.glm.hueBreast = glm(breasthue~1, data = whole.hueBreast)
dmn.hueBreast = dmn.glm.hueBreast$deviance

anodev.hueBreast = (dmt.hueBreast-dmg.hueBreast)/(dmn.hueBreast-dmg.hueBreast)

# HUE CROWN
dmt.glm.hueCrown = glm(crownhue~race, data = whole.hueCrown)
dmt.hueCrown = dmt.glm.hueCrown$deviance

dmg.glm.hueCrown = glm(crownhue~race+age+month+time, data = whole.hueCrown)
dmg.hueCrown = dmg.glm.hueCrown$deviance

dmn.glm.hueCrown = glm(crownhue~1, data = whole.hueCrown)
dmn.hueCrown = dmn.glm.hueCrown$deviance

anodev.hueCrown = (dmt.hueCrown-dmg.hueCrown)/(dmn.hueCrown-dmg.hueCrown)

# HUE SCAPULARS
dmt.glm.hueScaps = glm(scapshue~race, data = whole.hueScaps)
dmt.hueScaps = dmt.glm.hueScaps$deviance

dmg.glm.hueScaps = glm(scapshue~race+age+month+time, data = whole.hueScaps)
dmg.hueScaps = dmg.glm.hueScaps$deviance

dmn.glm.hueScaps = glm(scapshue~1, data = whole.hueScaps)
dmn.hueScaps = dmn.glm.hueScaps$deviance

anodev.hueScaps = (dmt.hueScaps-dmg.hueScaps)/(dmn.hueScaps-dmg.hueScaps)

# SATURATION BREAST
dmt.glm.satBreast = glm(breastsat~race, data = whole.satBreast)
dmt.satBreast = dmt.glm.satBreast$deviance

dmg.glm.satBreast = glm(breastsat~race+age+month+time, data = whole.satBreast)
dmg.satBreast = dmg.glm.satBreast$deviance

dmn.glm.satBreast = glm(breastsat~1, data = whole.satBreast)
dmn.satBreast = dmn.glm.satBreast$deviance

anodev.satBreast = (dmt.satBreast-dmg.satBreast)/(dmn.satBreast-dmg.satBreast)

# SATURATION CROWN
dmt.glm.satCrown = glm(crownsat~race, data = whole.satCrown)
dmt.satCrown = dmt.glm.satCrown$deviance

dmg.glm.satCrown = glm(crownsat~race+age+month+time, data = whole.satCrown)
dmg.satCrown = dmg.glm.satCrown$deviance

dmn.glm.satCrown = glm(crownsat~1, data = whole.satCrown)
dmn.satCrown = dmn.glm.satCrown$deviance

anodev.satCrown = (dmt.satCrown-dmg.satCrown)/(dmn.satCrown-dmg.satCrown)

# SATURATION SCAPULARS
dmt.glm.satScaps = glm(scapssat~race, data = whole.satScaps)
dmt.satScaps = dmt.glm.satScaps$deviance

dmg.glm.satScaps = glm(scapssat~race+age+month+time, data = whole.satScaps)
dmg.satScaps = dmg.glm.satScaps$deviance

dmn.glm.satScaps = glm(scapssat~1, data = whole.satScaps)
dmn.satScaps = dmn.glm.satScaps$deviance

anodev.satScaps = (dmt.satScaps-dmg.satScaps)/(dmn.satScaps-dmg.satScaps)

# BRIGHTNESS BREAST
dmt.glm.brightBreast = glm(B.mean~Race, data = whole.brightBreast)
dmt.brightBreast = dmt.glm.brightBreast$deviance

dmg.glm.brightBreast = glm(B.mean~Race+Age+Month+Year, data = whole.brightBreast)
dmg.brightBreast = dmg.glm.brightBreast$deviance

dmn.glm.brightBreast = glm(B.mean~1, data = whole.brightBreast)
dmn.brightBreast = dmn.glm.brightBreast$deviance

anodev.brightBreast = (dmt.brightBreast-dmg.brightBreast)/(dmn.brightBreast-dmg.brightBreast)

# BRIGHTNESS CROWN
dmt.glm.brightCrown = glm(crownbright~race, data = whole.brightCrown)
dmt.brightCrown = dmt.glm.brightCrown$deviance

dmg.glm.brightCrown = glm(crownbright~race+age+month+time, data = whole.brightCrown)
dmg.brightCrown = dmg.glm.brightCrown$deviance

dmn.glm.brightCrown = glm(crownbright~1, data = whole.brightCrown)
dmn.brightCrown = dmn.glm.brightCrown$deviance

anodev.brightCrown = (dmt.brightCrown-dmg.brightCrown)/(dmn.brightCrown-dmg.brightCrown)

# BRIGHTNESS SCAPULARS
dmt.glm.brightScaps = glm(scapsbright~race, data = whole.brightScaps)
dmt.brightScaps = dmt.glm.brightScaps$deviance

dmg.glm.brightScaps = glm(scapsbright~race+age+month+time, data = whole.brightScaps)
dmg.brightScaps = dmg.glm.brightScaps$deviance

dmn.glm.brightScaps = glm(scapsbright~1, data = whole.brightScaps)
dmn.brightScaps = dmn.glm.brightScaps$deviance

anodev.brightScaps = (dmt.brightScaps-dmg.brightScaps)/(dmn.brightScaps-dmg.brightScaps)

