# Hue Breast: 55,11,150
formula(hueBreast)
cooks.hueBreast = glm(breasthue~race, family = gaussian, data = cooksRemoved.hueBreast)

# Hue Crown: 8,39,91
formula(hueCrown)
cooks.hueCrown = glm(crownhue~race, family = gaussian, data = cooksRemoved.hueCrown)

# Hue Scapulars: 10, 48, 5
formula(hueScaps)
cooks.hueScaps = glm(scapshue~race+month, family = gaussian, data = cooksRemoved.hueScaps)


# Sat Breast: 158, 165, 182
formula(satBreast)
cooks.satBreast = glm(breastsat~race+time, family = gaussian, data = cooksRemoved.satBreast)


# Sat Crown: 15, 129, 139
formula(satCrown)
cooks.satCrown = glm(crownsat~race, family = gaussian, data = cooksRemoved.satCrown)

# Sat Scapulars: 1, 115, 192
formula(satScaps)
cooks.satScaps = glm(scapssat~race, family = gaussian, data = cooksRemoved.satScaps)

# Brightness Breast: 86, 111, 134
formula(brightBreast)
cooks.brightBreast = glm(B.mean~Race+Age+Year, family = gaussian, data = cooksRemoved.brightBreast)

# Brightness Crown: 4, 61, 133
formula(brightCrown)
cooks.brightCrown = glm(crownbright~race+age, family = gaussian, data = cooksRemoved.brightCrown)

# Brightness Scapulars: 78, 111, 130
formula(brightScaps)
cooks.brightScaps = glm(scapsbright~race+age, family = gaussian, data = cooksRemoved.brightScaps)


# COMPARISON OF ANODEV ORIGINAL WITH ANODEV COOKS DISTANCES REMOVED
anodev.original = c(anodev.hueBreast,anodev.hueCrown,anodev.hueScaps,anodev.satBreast,anodev.satCrown,anodev.satScaps,anodev.brightBreast,anodev.brightCrown,anodev.brightScaps)
anodev.original = as.table(anodev.original)
anodev.cooksremoved = 


