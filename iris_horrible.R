library(tidyverse)
library(ggimage)
library(ggplot2)
library(jpeg)

df <- iris 
img = "https://i.pinimg.com/736x/77/aa/21/77aa2192ee76059b4c8abf3291ee76d2.jpg"

cross_stitch <- ggplot(df, aes(x=Petal.Width, y=Petal.Length, color = Species)) +
  geom_point(size = 3, shape = 4, stroke = 2) +
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank()) + scale_color_manual(values = c("setosa" = "darkorange",
                                    "veriscolor" = "darkorange", 
                                    "virginica" = "darkred"))

ggbackground(cross_stitch, img)

