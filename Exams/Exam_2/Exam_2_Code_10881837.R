library(tidyverse)
library(janitor)
#library(GGally)
#library(ggplot2)
library(lindia)


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
  geom_line(aes(x = year, y = mortality_rate, group = country_name), color = "black" ) +
  theme(legend.position = 'none') + scale_x_discrete(breaks = seq(1961,2015, by = 10)) +
  facet_wrap(~continent)


#4. Save this plot as COOK_Plot_1.png 


#5. Create another plot that shows the mean U5MR for all the countries within a given continent at each year
unicef_means <- unicef_tidy %>% group_by(continent, year) %>%  
  summarize(mean_mortality = mean(mortality_rate))

ggplot(unicef_means, aes(x = year, y = mean_mortality, color = continent)) +
  theme_minimal() +
  geom_line(aes(x = year, y = mean_mortality, group = continent), linewidth = 2) +  
  scale_x_discrete(breaks = seq(1961, 2015, by = 10)) + 
  labs (x = "Year", y = "Mean U5MR")

#6. Save that plot as COOK_Plot_2.png 


#7. Create 3 models of U5MR (see .html file for details)

#unicef_tidy %>% ggpairs()

mod1 <-  lm(data = unicef_tidy, formula = mortality_rate ~ year)
mod2 <-  lm(data = unicef_tidy, formula = mortality_rate ~ year + continent)
mod3 <-  lm(data = unicef_tidy, formula = mortality_rate ~ year * continent)


#8. Compare the 3 models with respect to their performance
gg_diagnose(mod1)
gg_diagnose(mod2)
gg_diagnose(mod3)

anova(mod1, mod2)
anova(mod1, mod3)
anova(mod2, mod3)

summary(mod1)
summary(mod2)
summary(mod3)

mod1mse <-  mean(residuals(mod1)^2)
mod2mse <-  mean(residuals(mod2)^2)
mod3mse <-  mean(residuals(mod3)^2)

mod1mse; mod2mse; mod3mse
df_mod1 <- add_predictions(unicef_tidy, mod1)
df_mod2 <- add_predictions(unicef_tidy, mod2)
df_mod3 <- add_predictions(unicef_tidy, mod3)
view(df_mod1)
view(df_mod2)
view(df_mod3)

df <- gather_predictions(unicef_tidy, mod1,mod2,mod3)
df

#Model I think is best - model 3 has more variability and considers (given continent interaction term) the fact that different 
#continents are likely to have uneven patterns of infant/child mortality over time, given access (or lack thereof)
#to different resources

#9. Plot the 3 models' predictions. 
ggplot(df, aes(x =  year, y = pred, color = continent)) + 
  geom_line(aes(y =pred, group = continent), linewidth = 1.5) + facet_wrap(~model) + 
  scale_x_discrete(breaks = seq(1961, 2015, by = 10)) + 
  labs (x = "Year", y = "Predicted U5MR") + theme_minimal() 


#10.  Using preferred model, predict what the U5MR would be for Ecuador in the year 2020. 