# Chapter 2 Lab - Learning R

# Concatenation function to create vectors
x <- c(1, 2, 3)
# = not used generally
y = c(3, 4, 5)
x + y

# Check length of vector
length(x)

# Checking what a function does
?c

# List stored variables and remove them
ls()
rm(x, y)
rm(list = ls())
ls()

# Function to create matrix
?matrix
z <- matrix(data = c(1, 2, 3, 4), nrow = 2, ncol = 2)
z_row <- matrix(data = c(1, 2, 3, 4), nrow = 2, ncol = 2, byrow = TRUE)

# random number generation
set.seed(42)
x <- rnorm(50)
y <- x + rnorm(50, mean = 50, sd = .1)
cor(x, y) # correlation of to vectors

# operations on matrices/vectors
sqrt(z)
z^2
mean(x)
var(x)
sqrt(var(x))
sd(x)

# Creating sequences
x <- seq(1, 10)
y <- 1:10
z <- seq(0, 1, length = 11)
pi_x <- seq(-pi, pi, length = 50)
inc_x <- seq(1, 10, 2)


# Plotting
set.seed(42)
x <- rnorm(100)
y <- rnorm(100)
plot(x, y, xlab = "x-axis", ylab = "y-axis", main = "Plot of X vs Y")
?plot

# Print a pdf file
pdf("images/ch-02-plot-x-y.pdf")
plot(x, y, xlab = "x-axis", ylab = "y-axis", main = "Plot of X vs Y", col="green")
dev.off()

# Print a jpeg file
jpeg("images/ch-02-plot-x-y.jpg")
plot(x, y, xlab = "x-axis", ylab = "y-axis", main = "Plot of X vs Y", col="green")
dev.off()

# Contour plot
set.seed(42)
x <- 1:10
y <- x
f <- outer(x, y, function(x, y) cos(y) / (1 + x^2))
contour(x, y, f)
fa <- (f - t(f)) / 2
contour(x, y, fa, nlevels = 15, add = TRUE)

# Heatmap
image(x, y, fa)

# 3-D plot
persp(x, y, fa)
persp(x, y, fa, theta = 30)
persp(x, y, fa, theta = 30, phi = 30)

# Indexing
A <- matrix(1:16, 4, 4)
A[2, 3]
A[c(1, 3), c(2, 4)]
A[1:3, 2:4]
A[1:3, ]
A[-(1:3), ]
dim(A)

# Reading data
auto <- read.table("data/Auto.data")
View(auto)
head(auto)
tail(auto)
auto <- read.table("data/Auto.data", header = T, na.strings = "?", stringsAsFactors = T)
head(auto) # Top n rows
tail(auto) # Bottom n rows
dim(auto) # dimensions of the data matrix
auto[1:4, ]
auto <- na.omit(auto) # remove rows with missing values
names(auto) # variable (column) names
summary(auto) # summary of the dataframe variables

# Plotting with dataframes
plot(auto$cylinders, auto$mpg) # plot variables of the dataframe
attach(auto) # specify which dataframe to use for future plot()
plot(cylinders, mpg)
cylinders <- as.factor(cylinders) # covert a variable to categorical
plot(cylinders, mpg, col = "red", varwidth = T, horizontal = T, ylab = "cylinders", xlab = "MPG")
hist(mpg, col = 2, breaks = 15) # histogram
pairs(auto) # plot pairwise scatterplot of all numerical variables
pairs(~mpg + displacement + horsepower + weight + acceleration, data = auto) # select the variables to use for pairwise plotting
plot(horsepower, mpg)
identify(horsepower, mpg, name) # find the value of the points by clicking on the graph

q() # quit the R console
