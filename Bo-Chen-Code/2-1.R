rm(list=ls())

icy <- matrix(1:9, nrow=3)
print(icy)

get <- icy%%2 == 0
print(get)

new_icy <- icy[get]
print(new_icy)