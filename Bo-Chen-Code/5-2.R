install.packages("tidyverse")
install.packages("tidyr")
library(tidyverse)

fg <- as.integer(runif(50)*100) #取50筆1-100的隨機數字
fm <- as.integer(runif(50)*100)
df <- data.frame(fg,fm) #fg,fm加到dataframe
print(df)
df2 <- mutate(df,fa = fg+fm)#從df的裡拿出fg、fm相加且存放在fa,再將全部另存為df2(dataframe)
print(df2)

x <- mapply(function(fg, fa) fg/fa,df2$fg,df2$fa)#用mapply取出df2的fg、fa相除並將結果存於x
dfx <- data.frame(x)#把x存入名為dfx的dataframe
#str(dfx)
print(dfx)
