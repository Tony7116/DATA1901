library("ggplot2");
# =====================================================================
# DATA STORY
# =====================================================================

# import data
data = read.csv("Week_4/data/studentheights.csv", header = T);
abs_data = read.csv("Week_4/data/ABSFemaleHeights.csv", header = T);

# Create hieght variable
heights = data$heights;
hist(
  heights,
  main = "Histogram of female heights",
  xlab = "Height (cm)",
  freq = F
);

# Drawing a normal curve on the histogram
curve(
  dnorm(
    x,
    mean = mean(heights),
    sd = sd(heights)),
    add = TRUE,
    col = "red"
  );

# mean of the studentheights.csv
mean(heights);

# standard deviation of heights
sd(heights);

# The number of data points that have a height > 189
length(heights[heights > 189]);

# =================================================================
# NORMAL DISTRIBUTION CURVE (Standard + General)
# =================================================================

# This mocks a random set of 100 data points that is between -4 and 4
mock_data = seq(-4, 4, length = 100);

frequency = dnorm(mock_data);

plot(
  mock_data,
  frequency,
  type = "l",
  lwd = 2,
  axes = TRUE,
  xlab = "SD",
  ylab = "freq"
);

cord.a = 

# This calculates the lower tail (counting Left -> right)
# probability of the specified SD point.
pnorm(0.8)

# This calculates the upper tail (counting right -> left)
# probability of the specified SD point.
pnorm(0.8, lower.tail = F)

# We can also claculate probability intervals for a normal distribution curve
pnorm(0.8) - pnorm(0.3)

# For a General Normal Curve:
# You'll need to specify the mean and SD
# pnorm(x, mean, SD) # nolint
pnorm(171, 161.9, 7.7);

# To calculate the upper tail:
pnorm(171, 161.9, 7.7, lower.tail = F);
