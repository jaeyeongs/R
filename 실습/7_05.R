salary <- read.csv("regdata.csv")
head(salary)

temp <-subset(salary, salary$gender == 'M')
temp2 <-subset(salary, salary$gender == 'F')

split.screen(c(2,2))
screen(1)
hist(temp$Incentive)
screen(2)
hist(temp$Salary)
screen(3)
hist(temp2$Incentive)
screen(4)
hist(temp2$Salary)