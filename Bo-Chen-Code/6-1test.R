#install.packages("rvest")
library(rvest)
url <- "https://zh.wikipedia.org/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E6%9C%88%E7%90%83%E6%8E%A2%E6%B8%AC%E8%A8%98"
srw <- read_html(url)
print(srw)
#日文片名
img <- srw %>% html_nodes(css ="small") %>% html_text()
img[1]

#分鐘

ul <- srw %>% html_nodes(css = "td") %>% html_text()
ul <- strsplit(ul,"\n")

ul[8]

#上映日期

h1 <- srw %>% html_nodes(css = "li") %>% 
  html_text()
h1[4]
#連結
h2 <- srw %>% html_nodes(css = "td") %>% html_nodes(css = "a") %>%
  html_text()
h2[9]

#配音
h3 <- srw %>% html_nodes(css = "tr") %>% html_nodes(css = "td") %>%html_nodes(css = "a")%>%
  html_text()
h3[26]
