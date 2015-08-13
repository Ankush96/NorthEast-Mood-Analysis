heading={}
content={}
date={}
for (i in 1:length(links)){
  a<-html(links[i])
  heading[i]<-a %>% html_node(".content-article-title h1") %>% html_text()    #Read heading
  print(heading[i])                               
  content_list<-a %>% html_nodes(".shortcode-content p") %>% html_text()      #Takes each paragraph as an item in a list
  content[i]<-paste(content_list,sep=" ",collapse = " ")
  #print(content[i])
  date[i]<-a %>% html_node(".calendar-date") %>% html_text()
}
df<-data.frame(heading,date,content)
names(df)<-c("Heading","Date","Content")
write.csv(df,"NortheastToday.csv")
print("Exported to csv format")