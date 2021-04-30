rm(list = ls())
library(ggplot2)
iris_data <- iris
iris_data <- iris_data[-5]

km <- kmeans(iris_data, 3, iter.max = 100)
print(km)
str(km)

pt_table <- table(iris$Species,km$cluster)
print(pt_table)

plot(iris$Sepal.Width,iris$Sepal.Length,col=km$cluster)


km$centers
centers=km$centers[km$cluster,]
distances=sqrt(rowSums((iris-centers)^2))
outliers=order(distances,decreasing=T)[1:5]
plot(iris[c("Sepal.Width","Sepal.Length")], col=km.$cluster)
points(km$centers[,c("Sepal.Width","Sepal.Length")], col=1:3, pch=7, cex=2)

#points(iris[outliers,c("Sepal.Width","Sepal.Length")], col=4, pch='+', cex=2)


#參考資料http://www.cc.ntu.edu.tw/chinese/epaper/0037/20160620_3708.html

