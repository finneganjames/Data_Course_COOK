#exam 1 steps 

library(tidyverse)

df <- read_csv("Exams/Exam_1/cleaned_covid_data.csv")

A_states <- subset(df, grepl('a', ignore.case = TRUE, Province_State))

ggplot(data = A_states, mapping = aes(x = Last_Update,
                               y = Deaths)) + 
  geom_point()+ 
  facet_wrap(~Province_State, scales = "free") + 
  geom_smooth(method = "loess", se = FALSE)


state_max_fatality_rate <- df %>%
   select(Case_Fatality_Ratio, Province_State)


order(state_max_fatality_rate$Case_Fatality_Ratio, decreasing = TRUE)


ggplot(data = state_max_fatality_rate, mapping = aes(x = reorder(Province_State, Case_Fatality_Ratio, desc = TRUE), 
                                                     y = Case_Fatality_Ratio)) +
  geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 45))

