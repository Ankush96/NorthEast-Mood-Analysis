library("rvest")
# Sys.setenv(http_proxy="10.3.100.207:8080") 
news_links<-html("http://www.northeasttoday.in/")

links<-news_links %>%
  html_nodes(".content-category a ") %>%
  html_attr("href")

half = length(links)/2
a = (1:half)
a= 2*a
a=a-1
links<-links[a]

print(links)