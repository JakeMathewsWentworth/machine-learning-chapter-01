# Load library and data
library(tidyverse)
setwd("~/wentworth/machine-learning/chapter_1")
insect = read.csv("insects.csv")

# Map categories to numbers. g -> 1 and k -> 2
# insectData$c = map(insectData$c, function(category) {
#   category == 'g' ? return(1) : return(2)
# })

cc = insect$c
length <- length(cc)

for (i in 1:length) {
  if (cc[i] == 'g') {
    cc[i] = 1
  } else {
    cc[i] = 2
  }
}
warnings()


x = insect$x
y = insect$y

dataint <- data.frame(cc, x, y)

dataint$cc = as.factor(ifelse(dataint$c == 1, "g", "k"))
insect.scale <- data.frame(scale(dataint[,-1]))
insect.melt <- gather(insect.scale, key = "cc")
colnames(insect.melt) <- c("type", "variable", "value") 

ggplot(data=insect.melt, aes(x = type, y = value)) + 
  geom_boxplot() + facet_wrap(~ variable, ncol = 2) +
  theme_bw() +
  xlab("Label") +
  ggtitle("Title")
ggsave("allboxplots.pdf")

d <- dataint
d_bg <- d[,-1]
ggplot(d, aes(x = x, fill=cc))
 
# Should show 4 boxplots
 
library(scatterplot3d)
data("iris")
print(iris)
color <- c("blue", "brown1")
color <- color[as.numeric(iris$Species)]
scatterplot3d(iris[,1:3], pch = 16,color = color)
dev.off()
