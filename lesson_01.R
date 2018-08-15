setwd("~/wentworth/machine-learning/chapter_1")
data2 <- read.csv(file='datalivingspace.csv')
x = data2$x
y = data2$y
sx = summary(x)
sy = summary(y)

hist(x, breaks=5)
hist(y, breaks=5)

xRange = range(x)
xMin = xRange[1]
xMax = xRange[2]
breaks = seq(xMin, xMax, by=100) 

living.cut = cut(x, breaks, right=F)
living.freq = table(living.cut)

print(living.freq)
plot(living.freq, main="Living Space", xlab="Living Space", ylab="Frequency")
regresion1 = lm(data = data2, y ~ x)
regresionSummary = summary(regresion1)
print(regresionSummary)
plot(data=data2, y ~ x, xlab="Living Space", ylab="Price", main="Living Space vs Price")
