#read a file

data = read.csv("experiment_2012.csv", header = TRUE, sep =";", dec=",")

dim(data)

head(data)

#extract main variables 

main.variables.data<-subset(data, select=c(Warunek,OdpRPplus,OdpRPminus,OdpNRP))

dim(main.variables.data.data)

head(main.variables.data)

summary(main.variables.data)

str(main.variables.data)

#clear a data

clear.main.variables.data <- subset(main.variables.data, OdpRPplus <=1)
clear.main.variables.data$Warunek<-as.factor(clear.main.variables.data$Warunek)

str(clear.main.variables.data)
summary(clear.main.variables.data)    
dim(clear.main.variables.data)

# install ggplot2 

install.packages("ggplot2")
library(ggplot2)


# transform a data (col for row)
require(reshape2)

t.clear.main.variables.data <- melt(clear.main.variables.data, id.var = "Warunek")

head(t.clear.main.variables.data)

# make a chart 

p<-ggplot(data = t.clear.main.variables.data, aes(x=variable, y=value*100)) + 
    geom_boxplot(aes(fill=Warunek)) + xlab("item") + ylab("recall (%)")

p+theme_classic()+scale_fill_brewer(palette="Dark2", name = "condition") + 
  scale_x_discrete(labels=c("Rp+", "Rp-", "Nrp"))

