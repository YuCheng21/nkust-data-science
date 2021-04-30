rm(list=ls())

Player <- c("Stephen Curry", "Klay Thompson" )
pts    <- c(30.1, 22.1)
T3p    <- c(402L, 276)
Tp     <- c(0.454, 0.425)
Season <- c("2015-2016", "2015-2016")


A_pts = (pts[1]+ pts[2])/2
A_T3p = (T3p[1]+ T3p[2])/2
A_Tp  = ( Tp[1]+  Tp[2])/2

Player <- c(Player,"¥­§¡")
pts    <- c(pts, A_pts)
T3p    <- c(T3p, A_T3p)
Tp     <- c(Tp, A_Tp)

collec <- data.frame(Player,pts,T3p,Tp,
                     stringsAsFactors = FALSE)

Player <- c(Player,A_pts)
View(collec)
