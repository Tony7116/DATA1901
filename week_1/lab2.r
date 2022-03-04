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

# Creating a scatered bar plot
barplot(gender_and_day_week_table, main="Fatalities by days of the week and biological sex", # nolint
    xlab = "Day of the week", col = c("lightblue", "lightgreen"),
        legend = rownames(gender_and_day_week_table), beside = TRUE
)

# ---------------------------------------------------------------------------------------------------------- # nolint
# Example 2: Investigating Speed Limit

speed_limit = data$Speed_Limit
table(speed_limit)
speed_limit_table = table(speed_limit)
barplot(speed_limit_table)

# This is presenting a double bar plot that plots the frequency of fatalities
# of males and females.
gender_speed_limit_table = table(gender, speed_limit);
barplot(gender_speed_limit_table, main="Fatalities by speed limit and biological sex", # nolint
    xlab = "Speed Limit", col = c("lightblue", "lightgreen"),
        legend = rownames(gender_speed_limit_table), beside = TRUE
)
