getwd()

# lists all of the .csv files found in the Data/directory 

csv_files <-  list.files(path = "Data")

# how many files match that description? 
length(csv_files)


file.exists("C:/Users/finnc/Desktop/Data_Course_COOK/Data/wingspan_vs_mass.csv")

setwd("C:/Users/finnc/Desktop/Data_Course_Cook/Data")

df <- read.csv("wingspan_vs_mass.csv")

head(df, n = 5)
