# take a file

mydata<-read.csv("experiment_2012.csv", sep =";", dec=",")

# cleaning variables

mydata$plec[mydata$plec>2] <- NA

# creating crosstab

table(mydata$Warunek, mydata$plec)

# recode gender

mydata$plec[mydata$plec==1]<-"f"
mydata$plec[mydata$plec==2]<-"m"

condi.gender.table <- table(mydata$Warunek, mydata$plec)

condi.gender.table

# numbers in row 

margin.table(condi.gender.table,1)

# numbers in columns

margin.table(condi.gender.table,2)

# show proportion

prop.table(round(condi.gender.table,2))

round(prop.table(condi.gender.table),2)


# Chi-squared test for row, columns and all condition

chisq.test(margin.table(condi.gender.table, 1))

chisq.test(margin.table(condi.gender.table, 2))

chisq.test(condi.gender.table)
