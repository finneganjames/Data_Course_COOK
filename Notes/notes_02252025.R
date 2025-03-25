library(tidyverse)
library(janitor)
library(readxl) 
dat <-read_csv("./Data/Utah_Religions_by_County.csv")

# just to show that csv and excel files are possible 
read_xlsx("./Data/Utah_Religions_by_County.csv", range = "B2:E4", 
          col_names = FALSE)

# think in terms of what do you want the plot to look like 

myorder %>%
dat %>% 
  clean_names() %>%
  pivot_longer (-c(county, Pop_2010, religious),
               names_to = "religion", 
               values_to = "proportion" ) %>%
  group_by(religion) %>% 
        summarise(sum = sum(proportion)) %>%
  arrange(desc(sum))



myorder$religion 

dat %>% 
  clean_names() %>%
  pivot_longer (-c(county, Pop_2010, religious),
                names_to = "religion", 
                values_to = "proportion" ) %>%
  mutate(religion = factor(religion, levels = myorder$religion))

ggplot(aes(x=religion, y = proportion)) + 
  goem_col + 
  facet_wrap (~county)