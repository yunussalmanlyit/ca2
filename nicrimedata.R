# crime data
# step -01
# reading all the datasets

getwd()
setwd("C:/Users/yunus/Documents/ca2/Crime")
list.files()
list.dirs()

new_files <- list.files(recursive = TRUE)
nicrime <- data.frame()

for (new_files in new_files) {
  datasets <- read.csv(new_files, header = TRUE)
  nicrime <- rbind(nicrime,datasets)
  rm(datasets)
}

write.csv(nicrime, "nicrimedata.csv")

nicrime <- read.csv("nicrimedata.csv")

# showing the number of rows in the dataset
nrow(nicrime)


# step -02

# remove the following attributes from the dataset
nicrime$Crime.ID <- NULL
nicrime
nicrime$Reported.by <- NULL
nicrime
nicrime$Falls.within <- NULL
nicrime
nicrime$LSOA.code <- NULL
nicrime
nicrime$LSOA.name <- NULL
nicrime
nicrime$Last.outcome.category <- NULL
nicrime
nicrime$Context <- NULL
nicrime$X <- NULL

# changing the structure of the crime type

nicrime$Crime.type <- as.character(nicrime$Crime.type)
str(nicrime)


# step -03
# rename the attribute names
nicrime$Crime.type[nicrime$Crime.type == "Anti-social behaviour"] <- "ASBO"
nicrime$Crime.type[nicrime$Crime.type == "Violence and sexual offences"] <- "VISO"
nicrime$Crime.type[nicrime$Crime.type == "Burglary"] <- "BURG"
nicrime$Crime.type[nicrime$Crime.type == "Other theft"] <- "OTTH"
nicrime$Crime.type[nicrime$Crime.type == "Vehicle crime"] <- "VECR"
nicrime$Crime.type[nicrime$Crime.type == "Other crime"] <- "OTCR"
nicrime$Crime.type[nicrime$Crime.type == "Criminal damage and arson"] <- "CDAR"
nicrime$Crime.type[nicrime$Crime.type == "Drugs"] <- "DRUG"
nicrime$Crime.type[nicrime$Crime.type == "Possession of weapons"] <- "POWE"
nicrime$Crime.type[nicrime$Crime.type == "Shoplifting"] <- "SHOP"
nicrime$Crime.type[nicrime$Crime.type == "Bicycle theft"] <- "BITH"
nicrime$Crime.type[nicrime$Crime.type == "Robbery"] <- "ROBY"
nicrime$Crime.type[nicrime$Crime.type == "Theft from the person"] <- "THPR"
nicrime$Crime.type[nicrime$Crime.type == "Public order"] <- "PUBO"

nicrime$Crime.type <- as.factor(nicrime$Crime.type)

# step -04
# plotting the crime type with a bar graph

attach(nicrime)
plot(nicrime$Crime.type,ylim = c(0, 400000), col = rainbow(14), main = "total number of crimes",
     xlab = "type of crime", ylab = "frequency")

colSums(is.na(nicrime))
str(nicrime)

# step -05
# shortening the name by removing "on or near"
nicrime$Location <- gsub("On or near", " ", nicrime$Location)

nicrime$Location[nicrime$Location == "  "] <- NA
nicrime$Location
nicrime <- na.omit(nicrime)

# step -06
# creating a function find_a_town

find_a_town <- function(x)
{
  # setting seed to 100
  set.seed(100)
  
  # picking up the sample 5000 data from the dataset
  random_crime_sample <- nicrime[ sample( which( nicrime$Location != "NA" ) , 5000) , ]
  
   
  # reading the nipost data again which is previouysly cleaned and stored in the folder
  CleanNIPostcodeData <- read.csv("CleanNIPostcodeData.csv")
  
  # making the attribute x to null
  CleanNIPostcodeData$X <- NULL
  write.csv(CleanNIPostcodeData, "CleanNIPostcodeData.csv")
  CleanNIPostcodeData2 <- read.csv("CleanNIPostcodeData.csv")
  
  # omitting the null values but it displays zero
  CleanNIPostcodeData2 <- na.omit(CleanNIPostcodeData2)
  
  # picking up the random 5000 from the cleannipostcode so to match both
  CleanNIPostcodeData1 <- CleanNIPostcodeData[sample(nrow(CleanNIPostcodeData), 5000), ]
  
  
  # using match for the location and primary thorfare attributes in both the datasets
  random_crime_sample$town <- CleanNIPostcodeData$town[match(random_crime_sample$Location,
                                                             CleanNIPostcodeData$primary.thorfare)]
  
  # returning all the value into the random_crime_sample
  return(random_crime_sample)

}

random_crime_sample <- find_a_town()

nrow(random_crime_sample)




