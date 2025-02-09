#exam 1 steps 

library(tidyverse)

df <- read_csv("../../cleaned_covid_data.csv")

A_states <- subset(df, grepl('a', ignore.case = TRUE, Province_State))

ggplot(data = A_states, mapping = aes(x = Last_Update,
                               y = Deaths)) + 
  geom_point()+ 
  facet_wrap(~Province_State) + 
  geom_smooth(se = FALSE)

state_max_fatality_rate <- df %>%
   select(Case_Fatality_Ratio, Province_State)
 
 # need to triple check this one 
 
order(state_max_fatality_rate$Case_Fatality_Ratio, na.last = TRUE, decreasing = TRUE)


ggplot(data = state_max_fatality_rate, mapping = aes(x = reorder(Province_State, Case_Fatality_Ratio, desc = TRUE), 
                                                     y = Case_Fatality_Ratio)) +
  geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 45))

