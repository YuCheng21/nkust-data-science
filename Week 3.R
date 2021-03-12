GSW = c("AAA", "BBB", "CCC", "DDD")
print(GSW)
print(GSW[1])

GSW = GSW[c(-2, -5)]
print(GSW)

GSW = c("AAA", 30, "BBB", 50)
print(GSW)
print(class(GSW))

SC = GSW == "AAA"
print(SC)
print(GSW[SC])

splash = GSW == "AAA" | GSW == "BBB"
print(GSW[splash])

a = rep(7, times = 11)
print(a)

b = rep("AAA", times = 50)
print(b)

a = seq(from=3, to=76, by=5)
print(a)

b = seq(from=1, to=100, by=3)
print(b)

c = 1:30
print(c)

assign("sc", c(1, 2, 3, 4, 5.5))
print(sc)

player = c("AAA", "BBB", "CCC", "DDD", "EEE")
rank = factor(player, ordered=TRUE, 
              levels=c("BBB", "CCC", "EEE", "AAA", "DDD"))
print(rank)

rank2 = factor(player, ordered=TRUE)
print(rank2)

# ------------- matrix--------------

marion = matrix(1:9, nrow=3)
print(marion)

a = marion[1, 3]
print(a)

b = marion[2,]
print(b)

c = marion[,3]
print(c)

get = marion>2&marion<8
print(get)
new_marion = marion[get]
print(new_marion)

marion = matrix(c(1,2,3,4L,5L,TRUE), nrow=2)
print(marion)
print(class(marion[,3]))

marion2 = matrix(c(1L, 2L, 3L, 4L, 5L, TRUE), nrow=2)
print(marion2)
print(class(marion2[,3]))

marion = matrix(1:9, nrow=3, byrow=TRUE)
print(marion)

a = matrix(1:9, nrow=3, byrow = TRUE)
b = matrix(9:1, nrow=3, byrow = TRUE)
c = a%*%b
print(a)
print(b)
print(c)

rownames(c) = c("A", "B", "C")
colnames(c) = c("a", "b", "c")
print(c)

# -------data.frame---------

player = c("AAAA", "BBBB")
pts = c(30, 20)
t3p = c(402L, 276)
tp = c(0.454, 0.425)
season = c("2015-2016", "2015-2016")

collec = data.frame(player, pts, t3p, tp, season)
View(collec)

name = collec[,1]
print(name)
print(class(name))

# 和投影片相反
collec = data.frame(player, pts, t3p, tp, season, stringsAsFactors = TRUE)
name = collec[,1]
print(name)
print(class(name))

# get data
collec = data.frame(player, pts, t3p, tp, season)
name = collec[,1]
name1 = collec$player
name2 = collec[, "t3p"]
print(name1)
print(name2)

# names
print(names(collec))

# filter
filter = collec$t3p >= 400
print(filter)
print(collec)
a = collec[filter,]
print(a)
print(a$player)

# str()
str(collec)

# edit()
collec = edit(collec)
