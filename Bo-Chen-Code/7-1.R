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

#15% miss data   7-1(1)

iris_data <- prodNA(iris, noNA = 0.15 )
head(iris_data)
#lose <- md.pattern(iris_data)
#print(lose)

#使用平均數填值  7-1(2)
SL_mean <- mean(iris_data[,1],na.rm = T)
iris_data[is.na(iris_data[,1]), 1] <- SL_mean
SW_mean <- mean(iris_data[,2],na.rm = T)
iris_data[is.na(iris_data[,2]), 2] <- SW_mean
PL_mean <- mean(iris_data[,3],na.rm = T)
iris_data[is.na(iris_data[,3]), 3] <- PL_mean
PW_mean <- mean(iris_data[,4],na.rm = T)
iris_data[is.na(iris_data[,4]), 4] <- PW_mean

View(iris_data)



# 使用knn預測填補 7-1(3)
knnData <- knnImputation(iris_data)
View(knnData)
