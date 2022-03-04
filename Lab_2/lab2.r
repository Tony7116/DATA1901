library(tidyverse)
# Read in the Road Fatalities Dataset
data = read.csv("./Lab_2/Data/AllFatalities.csv", header = T)

# This lists out all the variables in the dataset
names(data)

# This returns the number of dimentions of the data
# Note: CrashID is NOT a Variable, it's a identifier
dim(data)

# This tells you the type of each variable
str(data)

# This selects the "Dayweek" variable from the dataset
day_week = data$Dayweek
# This gets the contents of the "Gender" variable data
gender = data$Gender

# Produces a frequency table of fatalities per day of the week
table(day_week)
# This creates a double frequency table
gender_and_day_week_table = table(gender, day_week)
gender_and_day_week_table

# This ceates a barplot of the "day_week" table
barplot(table(day_week))
plot(table(day_week))
