library("rvest")
# Sys.setenv(http_proxy="10.3.100.207:8080") 

#--------------------NorthEastToday--------------------------------
'''
news_links<-html("http://www.northeasttoday.in/")
  links1<-news_links %>%
  html_nodes(".content-category a ") %>%
  html_attr("href")

half = length(links1)/2
a = (1:half)
a= 2*a
a=a-1
links1<-links1[a]

print(links1)
'''
#---------------------------------------------------------------------

#---------------------------ZeeNews-----------------------------------
links2={}
url_name<-"http://zeenews.india.com/state/north-east?page="
for(page_no in 0:19)
{
  news_links<-html(paste(url_name,page_no,sep=""))
  
  links<-news_links %>%
    html_nodes(".lead-health-ab a") %>%
    html_attr("href")
  for(i in 1:length(links))
  {
    links[i]=paste("http://zeenews.india.com",links[i],sep="")
  }
  links2<-c(links2,links)
}

print(links2)
#---------------------------------------------------------------------