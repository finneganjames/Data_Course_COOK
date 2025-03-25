library(tidyverse)
install.packages("skimr")
library(skimr)
dat <-read_csv("./Data/Bird_Measurements.csv") %>% clean_names()
skim(dat)
install.packages("janitor")
library(janitor)
#what's wrong 
# - some columns have multiple variables in them 
# need a column for sex 
# get rid of _N columns 
# extra dumb columns like species number and mating system 


# split into m,f,u dfs 
# pivot longer 
#clean up names 
# merge back together 


dat2 <- 
  dat %>% 
  clean_names()
names(dat)
names(dat2)

male <- 
  dat%>%
  select(-ends_with("_n")) %>%
  select(starts_with("m"), family, species_name, english_name, clutch_size,egg_mass, mating_system) %>%
mutate(sex = "male")
names(male) <-  names(male) %>% str_remove("^m_")


female <-
  dat %>%
  select(-ends_with("_n")) %>%
  select(starts_with("m"), family, species_name, english_name, clutch_size,egg_mass, mating_system) %>%
  mutate(sex = "female")
names(female) <-  names(female) %>% str_remove("^f_")

unsexed <- 
  dat %>% 
  select(-ends_with("_n")) %>%
  select(starts_with("unsexed_"), family, species_name, english_name, clutch_size,egg_mass, mating_system) %>%
  mutate(sex = "unsexed") 
names(unsexed <-  names(unsexed) %>% str_remove("^unsexed_")

      
      
names(iris) %>%
  make_clean_names()

male %>% 
  full_join(female) %>%
  full_join(unsexed)

dat %>% 
  ggplot(aes(x = tarsus, y = mass, color = sex)) + 
  geom_point()+ 
  geom_smooth()
