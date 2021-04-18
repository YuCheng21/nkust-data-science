# 設定工作目錄
setwd("E:/Programs/R/Projects/nkust-data-science/Mid-Project/Abstract")
# 全部摘要名稱
all_abstract <- 1:20

# Function - 清除標點符號和 na 值，並計算單字出現次數
cleaning_split <- function(split_word, i){
  # 取得摘要內所有單字數量，並遞迴處理
  for (j in 1:number_of_split_col[i]) {
    # 去除標點符號
    split_word[1, j] <- gsub("[[:punct:]]", "",split_word[1, j])
    # 處理 na 值
    split_word[is.na(split_word)] <- ""
  }
  # 計算每個單字出現的頻率(不重複)，存入全域變數中
  assign(paste0("number_of_word_", as.character(i)),
         (as.data.frame(table(unlist(split_word, use.names = FALSE)),
                        stringsAsFactors = FALSE)),envir = .GlobalEnv)
  # 回傳清理乾淨的單字
  return(split_word)
}
# 摘要內所有單字數量
number_of_split_col <- c()
# 遞迴執行函式在所有摘要上
for (i in all_abstract) {
  # 設定輸入檔案名稱
  file_name <- paste0(as.character(i), ".txt")
  # 利用 csv 特性以【空格】分割單字到表格中
  split_word <- read.csv(file_name,
                header = FALSE,
                stringsAsFactors = FALSE,
                sep = " ",
                fileEncoding ="UTF-8")
  # 取得表格中的 col 數量，也就是摘要內所有單字數量
  number_of_split_col[i] <- ncol(split_word)
  # 呼叫函式擷取乾淨單字，並儲存變數
  assign(paste0("clean_split_", as.character(i)), cleaning_split(split_word, i))
}
# Function - 計算 TF
calculate_tf <- function(number_of_word, clean_split) {
  # 每個摘要內、每個單字的 TF 值
  tf_of_word <- c()
  # 取得摘要內每個單字出現的頻率，並遞迴處理
  for(i in 1:nrow(number_of_word)){
    # tf = 檔案中該單字數量 / 單字總數
    tf_of_word[i] <- as.integer(number_of_word[i, 2]) / ncol(clean_split)
  }
  # 回傳每個摘要內、每個單字的 TF 值
  return(tf_of_word)
}
# 遞迴執行函式在所有摘要上
for (i in all_abstract) {
  # 計算每個單字的 TF 值，並存入全域變數中
  assign(paste0("tf_",as.character(i)),
         calculate_tf(get(paste0("number_of_word_", as.character(i))),
                get(paste0("clean_split_", as.character(i)))))
}
# Function - 計算 IDF
calculate_idf <- function(number_of_word){
  # 每個摘要內、每個單字的 IDF 值
  idf_of_word <- c()
  # 取得摘要內每個單字出現的頻率，並遞迴處理
  for(i in 1:nrow(number_of_word)){
    # 初始化 IDF 值
    idf_of_word[i] <- 0
    # 取得每個摘要中、每個單字出現的頻率
    for(j in all_abstract){
      # 如果該摘要(j)中有出現該單字(i)，則出現次數 + 1
      if(number_of_word[i,1] %in% get(paste0("number_of_word_",as.character(j)))[,1]){
        idf_of_word[i] <- idf_of_word[i] + 1
      }
    }
    # IDF = log(文章總數 / 含有該單字的文章數目)
    idf_of_word[i] <- log((length(all_abstract) / (idf_of_word[i])), base = 10)
  }
  # 回傳每個摘要內、每個單字的 IDF 值
  return(idf_of_word)
}
# 遞迴執行函式在所有摘要上
for (i in all_abstract) {
  # 計算每個單字的 IDF 值，並存入全域變數中
  assign(paste0("idf_", as.character(i)),
         calculate_idf(get(paste0("number_of_word_", as.character(i)))))
}
# Function - 計算 TF-IDF
calculate_tf_idf <- function(tf_of_word, idf_of_word, number_of_word){
  # 每個摘要內、每個單字的 TF-IDF 值
  tf_idf_of_word <- c()
  # 取得摘要內每個單字出現的頻率，並遞迴處理
  for(i in 1:nrow(number_of_word)){
    # 初始化 TF-IDF 值
    tf_idf_of_word[i] <- 0
    # TF-IDF = TF * IDF
    tf_idf_of_word[i] <- idf_of_word[i] * tf_of_word[i]
  }
  # 回傳每個摘要內、每個單字的 TF-IDF 值
  return(tf_idf_of_word)
}
# 遞迴執行函式在所有摘要上
for (i in all_abstract) {
  # 計算每個單字的 TF-IDF 值，並存入全域變數中
  assign(paste0("tf_idf_", as.character(i)),
         calculate_tf_idf(get(paste0("tf_", as.character(i))),
                    get(paste0("idf_", as.character(i))),
                    get(paste0("number_of_word_", as.character(i)))
                    )
         )
}
# Function - 列出前 10 重要的單字
list_top <- function(number_of_word, tf, idf, tf_idf){
  # 取得每個摘要內的所有單字值、TF、IDF、TF-IDF
  tf_idf_word <- data.frame(number_of_word, tf, idf, tf_idf)
  # 依照 TF-IDF 來排序單字重要度
  tf_idf_sort <- tf_idf_word[order(tf_idf_word$tf_idf, decreasing = TRUE),]
  # 取出前 10 重要的單字
  tf_idf_top <- tf_idf_sort[1:10,]
  # 回傳每個摘要內前 10 重要的單字
  return(tf_idf_top)
}
# 遞迴執行函式在所有摘要上
for (i in all_abstract) {
  # 計算每個摘要前 10 重要的單字，並存入全域變數中
  assign(paste0("tf_idf_top_", as.character(i)),
         list_top(get(paste0("number_of_word_", as.character(i))),
                    get(paste0("tf_", as.character(i))),
                    get(paste0("idf_", as.character(i))),
                    get(paste0("tf_idf_", as.character(i)))))
}
