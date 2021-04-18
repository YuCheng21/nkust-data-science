setwd("D:/Programs/R/Projects/nkust-data-science/Mid-Project/summary")
getwd()
nc <- c()
num <- 1:20
#a <- c() 
#myfiles <- list.files(pattern = "*.txt")#讀取資料夾內檔案名稱



#去除標點符號的函式,並去除NA值和計算字數
np_gsub <- function(np,i){
  for (p in 1:nc[i]) {
    np[1,p] <- gsub("[[:punct:]]", "",np[1,p])#去除標點符號
    
    np[is.na(np)]<-""   #處理NA值
    
  }
  assign(paste0("count_word",as.character(i)),(as.data.frame(table(unlist(np, use.names = FALSE)), stringsAsFactors = FALSE)), envir = .GlobalEnv)
  return(np)
}

#計算TF的函式
tf_fun <- function(count_word,np) { 
  tf_A <- c()
  for(i in 1:nrow(count_word)){
    tf_A[i] <- as.integer(count_word[i,2])/ ncol(np)
  }
  return(tf_A)
}

#計算IDF的函式
idf_fun <- function(count_word){
  
  idf <- 0
  
  for(i in 1:nrow(count_word)){
    idf[i] <- 0
    #print(count_word1[i+1,1])
    if(count_word[i,1] %in% count_word1[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word2[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word3[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word4[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word5[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word6[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word7[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word8[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word9[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word10[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word11[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word12[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word13[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word14[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word15[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word16[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word17[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word18[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word19[,1]){
      idf[i] <- idf[i] + 1
    }
    if(count_word[i,1] %in% count_word20[,1]){
      idf[i] <- idf[i] + 1
    }
    
    idf[i] <- log((20 / (idf[i])), base = 10)
    
  }
  return(idf)
}

#計算TF-IDF的函式
tf_idf_fun <- function(tf,idf,count_word){
  tf_idf <- c()
  for(i in 1:nrow(count_word)){
    tf_idf[i]<- 0
    tf_idf[i] <- idf[i]*tf[i]
  }
  
  return(tf_idf)
}
#印出各篇前10重要的
view_top10 <- function(count_word, tf, idf, tf_idf){
  tf_idf_sol <- data.frame(count_word, tf, idf, tf_idf)  
  tf_idf_pop <- tf_idf_sol[order(tf_idf_sol$tf_idf, decreasing = TRUE),]
  tf_idf_top10 <- tf_idf_pop[1:10, ]
  return(tf_idf_top10)
}


#以下為主程式---------------------------------------


#讀取資料依序填入np_1,np_2....np_20，並去除標點符號
for (i in num) {
  file <- paste0(as.character(i),".txt")
  nc[i] <- ncol(read.csv(file, header = FALSE, stringsAsFactors = FALSE, sep = " ", fileEncoding ="UTF-8"))
  A <- read.csv(file, header = FALSE, stringsAsFactors = FALSE, sep = " ", fileEncoding ="UTF-8")
  assign(paste0("np_",as.character(i)),np_gsub(A,i))#
}


tf_1 <- tf_fun(count_word1,np_1)
tf_2 <- tf_fun(count_word2,np_2)
tf_3 <- tf_fun(count_word3,np_3)
tf_4 <- tf_fun(count_word4,np_4)
tf_5 <- tf_fun(count_word5,np_5)
tf_6 <- tf_fun(count_word6,np_6)
tf_7 <- tf_fun(count_word7,np_7)
tf_8 <- tf_fun(count_word8,np_8)
tf_9 <- tf_fun(count_word9,np_9)
tf_10 <- tf_fun(count_word10,np_10)
tf_11 <- tf_fun(count_word11,np_11)
tf_12 <- tf_fun(count_word12,np_12)
tf_13 <- tf_fun(count_word13,np_13)
tf_14 <- tf_fun(count_word14,np_14)
tf_15 <- tf_fun(count_word15,np_15)
tf_16 <- tf_fun(count_word16,np_16)
tf_17 <- tf_fun(count_word17,np_17)
tf_18 <- tf_fun(count_word18,np_18)
tf_19 <- tf_fun(count_word19,np_19)
tf_20 <- tf_fun(count_word20,np_20)

idf_1 <- idf_fun(count_word1)
idf_2 <- idf_fun(count_word2)
idf_3 <- idf_fun(count_word3)
idf_4 <- idf_fun(count_word4)
idf_5 <- idf_fun(count_word5)
idf_6 <- idf_fun(count_word6)
idf_7 <- idf_fun(count_word7)
idf_8 <- idf_fun(count_word8)
idf_9 <- idf_fun(count_word9)
idf_10 <- idf_fun(count_word10)
idf_11 <- idf_fun(count_word11)
idf_12 <- idf_fun(count_word12)
idf_13 <- idf_fun(count_word13)
idf_14 <- idf_fun(count_word14)
idf_15 <- idf_fun(count_word15)
idf_16 <- idf_fun(count_word16)
idf_17 <- idf_fun(count_word17)
idf_18 <- idf_fun(count_word18)
idf_19 <- idf_fun(count_word19)
idf_20 <- idf_fun(count_word20)

tf_idf_1 <- tf_idf_fun(tf_1,idf_1,count_word1)
tf_idf_2 <- tf_idf_fun(tf_2,idf_2,count_word2)
tf_idf_3 <- tf_idf_fun(tf_3,idf_3,count_word3)
tf_idf_4 <- tf_idf_fun(tf_4,idf_4,count_word4)
tf_idf_5 <- tf_idf_fun(tf_5,idf_5,count_word5)
tf_idf_6 <- tf_idf_fun(tf_6,idf_6,count_word6)
tf_idf_7 <- tf_idf_fun(tf_7,idf_7,count_word7)
tf_idf_8 <- tf_idf_fun(tf_8,idf_8,count_word8)
tf_idf_9 <- tf_idf_fun(tf_9,idf_9,count_word9)
tf_idf_10 <- tf_idf_fun(tf_10,idf_10,count_word10)
tf_idf_11 <- tf_idf_fun(tf_11,idf_11,count_word11)
tf_idf_12 <- tf_idf_fun(tf_12,idf_12,count_word12)
tf_idf_13 <- tf_idf_fun(tf_13,idf_13,count_word13)
tf_idf_14 <- tf_idf_fun(tf_14,idf_14,count_word14)
tf_idf_15 <- tf_idf_fun(tf_15,idf_15,count_word15)
tf_idf_16 <- tf_idf_fun(tf_16,idf_16,count_word16)
tf_idf_17 <- tf_idf_fun(tf_17,idf_17,count_word17)
tf_idf_18 <- tf_idf_fun(tf_18,idf_18,count_word18)
tf_idf_19 <- tf_idf_fun(tf_19,idf_19,count_word19)
tf_idf_20 <- tf_idf_fun(tf_20,idf_20,count_word20)

tf_idf_top_1 <- view_top10(count_word1, tf_1, idf_1, tf_idf_1)
View(tf_idf_top_1)
tf_idf_top_2 <- view_top10(count_word2, tf_2, idf_2, tf_idf_2)
View(tf_idf_top_2)
tf_idf_top_3 <- view_top10(count_word3, tf_3, idf_3, tf_idf_3)
View(tf_idf_top_3)
tf_idf_top_4 <- view_top10(count_word4, tf_4, idf_4, tf_idf_4)
View(tf_idf_top_4)
tf_idf_top_5 <- view_top10(count_word5, tf_5, idf_5, tf_idf_5)
View(tf_idf_top_5)
tf_idf_top_6 <- view_top10(count_word6, tf_6, idf_6, tf_idf_6)
View(tf_idf_top_6)
tf_idf_top_7 <- view_top10(count_word7, tf_7, idf_7, tf_idf_7)
View(tf_idf_top_7)
tf_idf_top_8 <- view_top10(count_word8, tf_8, idf_8, tf_idf_8)
View(tf_idf_top_8)
tf_idf_top_9 <- view_top10(count_word9, tf_9, idf_9, tf_idf_9)
View(tf_idf_top_9)
tf_idf_top_10 <- view_top10(count_word10, tf_10, idf_10, tf_idf_10)
View(tf_idf_top_10)
tf_idf_top_11 <- view_top10(count_word11, tf_11, idf_11, tf_idf_11)
View(tf_idf_top_11)
tf_idf_top_12 <- view_top10(count_word12, tf_12, idf_12, tf_idf_12)
View(tf_idf_top_12)
tf_idf_top_13 <- view_top10(count_word13, tf_13, idf_13, tf_idf_13)
View(tf_idf_top_13)
tf_idf_top_14 <- view_top10(count_word14, tf_14, idf_14, tf_idf_14)
View(tf_idf_top_14)
tf_idf_top_15 <- view_top10(count_word15, tf_15, idf_15, tf_idf_15)
View(tf_idf_top_15)
tf_idf_top_16 <- view_top10(count_word16, tf_16, idf_16, tf_idf_16)
View(tf_idf_top_16)
tf_idf_top_17 <- view_top10(count_word17, tf_17, idf_17, tf_idf_17)
View(tf_idf_top_17)
tf_idf_top_18 <- view_top10(count_word18, tf_18, idf_18, tf_idf_18)
View(tf_idf_top_18)
tf_idf_top_19 <- view_top10(count_word19, tf_19, idf_19, tf_idf_19)
View(tf_idf_top_19)
tf_idf_top_20 <- view_top10(count_word20, tf_20, idf_20, tf_idf_20)
View(tf_idf_top_20)









