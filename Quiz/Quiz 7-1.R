#install.packages("missForest")
#install.packages("DMwR")
#install.packages("lattice")
#install.packages("MASS")
#install.packages("nnet")
#install.packages("mice")
rm(list=ls())
library(missForest)
library(DMwR)
library(lattice)
library(MASS)
library(nnet)
library(mice)

# View(iris)

#15% miss data   7-1(1)
miss_iris <- prodNA(iris, noNA = 0.15 )
View(miss_iris)
# lose <- md.pattern(avg_miss)
# print(lose)

#使用平均數填值  7-1(2)
avg_miss <- miss_iris
SL_mean <- mean(avg_miss[,1],na.rm = T)
avg_miss[is.na(avg_miss[,1]), 1] <- SL_mean
SW_mean <- mean(avg_miss[,2],na.rm = T)
avg_miss[is.na(avg_miss[,2]), 2] <- SW_mean
PL_mean <- mean(avg_miss[,3],na.rm = T)
avg_miss[is.na(avg_miss[,3]), 3] <- PL_mean
PW_mean <- mean(avg_miss[,4],na.rm = T)
avg_miss[is.na(avg_miss[,4]), 4] <- PW_mean

View(avg_miss)

# 使用knn預測填補 7-1(3)
knn_miss <- knnImputation(avg_miss)

View(knn_miss)
