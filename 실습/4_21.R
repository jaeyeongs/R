abc <- c(110, 300, 150, 280, 310) 
def <- c(180, 200, 210, 190, 170) 
ghi <- c(210, 150, 260, 210, 70)  

B_Type2 <- matrix(c(abc,def,ghi), 5,3)  
B_Type2  

barplot(B_Type2, main="Ball Type�� ������ �Ǹŷ�", xlab="Ball Type", ylab="����", beside=T, names.arg=c("BaseBall","SoccerBall","BeachBall"), border="blue",col=rainbow(5), ylim=(c(0,400))) 

legend(16, 400, c("A ����","B ����","C ����","D ����","E ����"), cex=0.8, fill=rainbow(5)) 