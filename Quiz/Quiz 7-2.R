rm(list=ls())
Column1 <- c(44,27,30,38,35)
NormC1 <- c()
sum <- 0
#套公式
for(i in Column1){
  sum <- sum+i
}
for(i in 1:5){
  NormC1[i] <- Column1[i]/sum
}
#輸出結果
data <- data.frame(Column1,NormC1)
View(data)
