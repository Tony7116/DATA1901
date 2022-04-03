library(multicon)
library(ggplot2)
x = as.data.frame(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10))
summary(x)
popsd(x)

y = (x - mean(x)) ^ 2
sum(y)
