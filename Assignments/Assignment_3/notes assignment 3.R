
#SETUP ####

##load packages####

library(tidyverse)

#install.packages("tidyverse") # if not already installed 

##load data ####

dat <- read_delim("./Data/DatasaurusDozen.tsv")

unique(dat$dataset)

star <- dat[dat$dataset == "star",]

plot(star$x,star$y)

filter(dat,dataset == "star")
