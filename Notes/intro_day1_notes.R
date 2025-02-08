grades <- "./Data/Fake_grade_data.csv"
grades
read.csv(grades)
dat <- read.csv(grades)
dat[,16]

#final project scores
dat[,16]
mean(dat)[,16]
mean(dat[,16])

mean(dat$Final_Project)
round(mean(dat$Final_Project))


test_totals <- dat$Skills_Test_1+dat$Skills_Test_2+dat$Skills_Test_3+dat$Skills_Test_4
dat$Test_Totals <- test_totals
plot(dat$Test_Totals,dat$Final_Project)
mod <-  lm(dat$Final_Project ~ dat$Test_Totals)
summary(mod)
dat$predictions <-  predict(mod,dat)
plot(dat$difference)


names(dat)
dat[,2:11]
dat$assignment_sums <- rowSums(dat[,2:11])


plot(x=dat$assignment_sums, y=dat$Test_Totals)




#which student has lowest assignment total

loser <- dat[which(dat$assignment_sums == min(dat$assignment_sums)),1]

