date1 = as.Date("2006-01-23")
date2 = as.Date("2017-03-25")

diff = as.integer(date2 - date1)
year = as.integer(diff / 365L)
day = as.integer(diff %% 365)

cat(year, "¦~",day, "¤Ñ")
