newtown_june_2017 <- read.csv("week_3/data/NewtownJune2017.csv", header = T)
head(newtown_june_2017, n = 2)

dim(newtown_june_2017)

str(newtown_june_2017)

# ==============================================================================
# MEAN CAKCULTATION
# ==============================================================================

# To figure out the mean of a particular dataset, we can:
sold <- newtown_june_2017$Sold
bedrooms <- newtown_june_2017$Bedrooms
types <- newtown_june_2017$Type
mean(sold)
mean(sold[types == "House" & bedrooms == "4"])
# visually
hist(sold, main = "Newtown Properties", xlab = "Price (in 1000s)")
abline(v = mean(sold), col = "green")

# visually (4 bedrooms)
hist(
    sold[types == "House" & bedrooms == "4"],
    main = "Newtown Properties", xlab = "Price (in 1000s)"
)
abline(
    v = mean(sold[types == "House" & bedrooms == "4"]),
    col = "green"
)

# ==============================================================================
# MEDIAN CAKCULTATION
# ==============================================================================
sort(sold)
length(sold)
median(sold)
median(sold[types == "House" & bedrooms == "4"])

# ==============================================================================
# VISUAL REPRESENTATION
# ==============================================================================

hist(sold)
abline(v = mean(sold), col = "green")
abline(v = median(sold), col = "purple")
