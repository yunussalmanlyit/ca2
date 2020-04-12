# step-01
# reading the dataset into the dataframe "npc"

npc <- read.csv("NIPostcodes.csv", header = FALSE) 

# structure of the dataframe
str(npc)

# rows of the data
nrow(npc)

#class of the dataset
class(npc)

# top 10 rows of the dataset
head(npc, 10)
 
# step -02
# adding the titles to the attributes

names(npc)[1] <- "organisation name"
names(npc)[2] <- "sub-building name"
names(npc)[3] <- "building name"
names(npc)[4] <- "number"
names(npc)[5] <- "primary thorfare"
names(npc)[6] <- "alt thorfare"
names(npc)[7] <- "secondary thorfare"
names(npc)[8] <- "locality"
names(npc)[9] <- "townland"
names(npc)[10] <- "town"  
names(npc)[11] <- "county"
names(npc)[12] <- "postcode"
names(npc)[13] <- "x-coordinates"
names(npc)[14] <- "y-coordinates"
names(npc)[15] <- "identifier"



# step -03

# fillimg the empty cells with "NA"

npc[npc==""] <- NA


# installing the packages for graphical representation of the missing values

install.packages("mice")
library("mice")
md.pattern(npc)
install.packages("VIM")
library(VIM)
totalmissing_values <- aggr(npc,prop = FALSE, numbers = TRUE)

# step -04
# finding the missing values
table(is.na(npc))
sum(is.na(npc$`organisation name`))


# step - 05 
# reassign the primary identifier to start of the dataset

npc <- npc[,c(15, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)]
npc
# install the tidyverse package

install.packages("tidyverse")
library("tidyverse")


# count the town name in columns

library("plyr")

sum(npc$town)

summary(npc$town == "LIMAVADY")

# step -06
# creating new dataframe where we store town = limavady and then locality and townland.

limavady <- subset(npc, npc$town == "LIMAVADY", select = c(town, townland, locality))
nrow(limavady)

# convert limavady dataframe into a csv file

write.csv(limavady,'C:/Users/yunus/Documents/ca2/limavady.csv')


# step -07 
# save the csv file with the name cleannipostcode
 
write.csv(npc, "CleanNIPostcodeData.csv")



