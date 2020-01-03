#extract tweets

GST.tweets = searchTwitter("GST",n=100000)

#convert into dataframe
data<-do.call("rbind",lapply(GST.tweets,as.data.frame))

#remove odds and emoticons

data$text<-sapply(data$text,function(row)iconv(row,"latin1","ASCII", sub = ""))

#remove url

data$text<-gsub("(f|ht)tp(s?)://(.*)[.][a-z]+","",data$text)

sample<-data$text