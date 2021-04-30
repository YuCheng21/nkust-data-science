#install.packages("rvest")
library(rvest)
url <- "https://zh.wikipedia.org/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E6%9C%88%E7%90%83%E6%8E%A2%E6%B8%AC%E8%A8%98"
srw <- read_html(url)
print(srw)

#-----------日文片名--------
name <- srw%>%html_nodes(css ="tbody")%>% html_nodes(css = "big") %>% html_nodes(css = "small") %>%html_nodes(css = "span")%>%
            html_text()
name

#------------分鐘----------
Minute <- srw %>% html_nodes(css = "td") %>% html_text()
Minute <- strsplit(Minute,"\n")
Minute[8]

#-----------上映日期--------
Day <- srw%>%html_nodes(css ="tbody")%>% html_nodes(css = "td") %>% html_nodes(css = "ul") %>%html_nodes(css = "li")%>%
             html_text()
Day[4]

#--------------連結-----------
Link <- srw %>% html_nodes(css = "td") %>% html_nodes(css = "a") %>%
              html_text()
Link[9]

#-------------配音-------------
Voice <- srw %>% html_nodes(css = ".wikitable") %>% html_nodes(css = "tbody") %>%html_nodes(css = "td")%>%html_nodes(css = "a")%>%
              html_text()
Voice[2]
