getwd()
?list.files()
list.files(path = "Data", pattern = ".csv", all.files = TRUE, all.files = TRUE,
           full.names = TRUE, recursive = TRUE, ignore.case = TRUE) 
#file.exists("Data/wide_income_rent.csv")


csv_files <- list.files(path = "Data") 

class(csv_files)
length(csv_files)

#first 10 csv files
csv_files[1:10]
csv_files[c(1,3,5)] #concatenate/combine
1:100
c(1:50,53,55,57)

c("your","mom")


?head(csv_files,10)
head(n=10, x=csv_files)


bird <- list.files(recursive = TRUE, pattern = "cleaned_bird_data.csv", full.names = TRUE)

file.copy(bird,".")

dat <- read.csv(bird)
class(dat)
dim(dat)

#rows 1, 3, and 5 of dat: 
dat[c(1,3,5), ]
dat[,"Egg_mass"]
#same procedure just faster
dat$Egg_mass

keepers <- dat$Egg_mass > 10 


#subset where egg mass is greater than 10 and is not NA

big_egg_mamas <- dat[dat$Egg_mass > 10 & !is.na(dat$Egg_mass),]
plot(big_egg_mamas$Egg_mass)



summary(dat$mass)
summary(dat$tarsus)

bigmassbuddies <- 
dat$mass > median(dat$mass,na.rm = TRUE) &
dat$tarsus > median(dat$tarsus, na.rm = TRUE)

dat[bigmassbuddies,]

file.remove("./cleaned_bird_data.csv")
