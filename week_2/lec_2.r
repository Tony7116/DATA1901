# Lecture 2: Quantitative Data
# ------------------------------------------------------------------------------


# ==============================================================================
# Variables needed for the graphs
# ==============================================================================

# Read in data
all_fatalities = read.csv("./week_2/Data/AllFatalities.csv", header = T)

# Getting the gender
gender = all_fatalities$Gender

# Choosing a variable: age
age = suppressWarnings(as.numeric(all_fatalities$Age))

# We can also JUST extract the female ages
age_female = suppressWarnings(
    as.numeric(
        age[all_fatalities$Gender == "Female"]
    )
)

# We can also JUST extract the male ages
age_male = suppressWarnings(
    as.numeric(
        age[all_fatalities$Gender == "Male"]
    )
)

# Getting the speed limit
speed_limit = all_fatalities$Speed_Limit

# ==============================================================================
# The processes of creating a histogram
# ==============================================================================

table(age)
# Choosing the class intervals
breaks = c(0, 18, 25, 70, 100)

class(breaks)
class(age)

# Produce a distribution table
# freq = F - Creates histogram on the density scale
# right = F - makes the intervals right-open.
table(cut(age, breaks, right = F))

# This puts the graphical output in 1 row with 2 columns
# par(mfrow = c(1, 2))

hist(age_female, freq = F)
hist(age_male, freq = F)

# ==============================================================================
# The processes of creating a box plot
# ==============================================================================
summary(age)

boxplot(age)
boxplot(age, horizontal = T)

summary(age_female)
summary(age_male)

# Creating a comparitive box plot
boxplot(age~gender, horizontal = T)

# ==============================================================================
# The processes of creating a scatter plot
# ==============================================================================

table(speed_limit)
plot(age, speed_limit)
