#install.packages("arulesViz")
rm(list=ls())
library(arules)
library(arulesViz)
data("AdultUCI")
A_data <- AdultUCI
head(A_data)
A_data$`education-num` <- NULL #刪除無用的資料
A_data$fnlwgt <- NULL          #刪除無用的資料
A_data$`capital-gain` <- NULL  #刪除無用的資料
A_data$`capital-loss` <- NULL  #刪除無用的資料
A_data$`hours-per-week` <- NULL#刪除無用的資料
A_data$age <- cut(A_data$age,breaks = c(0,49,Inf),
                  labels = c("middle","senior"))
#View(A_data)

ars <- apriori(A_data, parameter =list(supp=0.8,conf=0.5)) 


inspect(ars)