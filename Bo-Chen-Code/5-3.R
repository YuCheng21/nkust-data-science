library(tidyverse)
A <- c("???", "???", "???", "???") 
B <- c(as.integer(1:10),"J","Q","K")
x <- c()    #用來存放52張牌的向量
l=1

for(i in A) #用雙for迴圈寫入資料至x
{
  for(j in B)
  {
    x[l]<- sprintf("%s%s",i,j)
    l=l+1
  }
}

gen_card <- function(n) #隨機從x抽n張牌的function
{
  return(sample(x,n))
}

n <- round(runif(1)*52)#隨機決定n的大小
print(n)

b <- gen_card(n) #使用gen_card()抽牌
print(b)