library(tidyverse)
install.packages("easystats")
library(easystats)
library(palmerpenguins)

#model penguins 
#response = "sex" 

dat <-  
  penguins %>% 
  dplyr:: filter(!is.na(sex)) %>% 
  #mutate(male = sex =="male")
  mutate(male = case_when(sex == "male" ~ TRUE, TRUE ~ FALSE))


mod1 <- 
  glm(data = dat %>%select(-sex),
      formula = male ~ .,
      family = 'binomial') 

summary(mod1)




dat <- 
  dat %>% 
  mutate(pred = predict(mod1, dat, type = "response"))


dat %>% 
  ggplot(aes( x = body_mass_g, y = pred, color = sex)) + geom_point()

dat <- 
dat %>% 
  mutate(error = pred > .5) %>% 
  mutate(success = male == error) 


dat$success %>%  summary


x <- read_csv("./Data/GradSchool_Admissions.csv")


mod2 <-  
  x %>% 
  glm(data = x ,
      formula = admit ~ (gre + gpa) * rank,
      family = 'binomial') 

summary(grad1)

x %>% 
  mutate(pred = predict(grad1, x, type = 'response')) %>% 
  ggplot(aes(x = gre, y = pred, color = factor(rank))) + 
  geom_point() + 
  geom_smooth() + 
  theme_dark()



# vip and ranger packages machine learning 
#permutation