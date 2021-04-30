rm(list=ls())
Columnl <- c(44,27,30,38,35)
NormC1 <- c()
sum <- 0
#套公式
for(i in Columnl){
  sum <- sum+i
}
for(i in 1:5){
  NormC1[i] <- Columnl[i]/sum
}
#輸出結果
data <- data.frame(Columnl,NormC1)
