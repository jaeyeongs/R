install.packages("arules")
library(arules) 
a_list <- list(c("a","b","c"), c("a","b"), c("a","b","d"), c("c","e"), c("a","b","d","e"))
names(a_list) <- paste("Group", c(1:5), sep="") 
a_list   
trans <- as(a_list, "transactions")
trans
summary(trans) 
image(trans)