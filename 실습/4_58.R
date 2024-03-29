library(ggplot2)
data(mpg, package="ggplot2") # alternate source: "http://goo.gl/uEeRGu")
theme_set(theme_bw())  # pre-set the bw theme.

g <- ggplot(mpg, aes(cty, hwy))

# Scatterplot 그림을 그린다. 아래의 내용은 배치로 만든후에 실행할 것
g + geom_point() + 
geom_smooth(method="lm", se=F) +
labs(subtitle="mpg: city vs highway mileage", 
y="hwy", 
x="cty", 
title="Scatterplot with overlapping points", 
caption="Source: midwest")