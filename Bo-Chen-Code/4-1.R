# 安裝 gapminder 套件 ---------
install.packages("gapminder")
# 載入 gapminder 套件 ---------
library(gapminder)

dt <- gapminder
#用$濾出dt中的continent
getcont <- dt$continent
#print(getcont)
#用table統計
barplot(table(getcont))
