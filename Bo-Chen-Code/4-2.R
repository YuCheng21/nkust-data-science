library(gapminder)
library(ggplot2)
dt <- gapminder
#用$濾出dt中的continent
getcont <- dt$continent
#依照continent分別給予顏色
ggplot(dt,aes(x=lifeExp, y=gdpPercap, color=getcont)) + 
geom_point()

