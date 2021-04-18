# install.packages("ggplot2")

library(ggplot2)
library(gapminder)

dt = gapminder
continent = gapminder$continent
ggplot(dt, aes(x=lifeExp, y=gdpPercap, color=continent)) + geom_point()

