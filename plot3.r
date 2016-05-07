################################################################
#####                                                      #####
#####   Create Assignment's plot3: plot of Sub-metering    #####
#####    as a funciton of time of day                      #####
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
classData <- mutate(classData, numDate = as.Date(Date,"%d/%m/%Y"))
classData <- subset(classData, numDate == as.Date("2007-02-01", "%Y-%m-%d") | numDate == as.Date("2007-02-02", "%Y-%m-%d"))

#extract classData$Date and classData$Time into atomic datetime units
xYear <- year(as.Date(classData$Date, "%d/%m/%Y"))
xMonth <- month(as.Date(classData$Date, "%d/%m/%Y"))
xDay <- day(as.Date(classData$Date, "%d/%m/%Y"))
xHour <- floor(as.numeric(classData$Time)/60)
xMinute <- as.numeric(classData$Time) - xHour * 60

#add active power in kilowatt& datetime to classData
classData <- mutate(classData, datetime = ISOdatetime(xYear, xMonth, xDay, xHour, xMinute, 0))

#create plot3 on the screen for validation
#create overlaid plots of sub_metering 1, 2, & 3 vs datetime on screen
with(classData, plot(datetime, as.numeric(Sub_metering_1) - 2, type = "l", ylim = c(0, 40), ylab = "Energy sub metering"))
par(new = TRUE)
with(classData, plot(datetime, as.numeric(Sub_metering_2) / 10 - .4, type = "l", ylim = c(0, 40), col = "red", ylab = "Energy sub metering"))
par(new = TRUE)
with(classData, plot(datetime, as.numeric(Sub_metering_3) , type = "l", ylim = c(0, 40), col = "blue", ylab = "Energy sub metering"))
par(new=TRUE)
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))

#open png graphic device 
png(filename = "plot3.png", width = 480, height = 480)

#create overlaid plots of sub_metering 1, 2, & 3 vs datetime for plot3.png
with(classData, plot(datetime, as.numeric(Sub_metering_1) - 2, type = "l", ylim = c(0, 40), ylab = "Energy sub metering"))
par(new = TRUE)
with(classData, plot(datetime, as.numeric(Sub_metering_2) / 10 - .4, type = "l", ylim = c(0, 40), col = "red", ylab = "Energy sub metering"))
par(new = TRUE)
with(classData, plot(datetime, as.numeric(Sub_metering_3) , type = "l", ylim = c(0, 40), col = "blue", ylab = "Energy sub metering"))
par(new=TRUE)
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))

#close png device
dev.off()