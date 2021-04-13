# install.packages("gapminder")

library(gapminder)
dt = gapminder
barplot(table(dt$continent))
