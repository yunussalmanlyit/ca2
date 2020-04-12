# crime data
# step -01
# reading all the datasets
cd1501 <- read.csv("2015-01-northern-ireland-street.csv", header = TRUE)
cd1502 <- read.csv("2015-02-northern-ireland-street.csv", header = TRUE)
cd1503 <- read.csv("2015-03-northern-ireland-street.csv", header = TRUE)
cd1504 <- read.csv("2015-04-northern-ireland-street.csv", header = TRUE)
cd1505 <- read.csv("2015-05-northern-ireland-street.csv", header = TRUE)
cd1506 <- read.csv("2015-06-northern-ireland-street.csv", header = TRUE)
cd1507 <- read.csv("2015-07-northern-ireland-street.csv", header = TRUE)
cd1508 <- read.csv("2015-08-northern-ireland-street.csv", header = TRUE)
cd1509 <- read.csv("2015-09-northern-ireland-street.csv", header = TRUE)
cd1510 <- read.csv("2015-10-northern-ireland-street.csv", header = TRUE)
cd1511 <- read.csv("2015-11-northern-ireland-street.csv", header = TRUE)
cd1512 <- read.csv("2015-12-northern-ireland-street.csv", header = TRUE)
cd1601 <- read.csv("2016-01-northern-ireland-street.csv", header = TRUE)
cd1602 <- read.csv("2016-02-northern-ireland-street.csv", header = TRUE)
cd1603 <- read.csv("2016-03-northern-ireland-street.csv", header = TRUE)
cd1604 <- read.csv("2016-04-northern-ireland-street.csv", header = TRUE)
cd1605 <- read.csv("2016-05-northern-ireland-street.csv", header = TRUE)
cd1606 <- read.csv("2016-06-northern-ireland-street.csv", header = TRUE)
cd1607 <- read.csv("2016-07-northern-ireland-street.csv", header = TRUE)
cd1608 <- read.csv("2016-08-northern-ireland-street.csv", header = TRUE)
cd1609 <- read.csv("2016-09-northern-ireland-street.csv", header = TRUE)
cd1610 <- read.csv("2016-10-northern-ireland-street.csv", header = TRUE)
cd1611 <- read.csv("2016-11-northern-ireland-street.csv", header = TRUE)
cd1612 <- read.csv("2016-12-northern-ireland-street.csv", header = TRUE)
cd1701 <- read.csv("2017-01-northern-ireland-street.csv", header = TRUE)
cd1702 <- read.csv("2017-02-northern-ireland-street.csv", header = TRUE)
cd1703 <- read.csv("2017-03-northern-ireland-street.csv", header = TRUE)
cd1704 <- read.csv("2017-04-northern-ireland-street.csv", header = TRUE)
cd1705 <- read.csv("2017-05-northern-ireland-street.csv", header = TRUE)
cd1706 <- read.csv("2017-06-northern-ireland-street.csv", header = TRUE)
cd1707 <- read.csv("2017-07-northern-ireland-street.csv", header = TRUE)
cd1708 <- read.csv("2017-08-northern-ireland-street.csv", header = TRUE)
cd1709 <- read.csv("2017-09-northern-ireland-street.csv", header = TRUE)
cd1710 <- read.csv("2017-10-northern-ireland-street.csv", header = TRUE)
cd1711 <- read.csv("2017-11-northern-ireland-street.csv", header = TRUE)
cd1712 <- read.csv("2017-12-northern-ireland-street.csv", header = TRUE)

# storing the datasets into the individual year datasets using rbind function
cd2015 <- rbind(cd1501, cd1502, cd1503, cd1504, cd1505, cd1506, cd1507, cd1508,
                cd1509, cd1510, cd1511, cd1512)
cd2015

cd2016 <- rbind(cd1601, cd1602, cd1603, cd1604, cd1605, cd1606, cd1607, cd1608,
                cd1609, cd1610, cd1611, cd1612)
cd2016

cd2017 <- rbind(cd1701, cd1702, cd1703, cd1704, cd1705, cd1706, cd1707, cd1708,
                cd1709, cd1710, cd1711, cd1712)
cd2017

# amalgamate all the datsets in one single datsets

allnicrimedata <- rbind(cd2015, cd2016, cd2017)
write.csv(allnicrimedata, "AllNICrimeData.csv")

# step -02
# remove the following attributes from the dataset
allnicrimedata$Crime.ID <- NULL
allnicrimedata
allnicrimedata$Reported.by <- NULL
allnicrimedata
allnicrimedata$Falls.within <- NULL
allnicrimedata
allnicrimedata$LSOA.code <- NULL
allnicrimedata
allnicrimedata$LSOA.name <- NULL
allnicrimedata
allnicrimedata$Last.outcome.category <- NULL
allnicrimedata
allnicrimedata$Context <- NULL
allnicrimedata

#structure of the new modified file

str(allnicrimedata)

allnicrimedata$Crime.type <- as.character(allnicrimedata$Crime.type)
str(allnicrimedata)


library(dplyr)

# step -03
# rename the attribute names
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Anti-social behaviour"] <- "ASBO"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Violence and sexual offences"] <- "VISO"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Burglary"] <- "BURG"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Other theft"] <- "OTTH"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Vehicle crime"] <- "VECR"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Other crime"] <- "OTCR"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Criminal damage and arson"] <- "CDAR"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Drugs"] <- "DRUG"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Possession of weapons"] <- "POWE"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Shoplifting"] <- "SHOP"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Bicycle theft"] <- "BITH"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Robbery"] <- "ROBY"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Theft from the person"] <- "THPR"
allnicrimedata$Crime.type[allnicrimedata$Crime.type == "Public order"] <- "PUBO"


str(allnicrimedata$Crime.type)




allnicrimedata$Crime.type <- as.factor(allnicrimedata$Crime.type)
# step -04
# plotting the crime type
plot(allnicrimedata$Crime.type, xlab = "crime", ylab = "type")

plot(allnicrimedata$Crime.type, type = "o", col = "vibgyor")


attach(allnicrimedata)
plot(allnicrimedata$Crime.type, ylim = c(0,400000), col = rainbow(14), main = 
       "total number of crimes", xlab = "crime type", ylab = " frequency of crime")

colSums(is.na(allnicrimedata))
str(allnicrimedata)

# step -05
# shortening the name by removing "on or near"
allnicrimedata$Location <- gsub("On", " ", allnicrimedata$Location)

allnicrimedata$Location <- gsub("or", " ", allnicrimedata$Location)

allnicrimedata$Location <- gsub("near", " ", allnicrimedata$Location)

# step -06
# picking the 5000 random values

allnicrimedata[allnicrimedata=="  "] <- NA 
allnicrimedata





