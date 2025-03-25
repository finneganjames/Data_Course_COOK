library(tidyverse)
library(janitor)


# 1. Read in the UNICEF data


df <- read_csv("Exams/Exam_2/unicef-u5mr.csv")

summary(df)
view(df)

#2 Get it into tidy format 

unicef_tidy <- df %>% 
  clean_names() %>% 
  pivot_longer(cols = starts_with("U5MR"), 
                      names_to = "year", 
                      values_to = "mortality_rate") %>% 
  mutate(year = str_remove(year,"u5mr_")) %>%
  filter(!is.na(mortality_rate))

#3. Plot each country's U5MR over time

ggplot(unicef_tidy, aes(x = year,y = mortality_rate)) + 
  geom_line(aes(x = year, y = mortality_rate, group = country_name), color = "black", ) +
  theme(legend.position = 'none') + scale_x_discrete(breaks = seq(1961,2015, by = 10)) +
  facet_wrap(~continent)


#4. Save this plot as COOK_Plot_1.png 

#5. Create another plot that shows the mean U5MR for all the countries within a given continent at each year
ggplot(unicef_tidy, aes(x = year, y = mortality_rate, color = continent)) +
  geom_line(aes(x = year, y = mortality_rate)) + theme(legend.position = 'none')

#6. Save that plot as COOK_Plot_2.png 

#7. Create 3 models of U5MR (see .html file for details)

#8. Compare the 3 models with respect to their performance


#9. Plot the 3 models' predictions. 

#10.  Using preferred model, predict what the U5MR would be for Ecuador in the year 2020. 