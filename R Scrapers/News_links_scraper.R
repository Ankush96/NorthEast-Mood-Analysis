library("rvest")
# Sys.setenv(http_proxy="10.3.100.207:8080") 
states<-c("arunachal-pradesh","assam","manipur","meghalaya","mizoram","nagaland","tripura")

#--------------------NorthEastToday--------------------------------
# links1={}
# url_name<-"http://www.northeasttoday.in/category/"
# for(s_no in 1:length(states))
# {
#   
#   print(paste("Currently in",states[s_no]))
#   
#   #------------------Accessing the number of pages----------------------
#   exact_url<-paste(url_name,states[s_no],"/",sep="")
#   news_links<-html(exact_url)
#   max_pages<-news_links %>%
#     html_nodes(".page-numbers") %>%
#     html_text()
#   max_pages<-as.numeric(max_pages[length(max_pages)-1])
#   print(max_pages)
#   #---------------------------------------------------------------------
#   
#   for(page_no in 1:max_pages)
#   {
#     exact_url<-paste(url_name,states[s_no],"/page/",page_no,"/",sep="")
#     if(page_no==1)
#     {
#       exact_url<-paste(url_name,states[s_no],"/",sep="")
#     }
#     print(paste("Accesing page number",page_no," url->",exact_url))
#     news_links<-html(exact_url)
#     links<-news_links %>%
#       html_nodes(".hentry .article-header a") %>%
#       html_attr("href")
#     
#     print(links)
#     links1<-c(links1,links)
#     print(length(links1))
#   }
# }

#---------------------------------------------------------------------

#---------------------------ZeeNews-----------------------------------

# links2={}
# url_name<-"http://zeenews.india.com/state/north-east?page="
# for(page_no in 0:19)
# {
#   news_links<-html(paste(url_name,page_no,sep=""))
#   
#   links<-news_links %>%
#     html_nodes(".lead-health-ab a") %>%
#     html_attr("href")
#   for(i in 1:length(links))
#   {
#     links[i]=paste("http://zeenews.india.com",links[i],sep="")
#   }
#   links2<-c(links2,links)
# }
# 
# print(links2)

#---------------------------------------------------------------------

#--------------------------KanglaOnline-------------------------------
# links3={}
# url_name="http://kanglaonline.com/category/news/headlines/page/"
# news_links<-html(paste(url_name,2,sep=""))
# max_links<-news_links %>%
#   html_nodes(".dots+ .page-numbers") %>%
#   html_text()
# max_links<-as.numeric(max_links)
# print(max_links)
# for(page_no in 2:max_links)
# {
#   print(paste("Accessing ",paste(url_name,page_no,'/',sep="")))
#   news_links<-html(paste(url_name,page_no,'/',sep=""))
#   links<-news_links %>%
#     html_nodes("h2 a") %>%
#     html_attr()
#   print(links)
#   links3<-c(links3,links)
#   print(length(links3))
# }
#---------------------------------------------------------------------

#--------------------------SHillong Times---------------------------
links4={}
url_name<-"http://www.theshillongtimes.com/meghalaya/page/"

for(page_no in 2:300)
{
  
  exact_url<-paste(url_name,page_no,"/",sep="")
  print(paste("Accesing page number",page_no," url->",exact_url))
  news_links<-html(exact_url)
  links<-news_links %>%
    html_nodes("h3 a") %>%
    html_attr("href")
  print(links)
  
  links4<-c(links4,links)
  print(length(links4))
}


#---------------------------------------------------------------

