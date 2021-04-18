# Set work directory
setwd("E:/Programs/R/Projects/nkust-data-science/Mid-Project/Abstract")
# All abstract file name
all_abstract <- 1:20

# Function - Clean the text symbol and na-value, and count number of word
np_gsub <- function(np,i){
  for (p in 1:number_of_split_col[i]) {
    #去除標點符號
    np[1,p] <- gsub("[[:punct:]]", "",np[1,p])
    #處理NA值
    np[is.na(np)]<-""

  }
  assign(paste0("count_word_",as.character(i)),
         (as.data.frame(table(unlist(np,use.names = FALSE)),
                        stringsAsFactors = FALSE)),
         envir = .GlobalEnv
         )
  return(np)
}
# Run the function for all abstract in for-loop
number_of_split_col <- c()
for (i in all_abstract) {
  file_name <- paste0(as.character(i),".txt")

  split_word <- read.csv(file_name,
                header = FALSE,
                stringsAsFactors = FALSE,
                sep = " ",
                fileEncoding ="UTF-8"
                )

  number_of_split_col[i] <- ncol(split_word)

  assign(paste0("np_",as.character(i)),np_gsub(split_word,i))

}
# Function - Calculate TF
tf_fun <- function(count_word,np) {
  tf_A <- c()
  for(i in 1:nrow(count_word)){
    tf_A[i] <- as.integer(count_word[i,2])/ ncol(np)
  }
  return(tf_A)
}
# Run the function for all abstract in for-loop
for (i in all_abstract) {
  assign(paste0("tf_",as.character(i)),
         tf_fun(get(paste0("count_word_",as.character(i))),
                get(paste0("np_",as.character(i)))
                )
         )
}
# Function - Calculate IDF
idf_fun <- function(count_word){

  idf <- 0

  for(i in 1:nrow(count_word)){
    idf[i] <- 0
    #print(count_word1[i+1,1])

    for(j in all_abstract){
      if(count_word[i,1] %in% get(paste0("count_word_",as.character(j)))[,1]){
        idf[i] <- idf[i] + 1
      }
    }

    idf[i] <- log((length(all_abstract)/ (idf[i])), base = 10)

  }
  return(idf)
}
# Run the function for all abstract in for-loop
for (i in all_abstract) {
  assign(paste0("idf_",as.character(i)),
         idf_fun(get(paste0("count_word_",as.character(i)))
                 )
         )
}
# Function - Calculate TF-IDF
tf_idf_fun <- function(tf,idf,count_word){
  tf_idf <- c()
  for(i in 1:nrow(count_word)){
    tf_idf[i]<- 0
    tf_idf[i] <- idf[i]*tf[i]
  }

  return(tf_idf)
}
# Run the function for all abstract in for-loop
for (i in all_abstract) {
  assign(paste0("tf_idf_",as.character(i)),
         tf_idf_fun(get(paste0("tf_",as.character(i))),
                    get(paste0("idf_",as.character(i))),
                    get(paste0("count_word_",as.character(i)))
                    )
         )
}
# Function - List the top-10 important words
view_top10 <- function(count_word, tf, idf, tf_idf){
  tf_idf_sol <- data.frame(count_word, tf, idf, tf_idf)
  tf_idf_pop <- tf_idf_sol[order(tf_idf_sol$tf_idf, decreasing = TRUE),]
  tf_idf_top10 <- tf_idf_pop[1:10, ]
  return(tf_idf_top10)
}
# Run
for (i in all_abstract) {
  assign(paste0("tf_idf_top_",as.character(i)),
         view_top10(get(paste0("count_word_",as.character(i))),
                    get(paste0("tf_",as.character(i))),
                    get(paste0("idf_",as.character(i))),
                    get(paste0("tf_idf_",as.character(i)))
                    )
         )
}
