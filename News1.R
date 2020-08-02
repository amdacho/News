#download news file and save as "news"
download.file("https://www.npr.org/sections/news/","news")

x<-readLines("news")

#find common html
grep("Birx warns!",x,ignore.case = TRUE)

#create reg expression to search for pattern. Tag part we want with ().
pattern1 <- "<img src=\\ *\"https://[^>]*\" *class=\"respArchListImg lazyOnLoad\" *alt=\"([^>]*) *\" loading=\"lazy\" */>"

#find pattern in x
y <- grep(pattern1,x,value=TRUE)

#in text w pattern saved in y, replace all pattern with \\1 
test<-gsub(pattern1,'\\1',y,ignore.case=TRUE)
head(test)

#remove spaces in front
test2<-gsub("^ *","",test)
head(test2)

#function to read headlines
headlines <- function(site) {
  x<-readLines(site)
  pattern1 <- "<img src=\\ *\"https://[^>]*\" *class=\"respArchListImg lazyOnLoad\" *alt=\"([^>]*) *\" loading=\"lazy\" */>"
  y <- grep(pattern1,x,value=TRUE)
  test<-gsub(pattern1,'\\1',y,ignore.case=TRUE)
  test2<-gsub("^ *","",test)
  test2
}

#test
headlines("https://www.npr.org/sections/news/")