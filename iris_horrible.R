library(tidyverse)
library(ggimage)
library(ggplot2)


df <- iris 
img = "https://i.pinimg.com/736x/77/aa/21/77aa2192ee76059b4c8abf3291ee76d2.jpg"

cross_stitch <- ggplot(data = df) +
  aes(x=Petal.Width) +
  aes(y=Petal.Length) +
  geom_point(size = 3, shape = 4, stroke = 2) +
  aes(color=Species) + 
  scale_color_manual(values = c())
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank()
  )  

ggbackground(cross_stitch, img)

