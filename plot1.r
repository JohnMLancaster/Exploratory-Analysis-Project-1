################################################################
#####                                                      #####
#####   Create Assignment's plot1: histogram of Global     #####
#####   Active Power                                       #####
#####                                                      #####
################################################################

#point the working directory to the repo 
workdir <- "C:/Users/John Lancaster/Desktop/Coursera/Exploratory Analysis/Week 1 Assignment/repo"
setwd(workdir)

#load libraries of useful R functions
library(dplyr)

#get the clasData amd subset
infile <- "household_power_consumption.txt"
classData <- read.table(infile, header = T, sep = ";")
classData <- mutate(classData, numDate = as.Date(Date,"%d/%m/%Y"))
classData <- subset(classData, numDate == as.Date("2007-02-01", "%Y-%m-%d") | numDate == as.Date("2007-02-02", "%Y-%m-%d"))

#translate global active power to kilowatts
powerInKilowatts <- as.numeric(classData$Global_active_power) / 1000

#create histogram on screen for validation
hist(powerInKilowatts, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#open png graphic device
png(filename = "plot1.png", )

#repeat histogram
hist(powerInKilowatts, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#close png device
dev.off()