################################################################
#####                                                      #####
#####   Create Assignment's plot2: plot of Global Active   #####
#####   Power as a funciton of time of day over dow        #####
#####                                                      #####
################################################################

#point the working directory to the repo 
workdir <- "C:/Users/John Lancaster/Desktop/Coursera/Exploratory Analysis/Week 1 Assignment/repo"
setwd(workdir)

#load libraries of useful R functions
library(dplyr)
library(date)
library(lubridate)

#get the clasData amd subset
infile <- "household_power_consumption.txt"
classData <- read.table(infile, header = T, sep = ";")
classData <- mutate(classData, numDate = as.Date(Date,"%d/%m/%Y"), powerInKilowatts = as.numeric(Global_active_power) / 1000, dow = format(numDate, "%a"))
classData <- subset(classData, numDate == as.Date("2007-02-01", "%Y-%m-%d") | numDate == as.Date("2007-02-02", "%Y-%m-%d"))

#extract classData$Date and classData$Time into atomic datetime units
xYear <- year(as.Date(classData$Date, "%d/%m/%Y"))
xMonth <- month(as.Date(classData$Date, "%d/%m/%Y"))
xDay <- day(as.Date(classData$Date, "%d/%m/%Y"))
xHour <- floor(as.numeric(classData$Time)/60)
xMinute <- as.numeric(classData$Time) - xHour * 60

#create plot2 on the screen for validation
#add active power in kilowatt& datetime to classData
classData <- mutate(classData, datetime = ISOdatetime(xYear, xMonth, xDay, xHour, xMinute, 0))

#create plot2 on the screen for validation
with(classData, plot(datetime, powerInKilowatts, type = "l", main = "Global Active Power", ylab = "Global Active Power (in kilowatts)"))

#open png graphic device
png(filename = "plot2.png", width = 480, height = 480)

#repeat plot
with(classData, plot(datetime, powerInKilowatts, type = "l", main = "Global Active Power", ylab = "Global Active Power (in kilowatts)"))

#close png device
dev.off()