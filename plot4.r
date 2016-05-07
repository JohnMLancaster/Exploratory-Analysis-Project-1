################################################################
#####                                                      #####
#####   Create Assignment's plot4: 4 panel plot of         #####
#####    1) global active power vs datetime, 2) voltage vs #####
#####    datetime, 3) sub metering vs dataetime and        #####
#####    4) global reactive power vs datetime              #####   
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
classData <- mutate(classData, numDate = as.Date(Date,"%d/%m/%Y"), powerInKilowatts = as.numeric(Global_active_power) / 1000)
classData <- subset(classData, numDate == as.Date("2007-02-01", "%Y-%m-%d") | numDate == as.Date("2007-02-02", "%Y-%m-%d"))

#extract classData$Date and classData$Time into atomic datetime units
xYear <- year(as.Date(classData$Date, "%d/%m/%Y"))
xMonth <- month(as.Date(classData$Date, "%d/%m/%Y"))
xDay <- day(as.Date(classData$Date, "%d/%m/%Y"))
xHour <- floor(as.numeric(classData$Time)/60)
xMinute <- as.numeric(classData$Time) - xHour * 60

#add active power in kilowatt & datetime to classData
classData <- mutate(classData, datetime = ISOdatetime(xYear, xMonth, xDay, xHour, xMinute, 0))

#create panel plot on screen
par(mfrow = c(2,2), mar = c(4, 4.5, 2, 2))

#create plot4 on the screen for validation
with(classData,
			{plot(datetime, powerInKilowatts, type = "l", ylab = "Global Active Power")
			 plot(datetime, as.numeric(Voltage) / 5, type = "l", ylab = "Voltage")
             plot(datetime, as.numeric(Sub_metering_1) - 2, type = "l", ylim = c(0, 40), ylab = "Energy sub metering")
             par(new = TRUE)
			 plot(datetime, as.numeric(Sub_metering_2) / 10 - .4, type = "l", ylim = c(0, 40), col = "red", ylab = "Energy sub metering")
			 par(new = TRUE)
			 plot(datetime, as.numeric(Sub_metering_3) , type = "l", ylim = c(0, 40), col = "blue", ylab = "Energy sub metering")
			 par(new=TRUE)
			 legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), cex = 0.5)
			 plot(datetime, as.numeric(Global_reactive_power) / 500, type = "l", ylab = "Global Reactive Power")
			 }
	)

#copy to png graphic device
dev.copy(png, file = "plot4.png")
dev.off()