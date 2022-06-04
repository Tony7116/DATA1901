library(multicon)

newtown_june_2017 <- read.csv("week_3/data/NewtownJune2017.csv", header = T)
str(newtown_june_2017)
sold = newtown_june_2017$Sold

# ==============================================================================
# SPREAD CALCULATION
# ==============================================================================
gaps = sold - mean(sold)
print(gaps)

max(gaps)
round(mean(gaps))


# ==============================================================================
# STANDARD DEVIATION CALCULATION
# ==============================================================================
sqrt(mean(gaps ^ 2))
sd(sold)
popsd(sold)

# ==============================================================================
# IQR CALCULATION
# ==============================================================================
quantile(sold)
quantile(sold)[4] - quantile(sold)[2]
