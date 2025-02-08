getwd()

# lists all of the .csv files found in the Data/directory 

csv_files <-  list.files(path = "Data")

# how many files match that description? 
length(csv_files)


file.exists("C:/Users/finnc/Desktop/Data_Course_COOK/Data/wingspan_vs_mass.csv")

setwd("C:/Users/finnc/Desktop/Data_Course_Cook/Data")

df <- read.csv("wingspan_vs_mass.csv")

#inspect the first 5 lines of this dataset
head(df, n = 5)

#find any files that begin with the letter b 
list.files(path="C:/Users/finnc/Desktop/Data_Course_Cook/Data", pattern = "^b", recursive = TRUE, ignore.case = FALSE )

b_file <- list.files(path="C:/Users/finnc/Desktop/Data_Course_Cook/Data", pattern = "^b", recursive = TRUE, ignore.case = FALSE )

for (file in b_file)
{ first_line <- read.csv(file, nrows = 1 )
  print(paste(file))
  print(first_line)
}
