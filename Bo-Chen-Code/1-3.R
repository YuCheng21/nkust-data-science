  Kobe <- as.Date("2006-01-23")
Booker <- as.Date("2017-03-25")
iKobe <- as.integer(Kobe)
iBooker <-as.integer(Booker)
ALL <- iBooker-iKobe
Y <- as.integer(ALL/365)
D <- ALL%%365
cat(Y,"¦~",D,"¤Ñ")

