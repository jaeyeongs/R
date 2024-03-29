library(ggplot2)
install.packages("ggcorrplot")
library(ggcorrplot) 
# Correlation matrix
data(mtcars)
corr <- round(cor(mtcars), 1)

# Plot
ggcorrplot(corr, hc.order = TRUE, 
type = "lower", 
lab = TRUE, 
lab_size = 3, 
method="circle", 
colors = c("tomato2", "white", "springgreen3"), 
title="Correlogram of mtcars", 
ggtheme=theme_bw)