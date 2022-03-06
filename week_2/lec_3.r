# Lecture 3: Data Visualisation
# ------------------------------------------------------------------------------

# the library() function brings in the ggplot2 into the project
library(ggplot2)
library(plotly)

# ==============================================================================

# This is the  built-in dataset that you can call upon to use
diamonds_data = diamonds
str(diamonds_data)

# ==============================================================================
# ggplot 2
# ==============================================================================

head(diamonds_data, 10)

# ggplot 2: 1 - Bar Plot
p_bar = ggplot(diamonds_data, aes(x = cut)) +
     geom_bar(aes(fill = clarity))
plot(p_bar)
ggplotly(p_bar)

# ggplot 2: 2 - Histogram
p_hist = ggplot(diamonds, aes(x = price)) +
     geom_histogram(
          aes(fill = cut), 
          position = "dodge")
plot(p_hist)
ggplotly(p_hist) 

# ggplot 2: 3 - Simple Scatter Plot
p_scatter = ggplot(diamonds_data, aes(x = carat, y = price)) +
     geom_point()

plot(p_scatter)
ggplotly(p_scatter)
