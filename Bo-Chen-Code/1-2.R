print("穨1-2,材1场だ")
a <-  48/50
b <-  24/25
c <-  13/20
d <-  59/68
e <-  89/72
f <-  21/20
g <- 125/56
h <-  52/56

cat('┬a￤:',a,"窾じ")
cat('┬b￤:',b,"窾じ")
cat('┬c￤:',c,"窾じ")
cat('┬d￤:',d,"窾じ")
cat('┬e￤:',e,"窾じ")
cat('┬f￤:',f,"窾じ")
cat('┬g￤:',g,"窾じ")
cat('┬h￤:',h,"窾じ")



print("穨1-2,材2场だ")
average <- (a+b+c+d+e+f+g+h)/8
sd <- (((a-average)^2 + (b-average)^2 + (c-average)^2 + (d-average)^2 + (e-average)^2 + (f-average)^2 + (g-average)^2 + (h-average)^2)/8)^0.5
cat("羆┬基–￤ キА",average,"窾じ")
cat("┬基–￤キА夹非畉",sd,"窾じ")

