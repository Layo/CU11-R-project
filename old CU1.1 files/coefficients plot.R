library(arm)








# set the graphical parameters
par(
  xpd = TRUE,
  oma = c(5,2,3,10),  # Since it is a single plot, I set the outer margins to zero.
  mar = c(5,5,3,5),  # Inner margins are set through a little trial and error.
  mfrow=c(3,3)
  )











hb = glm.HueBreast.9.6.12

plot(NULL,                              # create empty plot
     xlim = c(-10, 10),                      # set xlim by guessing
     ylim = c(.2, length(var.names) + 0.2), # set ylim by the number of variables
     axes = F, xlab = NA, ylab = NA)       # turn off axes and labels

# add the data
coef(hb)[-1]                                                    # conveniently store the estimates (minus the constant)
sqrt(diag(vcov(hb)))[-1]   # conveniently store the std. errors (minus the constant)

points(1.028795,2.9, pch = 19, cex = .5)                               # add the points to the plot
lines(c(1.028795 + 1.96*0.1388, 1.028795- 1.96*0.1388), c(2.9,2.9))         # add the 95% confidence intervals
text(-13, 2.9, 'ORICOLL', xpd = T, cex = .8)                      # add the variable names
text(-13, 2.1, "AGECOLL", xpd = T, cex = .8)
text(-13, 1.3, "MTHCOLL", xpd = T, cex = .8)
text(-13, 0.5, "AGECURR", xpd = T, cex = .8)
points(12,2.9, pch =8, cex = .8)
points(13,2.9, pch =8, cex = .8)
points(14,2.9, pch =8, cex = .8)

# add axes and labels
axis(side = 1)                                                                                          # add bottom axis
lines(c(0,0), c(0,3.35), lty = 3, col = "grey")   # add verticle line
mtext(side = 1, "", line = 3)                                              # label bottom axis
mtext(side = 3, "Hue breast", line = 1, cex = .8)   # add title

box()        # add lines around the plot




sb = glm.SatBreast.9.6.12

plot(NULL,                              # create empty plot
     xlim = c(-10, 10),                      # set xlim by guessing
     ylim = c(.2, length(var.names) + 0.2), # set ylim by the number of variables
     axes = F, xlab = NA, ylab = NA)       # turn off axes and labels

# add the data
coef(sb)[-1]                                                    # conveniently store the estimates (minus the constant)
sqrt(diag(vcov(sb)))[-1]   # conveniently store the std. errors (minus the constant)

points(-4.20844030 ,2.9, pch = 19, cex = .5)                               # add the points to the plot
lines(c(-4.20844030  + 1.96*0.532408882, -4.20844030 - 1.96*0.532408882), c(2.9,2.9))         # add the 95% confidence intervals
points(2.99209137,0.5, pch = 19, cex = .5)                               # add the points to the plot
lines(c(2.99209137 + 1.96*-0.02259243, 2.99209137- 1.96*-0.02259243), c(0.5,0.5))         # add the 95% confidence intervals

text(-13, 2.9, 'ORICOLL', xpd = T, cex = .8)                      # add the variable names
text(-13, 2.1, "AGECOLL", xpd = T, cex = .8)
text(-13, 1.3, "MTHCOLL", xpd = T, cex = .8)
text(-13, 0.5, "AGECURR", xpd = T, cex = .8)
points(12,2.9, pch =8, cex = .8)
points(13,2.9, pch =8, cex = .8)
points(14,2.9, pch =8, cex = .8)
points(12,0.5, pch =8, cex = .8)



# add axes and labels
axis(side = 1)                                                                                          # add bottom axis
lines(c(0,0), c(0,3.35), lty = 3, col = "grey")   # add verticle line
mtext(side = 1, "", line = 3)                                              # label bottom axis
mtext(side = 3, "Saturation breast", line = 1, cex = .8)   # add title
box()        # add lines around the plot









bb = glm.BrightnessBreast.9.6.12

plot(NULL,                              # create empty plot
     xlim = c(-10, 10),                      # set xlim by guessing
     ylim = c(.2, length(var.names) + 0.2), # set ylim by the number of variables
     axes = F, xlab = NA, ylab = NA)       # turn off axes and labels

# add the data
coef(bb)[-1]                                                    # conveniently store the estimates (minus the constant)
sqrt(diag(vcov(bb)))[-1]   # conveniently store the std. errors (minus the constant)

points(8.58391673,2.9, pch = 19, cex = .5)                               # add the points to the plot
lines(c(8.58391673 + 1.96*0.71736145, 8.58391673- 1.96*0.71736145), c(2.9,2.9))         # add the 95% confidence intervals
points(2.99209137,2.1, pch = 19, cex = .5)                               # add the points to the plot
lines(c(2.99209137 + 1.96*0.84780653, 2.99209137- 1.96*0.84780653), c(2.1,2.1))         # add the 95% confidence intervals
points(0.03187228,0.5, pch = 19, cex = .5)                               # add the points to the plot
lines(c(0.03187228 + 1.96*0.01272447, 0.03187228- 1.96*0.01272447), c(0.5,0.5))         # add the 95% confidence intervals
text(-13, 2.9, 'ORICOLL', xpd = T, cex = .8)                      # add the variable names
text(-13, 2.1, "AGECOLL", xpd = T, cex = .8)
text(-13, 1.3, "MTHCOLL", xpd = T, cex = .8)
text(-13, 0.5, "AGECURR", xpd = T, cex = .8)
points(12,2.9, pch =8, cex = .8)
points(13,2.9, pch =8, cex = .8)
points(14,2.9, pch =8, cex = .8)
points(12,2.1, pch =8, cex = .8)
points(13,2.1, pch =8, cex = .8)
points(14,2.1, pch =8, cex = .8)
points(12,0.5, pch =8, cex = .8)


# add axes and labels
axis(side = 1)                                                                                          # add bottom axis
lines(c(0,0), c(0,3.35), lty = 3, col = "grey")   # add verticle line
mtext(side = 1, "", line = 3)                                              # label bottom axis
mtext(side = 3, "Brightness breast", line = 1, cex = .8)   # add title
box()        # add lines around the plot















hc = glm.HueCrown.9.6.12

plot(NULL,                              # create empty plot
     xlim = c(-10, 10),                      # set xlim by guessing
     ylim = c(.2, length(var.names) + 0.2), # set ylim by the number of variables
     axes = F, xlab = NA, ylab = NA)       # turn off axes and labels

# add the data
coef(hc)[-1]                                                    # conveniently store the estimates (minus the constant)
sqrt(diag(vcov(hc)))[-1]   # conveniently store the std. errors (minus the constant)

points(-0.3846477 ,2.9, pch = 19, cex = .5)                               # add the points to the plot
lines(c(-0.3846477  + 1.96*0.2166388, -0.3846477 - 1.96*0.2166388), c(2.9,2.9))         # add the 95% confidence intervals


text(-13, 2.9, 'ORICOLL', xpd = T, cex = .8)                      # add the variable names
text(-13, 2.1, "AGECOLL", xpd = T, cex = .8)
text(-13, 1.3, "MTHCOLL", xpd = T, cex = .8)
text(-13, 0.5, "AGECURR", xpd = T, cex = .8)

# add axes and labels
axis(side = 1)                                                                                          # add bottom axis
lines(c(0,0), c(0,3.35), lty = 3, col = "grey")   # add verticle line
mtext(side = 1, "", line = 3)                                              # label bottom axis
mtext(side = 3, "Hue crown", line = 1)   # add title
box()        # add lines around the plot



sc = glm.SatCrown.9.6.12

# create an empty plot for total customization
plot(NULL,                              # create empty plot
     xlim = c(-10, 10),                      # set xlim by guessing
     ylim = c(.2, length(var.names) + .2), # set ylim by the number of variables
     axes = F, xlab = NA, ylab = NA)       # turn off axes and labels

# add the data
coef(sc)[-1]                                                    # conveniently store the estimates (minus the constant)
sqrt(diag(vcov(sc)))[-1]                                         # conveniently store the std. errors (minus the constant)

points(0.3246355 ,2.9, pch = 19, cex = .5)                               # add the points to the plot
lines(c(0.3246355  + 1.96*0.5078532, 0.3246355 - 1.96*0.5078532), c(2.9,2.9))         # add the 95% confidence intervals


text(-13, 2.9, 'ORICOLL', xpd = T, cex = .8)                      # add the variable names
text(-13, 2.1, "AGECOLL", xpd = T, cex = .8)
text(-13, 1.3, "MTHCOLL", xpd = T, cex = .8)
text(-13, 0.5, "AGECURR", xpd = T, cex = .8)

# add axes and labels
axis(side = 1)                                                                                          # add bottom axis
lines(c(0,0), c(0,3.35), lty = 3, col = "grey")   # add verticle line
mtext(side = 1, "", line = 3)                                              # label bottom axis
mtext(side = 3, "Saturation crown", line = 1, cex = .8)   # add title
box()        # add lines around the plot





bc = glm.BrightnessCrown.9.6.12

plot(NULL,                              # create empty plot
     xlim = c(-10, 10),                      # set xlim by guessing
     ylim = c(.2, length(var.names) + 0.2), # set ylim by the number of variables
     axes = F, xlab = NA, ylab = NA)       # turn off axes and labels

# add the data
coef(bc)[-1]                                                    # conveniently store the estimates (minus the constant)
sqrt(diag(vcov(bc)))[-1]   # conveniently store the std. errors (minus the constant)

points(3.084494 ,2.9, pch = 19, cex = .5)                               # add the points to the plot
lines(c(3.084494  + 1.96*0.5869643, 3.084494 - 1.96*0.5869643), c(2.9,2.9))         # add the 95% confidence intervals
points(2.170210 ,2.1, pch = 19, cex = .5)                               # add the points to the plot
lines(c(2.170210  + 1.96*0.6706708, 2.170210 - 1.96*0.6706708), c(2.1,2.1))         # add the 95% confidence intervals

text(-13, 2.9, 'ORICOLL', xpd = T, cex = .8)                      # add the variable names
text(-13, 2.1, "AGECOLL", xpd = T, cex = .8)
text(-13, 1.3, "MTHCOLL", xpd = T, cex = .8)
text(-13, 0.5, "AGECURR", xpd = T, cex = .8)
points(12,2.9, pch =8, cex = .8)
points(13,2.9, pch =8, cex = .8)
points(14,2.9, pch =8, cex = .8)
points(12,2.1, pch =8, cex = .8)
points(13,2.1, pch =8, cex = .8)


# add axes and labels
axis(side = 1)                                                                                          # add bottom axis
lines(c(0,0), c(0,3.35), lty = 3, col = "grey")   # add verticle line
mtext(side = 1, "", line = 3)                                              # label bottom axis
mtext(side = 3, "Brightness crown", line = 1, cex = .8)   # add title
box()        # add lines around the plot













































hs = glm.HueScaps.9.6.12

# create an empty plot for total customization
plot(NULL,                              # create empty plot
     xlim = c(-10, 10),                      # set xlim by guessing
     ylim = c(.2, length(var.names) + .2), # set ylim by the number of variables
     axes = F, xlab = NA, ylab = NA)       # turn off axes and labels

# add the data
coef(hs)[-1]                                                    # conveniently store the estimates (minus the constant)
sqrt(diag(vcov(hs)))[-1]                                         # conveniently store the std. errors (minus the constant)

points(-1.52805525  ,2.9, pch = 19, cex = .5)                               # add the points to the plot
lines(c(-1.52805525   + 1.96*0.3379198, -1.52805525  - 1.96*0.3379198), c(2.9,2.9))         # add the 95% confidence intervals
points(-1.93829   ,1.3, pch = 19, cex = .5)                               # add the points to the plot
lines(c(-1.93829    + 1.96*0.92163, -1.93829  - 1.96*0.92163), c(1.3,1.3))         # add the 95% confidence intervals

text(-13, 2.9, 'ORICOLL', xpd = T, cex = .8)                      # add the variable names
text(-13, 2.1, "AGECOLL", xpd = T, cex = .8)
text(-13, 1.3, "MTHCOLL", xpd = T, cex = .8)
text(-13, 0.5, "AGECURR", xpd = T, cex = .8)
points(12,2.9, pch =8, cex = .8)
points(13,2.9, pch =8, cex = .8)
points(14,2.9, pch =8, cex = .8)
points(12,1.3, pch =8, cex = .8)


# add axes and labels
axis(side = 1)                                                                                          # add bottom axis
lines(c(0,0), c(0,3.35), lty = 3, col = "grey")   # add verticle line
mtext(side = 1, "", line = 3)                                              # label bottom axis
mtext(side = 3, "Hue scapulars", line = 1, cex = .8)   # add title
box()        # add lines around the plot









ss = glm.SatScaps.9.6.12

# create an empty plot for total customization
plot(NULL,                              # create empty plot
     xlim = c(-10, 10),                      # set xlim by guessing
     ylim = c(.4, length(var.names) + .2), # set ylim by the number of variables
     axes = F, xlab = NA, ylab = NA)       # turn off axes and labels

# add the data
coef(ss)[-1]                                                    # conveniently store the estimates (minus the constant)
sqrt(diag(vcov(ss)))[-1]                                         # conveniently store the std. errors (minus the constant)

points(0.7215448  ,2.9, pch = 19, cex = .5)                               # add the points to the plot
lines(c(0.7215448   + 1.96*0.347852, 0.7215448  - 1.96*0.347852), c(2.9,2.9))         # add the 95% confidence intervals

text(-13, 2.9, 'ORICOLL', xpd = T, cex = .8)                      # add the variable names
text(-13, 2.1, "AGECOLL", xpd = T, cex = .8)
text(-13, 1.3, "MTHCOLL", xpd = T, cex = .8)
text(-13, 0.5, "AGECURR", xpd = T, cex = .8)
points(12,2.9, pch =8, cex = .8)


# add axes and labels
axis(side = 1)                                                                                          # add bottom axis
lines(c(0,0), c(0,3.35), lty = 3, col = "grey")   # add verticle line
mtext(side = 1, "", line = 3)                                              # label bottom axis
mtext(side = 3, "Saturation scapulars", line = 1, cex = .8)   # add title
box()        # add lines around the plot




bs = glm.BrightnessScaps.9.6.12

# create an empty plot for total customization
plot(NULL,                              # create empty plot
     xlim = c(-10, 10),                      # set xlim by guessing
     ylim = c(.4, length(var.names) + .2), # set ylim by the number of variables
     axes = F, xlab = NA, ylab = NA)       # turn off axes and labels

# add the data
coef(bs)[-1]                                                    # conveniently store the estimates (minus the constant)
sqrt(diag(vcov(bs)))[-1]                                         # conveniently store the std. errors (minus the constant)

points(2.601713  ,2.9, pch = 19, cex = .5)                               # add the points to the plot
lines(c(2.601713   + 1.96*0.3474803, 2.601713  - 1.96*0.3474803), c(2.9,2.9))         # add the 95% confidence intervals
points(1.476284  ,2.1, pch = 19, cex = .5)                               # add the points to the plot
lines(c(1.476284   + 1.96*0.3958037, 1.476284  - 1.96*0.3958037), c(2.1,2.1))

text(-13, 2.9, 'ORICOLL', xpd = T, cex = .8)                      # add the variable names
text(-13, 2.1, "AGECOLL", xpd = T, cex = .8)
text(-13, 1.3, "MTHCOLL", xpd = T, cex = .8)
text(-13, 0.5, "AGECURR", xpd = T, cex = .8)
points(12,2.9, pch =8, cex = .8)
points(13,2.9, pch =8, cex = .8)
points(14,2.9, pch =8, cex = .8)
points(12,2.1, pch =8, cex = .8)
points(13,2.1, pch =8, cex = .8)
points(14,2.1, pch =8, cex = .8)

# add axes and labels
axis(side = 1)                                                                                          # add bottom axis
lines(c(0,0), c(0,3.35), lty = 3, col = "grey")   # add verticle line
mtext(side = 1, "", line = 3)                                              # label bottom axis
mtext(side = 3, "Brightness scapulars", line = 1, cex = .8)   # add title
box()        # add lines around the plot
