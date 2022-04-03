x = c(1, 2, 3, 4, 5)
y = c(2, 3, 1, 5, 6)

cor(x, y)

cor(y, x)

cor((x + 3), y)

y_switch = c(y[1:3], y[5], y[4])

cor(x, y_switch)

str(olympics)
