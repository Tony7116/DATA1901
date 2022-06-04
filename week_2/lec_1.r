library(tidyverse)
# Read in the Road Fatalities Dataset
data = read.csv("./week_2/Data/2016FatalitiesC.csv", header = T)

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

# ----------------------------------------------------------------------------------------------------------- # nolint
# Lecture 5 - Quantitative data
# Example 1 - Drawing a sinple histogram
# Choosing the age as my variable
age = data$Age
print(age)

# Choosing the class intervals 
breaks = c(0, 18, 25, 70, 100)

# Producing a distribution table
table(cut(age, breaks, right = F))

# produce an histogram
hist(
    age,
    br = breaks,
    freq = F,
    right = F,
    xlab = "Age (in yearas)",
    ylab = "% per year",
    main = "Histogram of age of Road Fatalities"
)

# ----------------------------------------------------------------------------------------------------------- # nolint
# example 2 - controlling for a variable
age_f = data$Age[data$Gender == "Female"]
age_m = data$Age[data$Gender == "Male"]

par(mfrow = c(1, 2))

hist(age_f, freq = F)
hist(age_m, freq = F)

# ------------------------------------------------------------------------------------------------------------ #nolint
# a boxplot
summary(age)

par(mfrow = c(1, 2))
boxplot(age)

boxplot(age, horizontal = T)

# A comparitive boxplot
gender = data$Gender
summary(age[gender == "Female"])
summary(age[gender == "Male"])

# age~gender does the comaritive display
boxplot(age~gender, horizontal = T)

# ------------------------------------------------------------------------------------------------------------ #nolint
# scatter plot

speed_limit = data$SpeedLimit
plot(age, speed_limit)

# ------------------------------------------------------------------------------------------------------------ #nolint
# Data Visualisation
diamonds
str(diamonds)
head(diamonds, 2)

# ------------------------------------------------------------------------------------------------------------ #nolint
# ggplot bar plot
p = ggplot(
    diamonds,
    aes(x = cut)
) + geom_bar()
plot(p)

p2 = ggplot(
    diamonds,
    aes(x = cut)
) + geom_bar(
        aes(fill = clarity)
)
plot(p2)

p3 = ggplot(
    diamonds,
    aes(x = cut)
) + geom_bar(
    aes(fill = clarity),
    position = "dodge"
)
plot(p3)

# ------------------------------------------------------------------------------------------------------------ #nolint
# ggplot histogram (1 quantitative variable)
p_histogram_1 = ggplot(
    diamonds,
    aes(x = price)
) + geom_histogram()
plot(p_histogram_1)

# ggplot histogram (1 quantitative variable) + (1 qualitative variable)
p_histogram_2 = ggplot(
    diamonds,
    aes(x = price)
) + geom_histogram(
    aes(fill = cut)
)
plot(p_histogram_2)

# ------------------------------------------------------------------------------------------------------------ #nolint
# ggplot scatter plot (1 quantitative variable)
p_scatter_1 = ggplot(
    diamonds,
    aes(x = carat, y = price)
) + geom_point()
plot(p_scatter_1)

# ggplot histogram (1 quantitative variable) + (2 qualitative variable)
p_scatter_2 = ggplot(
    diamonds,
    aes(x = carat, y = price)
) + geom_point(
    aes(
        colour = clarity,
        shape = cut
    )
)
plot(p_scatter_2)

# ------------------------------------------------------------------------------------------------------------ #nolint
# ggplot box plot (1 quantitative variable, divided by 1 qualitative variable)
p_box_1 = ggplot(
    diamonds,
    aes(x = color, y = price)
) + geom_boxplot()
plot(p_box_1)
