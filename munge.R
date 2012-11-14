load("~/Dropbox/Papers/CU1.1/CU11 R project/whole data/whole.cu1.2.0.Rdata")

# SOLVE HETEROSKEDASTICITY: EUROPE VS ME/AFRICA VS INDIA VS ASIA GROUPING
x = subset(x=whole,subset=whole$BREASTB > 0, select =  c(BREASTB,SCAPSB,BREASTS,ORICOLL,AGECOLL,AGECURR, COORDSX, COORDSY))
y = na.omit(x)
library(sp)
coordinates(y) <- c("COORDSX", "COORDSY") 
plot(y)
crs.geo <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84") # define projection
proj4string(y) <- crs.geo 
plot(y, pch=20, col="steelblue")
library(maptools)
data(wrld_simpl)
plot(wrld_simpl, add=T)

library(dismo)
mypolygon <- drawPoly()    # click on the map to draw a polygon and press ESC
proj4string(mypolygon) <- crs.geo
asia = as.data.frame(over(mypolygon, y, returnList =T))
levels(asia$ORICOLL) <- c(levels(asia$ORICOLL), c("asia",'india','meAfrica','arquata','orientalis'))
asia$ORICOLL[1:47]     <- 'asia'

mypolygon <- drawPoly()    # click on the map to draw a polygon and press ESC
proj4string(mypolygon) <- crs.geo
india = as.data.frame(over(mypolygon, y, returnList =T))
levels(india$ORICOLL) <- c(levels(india$ORICOLL), c("asia",'india','meAfrica','arquata','orientalis'))
india$ORICOLL[1:31]     <- 'india'

mypolygon <- drawPoly()    # click on the map to draw a polygon and press ESC
proj4string(mypolygon) <- crs.geo
meAfrica = as.data.frame(over(mypolygon, y, returnList =T))
levels(meAfrica$ORICOLL) <- c(levels(meAfrica$ORICOLL), c("asia",'india','meAfrica','arquata','orientalis'))
meAfrica$ORICOLL[1:25]     <- 'meAfrica'

mypolygon <- drawPoly()    # click on the map to draw a polygon and press ESC
proj4string(mypolygon) <- crs.geo
arquata = as.data.frame(over(mypolygon, y, returnList =T))
levels(arquata$ORICOLL) <- c(levels(arquata$ORICOLL), c("asia",'india','meAfrica','arquata','orientalis'))
arquata$ORICOLL[1:65]     <- 'arquata'

BREASTB4groups = rbind(arquata, india, asia, meAfrica)

