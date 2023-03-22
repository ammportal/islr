library(MASS)
library(ISLR2)
head(Boston)
?Boston
attach(Boston)
lm.fit <- lm(medv ~ lstat)

lm.fit
summary(lm.fit)
names(lm.fit)
coef(lm.fit)
confint(lm.fit)
predict(lm.fit, data.frame(lstat = c(c(5, 10, 15))), interval = "confidence")
predict(lm.fit, data.frame(lstat = c(c(5, 10, 15))), interval = "prediction")

plot(lstat, medv, pch = "+")
abline(lm.fit, lwd = 3, col = "red")
par(mfrow = c(2, 2))
plot(lm.fit)

plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))

plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

lm.fit <- lm(medv ~ lstat + age)
summary(lm.fit)

lm.fit <- lm(medv ~ ., data = Boston)
summary(lm.fit)

summary(lm.fit)$r.sq
summary(lm.fit)$sigma

library(car)
vif(lm.fit)

lm.fit1 <- update(lm.fit, ~. -age)
summary(lm.fit1)

summary(lm(medv ~ lstat * age, data = Boston))

lm.fit <- lm(medv ~ lstat)
lm.fit2 <- lm(medv ~ lstat + I(lstat^2))
summary(lm.fit2)
anova(lm.fit, lm.fit2)

par(mfrow = c(2, 2))
plot(lm.fit2)

lm.fit5 <- lm(medv ~ poly(lstat, 5))
summary(lm.fit5)

summary(lm(medv ~ log(rm)))

head(Carseats)

lm.fit <- lm(Sales ~ . + Income:Advertising + Price:Age, data = Carseats)
summary(lm.fit)

attach(Carseats)
contrasts(ShelveLoc)

LoadLibraries <- function() {
    library(ISLR2)
    library(MASS)
    print("The libraries have been loaded.")
}
LoadLibraries()
