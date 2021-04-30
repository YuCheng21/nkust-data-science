#install.packages("RWeka")
#install.packages("partykit")
rm(list = ls())
library(RWeka)
library(partykit)
iris_data <- iris
idx <- sample(1:nrow(iris),100)
iris_train <- iris_data[idx, ]
iris_test <- iris_data[-idx,]

C45_iris <- J48(Species ~ ., data = iris_train, control = Weka_control(M=3))
summary(C45_iris)
plot(C45_iris)
pred <- predict(C45_iris, iris_test)
table(pred, iris_test$Species)

pt_table <- table(pred, iris_test$Species)
accuracy <- sum(diag(pt_table))/sum(pt_table)*100
cat("Accuracy Rae : ",accuracy,"%")
