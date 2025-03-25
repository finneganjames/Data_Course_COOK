library(tidyverse) 
library(modelr)
library(GGally) 
library(skimr) 
library(patchwork) 
library(caret)

#notes following along with video data class intro to linear models week 9 

data("mtcars")
data("iris")

mtcars %>%  ggpairs()
iris %>% filter(Species == "setosa") %>%  ggpairs() 
iris %>%  ggpairs(mapping = c("Species", "Sepal.Length"))


mod1 <-  lm(data = iris, formula = Sepal.Length ~ Sepal.Width)
mod2 <-  lm(data =iris, formula = Sepal.Length ~ Sepal.Width + Species)
mod3 <-  lm(data = iris, formula = Sepal.Length ~ Sepal.Width * Species)


summary(mod1) 
summary(mod2) 
summary(mod3) 

