# ==============================================================================
# Read data
taiwan = read.csv("./Final-Project/dataset/taiwan.csv")
taiwan[,'年'] = sapply(taiwan[,'年'],as.character)
taiwan[,'月'] = sapply(taiwan[,'月'],as.character)

# ==============================================================================
# One-Hot-Encoding
library(caret)
dmy <- dummyVars(" ~ .", data = taiwan)
taiwan <- data.frame(predict(dmy, newdata = taiwan))

# ==============================================================================
# Label Grouping
taiwan[,'降雨量'] = round(taiwan[,'降雨量']/100)*100

# ==============================================================================
# Train_Test_Split - Taipei
taipei = taiwan[which(taiwan$城市台北市==1),]
taipei_train = taipei[which(taipei$年2019!=1),]
taipei_test = taipei[which(taipei$年2019==1),]

taichung = taiwan[which(taiwan$城市台中市==1),]
taichung_train = taichung[which(taichung$年2019!=1),]
taichung_test = taichung[which(taichung$年2019==1),]

kaohsiung = taiwan[which(taiwan$城市高雄市==1),]
kaohsiung_train = kaohsiung[which(kaohsiung$年2019!=1),]
kaohsiung_test = kaohsiung[which(kaohsiung$年2019==1),]

# ==============================================================================
# Function - Normalization
nor_item = c('平均溫度','最高溫度','最低溫度','降雨日數','最大10分鐘風風速',
      '最大10分鐘風風向.度.','最大瞬間風風速', '最大瞬間風風向.度.',
      '平均相對濕度','最小相對濕度','平均測站氣壓','總日照時數')

## -----------------------------------------------------------------------------
# # Custom
# maxmin <- function(x) {(x - min(x))/(max(x)-min(x))}
# 
# taipei_train[,names(taipei_train) == nor_item] = apply(
#   taipei_train[,names(taipei_train) == nor_item],2,maxmin)
# 
# taipei_test[,names(taipei_test) == nor_item] = apply(
#   taipei_test[,names(taipei_test) == nor_item],2,maxmin)

## -----------------------------------------------------------------------------
# # Exist
# taipei_train[,names(taipei_train) == nor_item] = scale(
#   taipei_train[,names(taipei_train) == nor_item]
# )
# 
# taipei_test[,names(taipei_test) == nor_item] = scale(
#   taipei_test[,names(taipei_test) == nor_item]
# )

# ==============================================================================
# 
taipei_test_D = taipei_test[,c(names(taipei_test) != '降雨量')]
taipei_test_L = taipei_test[,c(names(taipei_test) == '降雨量')]

taichung_test_D = taichung_test[,c(names(taichung_test) != '降雨量')]
taichung_test_L = taichung_test[,c(names(taichung_test) == '降雨量')]

kaohsiung_test_D = kaohsiung_test[,c(names(kaohsiung_test) != '降雨量')]
kaohsiung_test_L = kaohsiung_test[,c(names(kaohsiung_test) == '降雨量')]

# ==============================================================================
# Fit Data
# install.packages('e1071')
library('e1071')

taipei_svm = svm(taipei_train$降雨量~., data=taipei_train, 
              type='eps-regression', kernel='linear')

taipei_pred = predict(taipei_svm, newdata = taipei_test_D)

taichung_svm = svm(taichung_train$降雨量~., data=taichung_train, 
                 type='eps-regression', kernel='linear')

taichung_pred = predict(taichung_svm, newdata = taichung_test_D)

kaohsiung_svm = svm(kaohsiung_train$降雨量~., data=kaohsiung_train, 
                 type='eps-regression', kernel='linear')

kaohsiung_pred = predict(kaohsiung_svm, newdata = kaohsiung_test_D)

# ==============================================================================
# Plot Chart
library(ggplot2)
windowsFonts("jf open 粉圓 1.1" = windowsFont("jf open 粉圓 1.1"))

year = seq(1,12)

taipei_plot = data.frame(taipei_test_L, taipei_pred, year)
ggplot() + 
  geom_line(data=taipei_plot,aes(x=year,y=taipei_test_L,colour="測試"),size=2)+
  geom_point(data=taipei_plot,aes(x=year,y=taipei_test_L,colour="測試"),size=4)+
  geom_line(data=taipei_plot,aes(x=year,y=taipei_pred,colour="預測"),size=2)+
  geom_point(data=taipei_plot,aes(x=year,y=taipei_pred,colour="預測"),size=4)+
  scale_x_continuous(name='月份',breaks=seq(1,12))+
  scale_y_continuous(name='降雨量(mm)',breaks=seq(0,900,100))+
  scale_colour_manual("類別",values=c("測試"="darkgreen","預測"="dodgerblue"))+
  theme(text=element_text(size=15, family="jf open 粉圓 1.1"))+
  ggtitle('台北市 - 2019 年每月降雨量')

taichung_plot = data.frame(taichung_test_L, taichung_pred, year)
ggplot() + 
  geom_line(data=taichung_plot,aes(x=year,y=taichung_test_L,colour="測試"),size=2)+
  geom_point(data=taichung_plot,aes(x=year,y=taichung_test_L,colour="測試"),size=4)+
  geom_line(data=taichung_plot,aes(x=year,y=taichung_pred,colour="預測"),size=2)+
  geom_point(data=taichung_plot,aes(x=year,y=taichung_pred,colour="預測"),size=4)+
  scale_x_continuous(name='月份',breaks=seq(1,12))+
  scale_y_continuous(name='降雨量(mm)',breaks=seq(0,900,100))+
  scale_colour_manual("類別",values=c("測試"="darkgreen","預測"="dodgerblue"))+
  theme(text=element_text(size=15, family="jf open 粉圓 1.1"))+
  ggtitle('台中市 - 2019 年每月降雨量')

kaohsiung_plot = data.frame(kaohsiung_test_L, kaohsiung_pred, year)
ggplot() + 
  geom_line(data=kaohsiung_plot,aes(x=year,y=kaohsiung_test_L,colour="測試"),size=2)+
  geom_point(data=kaohsiung_plot,aes(x=year,y=kaohsiung_test_L,colour="測試"),size=4)+
  geom_line(data=kaohsiung_plot,aes(x=year,y=kaohsiung_pred,colour="預測"),size=2)+
  geom_point(data=kaohsiung_plot,aes(x=year,y=kaohsiung_pred,colour="預測"),size=4)+
  scale_x_continuous(name='月份',breaks=seq(1,12))+
  scale_y_continuous(name='降雨量(mm)',breaks=seq(0,900,100))+
  scale_colour_manual("類別",values=c("測試"="darkgreen","預測"="dodgerblue"))+
  theme(text=element_text(size=15, family="jf open 粉圓 1.1"))+
  ggtitle('高雄市 - 2019 年每月降雨量')

# ==============================================================================
