#install.packages("C50")
#install.packages("printr")
rm(list = ls())
library(C50)
library(printr)
iris_data <- iris
idx <- sample(1:nrow(iris),100)
iris_train <- iris_data[idx, ]
iris_test <- iris_data[-idx,]

C50_iris <- C5.0(Species ~ ., data = iris_train)
summary(C50_iris)
plot(C50_iris)
pred <- predict(C50_iris, iris_test)
table(pred, iris_test$Species)

pt_table <- table(pred, iris_test$Species)
accuracy <- sum(diag(pt_table))/sum(pt_table)*100
print(accuracy)
cat("Accuracy Rae : ",accuracy,"%")
