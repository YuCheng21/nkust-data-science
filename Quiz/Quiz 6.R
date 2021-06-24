library(rvest)
library(jpeg)

url = "https://zh.wikipedia.org/wiki/%E5%A4%A7%E9%9B%84%E7%9A%84%E6%96%B0%E6%81%90%E9%BE%8D"
srw = read_html(url)

a1 = srw %>% html_nodes(xpath='/html/body/div[3]/div[3]/div[5]/div[1]/p[1]/span/span/text()[1]') %>% html_text()

a2 = srw %>% html_nodes(xpath='/html/body/div[3]/div[3]/div[5]/div[1]/table[1]/tbody/tr[10]/td') %>% html_text()

a3 = srw %>% html_nodes(xpath='/html/body/div[3]/div[3]/div[5]/div[1]/table[1]/tbody/tr[15]/td/div/ul/li[2]/text()') %>% html_text()

a4 = srw %>% html_nodes(xpath='/html/body/div[3]/div[3]/div[5]/div[1]/table[1]/tbody/tr[13]/td/a') %>% html_text()

a5 = srw %>% html_nodes(xpath='/html/body/div[3]/div[3]/div[5]/div[1]/table[2]/tbody/tr[4]/td[2]/a') %>% html_text()

a6 = srw %>% html_nodes(xpath='/html/body/div[3]/div[3]/div[5]/div[1]/p[4]/a[1]') %>% html_text()

a7 = srw %>% html_nodes(xpath='/html/body/div[3]/div[3]/div[5]/div[1]/p[4]/a[2]') %>% html_text()

paste0("日文片名:",a1)
paste0("電影片長:",a2)
paste0("台灣上映日期:", a3)
paste0("官方網站:",a4)
paste0("哆啦A夢日本配音員:",a5)
paste0("主題曲:", a6)
paste0("主唱:", a7)

img = srw %>% html_nodes(xpath='/html/body/div[3]/div[3]/div[5]/div[1]/table[1]/tbody/tr[2]/td/a/img') %>% html_attr('src')
img_path = paste0("https:",img)
download.file(img_path, "image.jpg", mode = 'wb')

img = readJPEG("image.jpg", native=TRUE)
plot(NA, xlim=c(0,nrow(img)), ylim=c(0,nrow(img)))
rasterImage(img,0,0,ncol(img),nrow(img))
