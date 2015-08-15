library("stringr")
heading={}
content={}
date={}
#---------------------------NorthEastToday-----------------------------------

for (i in 1:length(links1)){
  a<-html(links1[i])
  heading[i]<-a %>% html_node(".content-article-title h1") %>% html_text()    #Read heading
  print(paste(i,"->",heading[i]))                               
  content_list<-a %>% html_nodes(".shortcode-content p") %>% html_text()      #Takes each paragraph as an item in a list
  content[i]<-paste(content_list,sep=" ",collapse = " ")
  #print(content[i])
  date[i]<-a %>% html_node(".calendar-date") %>% html_text()
  #print(date[i])
}
df<-data.frame(heading,date,content)
names(df)<-c("Heading","Date","Content")
write.csv(df,"NortheastToday.csv")
print("Exported to csv format")

#---------------------------------------------------------------------

#---------------------------ZeeNews-----------------------------------

# for (i in 1:length(links2)){
#   a<-html(links2[i])
#   heading[i]<-a %>% html_node("h1") %>% html_text()    #Read heading
#   print(heading[i])                               
#   content_list<-a %>% html_nodes(".even p") %>% html_text()      #Takes each paragraph as an item in a list
#   content[i]<-paste(content_list,sep=" ",collapse = "")
#   print(content[i])
#   date[i]<-a %>% html_node(".writer") %>% html_text()
#   date[i]<-paste(word(date[i],-5),word(date[i],-4),word(date[i],-3))
#   print(date[i])
# }
# df<-data.frame(heading,date,content)
# names(df)<-c("Heading","Date","Content")
# write.csv(df,"ZeeNews.csv")
# print("Exported to csv format")

#---------------------------------------------------------------------
