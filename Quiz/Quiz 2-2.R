player = c("Stephen Curry", "Klay Thompson")
pts = c(30.1, 22.1)
t3p = c(402L, 276)
tp = c(0.454, 0.425)
season = c("2015-2016", "2015-2016")
collec = data.frame(player, pts, t3p, tp, season)

filter = collec$season == "2015-2016"
collec = collec[filter,]
collec$season = NULL

player = c("avg")
pts = c(mean(collec$pts))
t3p = c(mean(collec$t3p))
tp = c(mean(collec$tp))
new_row = data.frame(player, pts, t3p, tp)

collec = rbind.data.frame(collec, new_row)

View(collec)
