### DATABOOK for Class Project Assignment 1 of Exploratory Analysis Coursera Coursera

Dataset: 		Electric power consumption [20Mb]  stored locally in the repo as  household_power_consumption,txt
                This file is ; delimited and contains 2,075,260 records.
Description: 	Measurements of electric power consumption in one household with a one-minute 
                sampling rate over a period of almost 4 years. Different electrical quantities 
				and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
1.Date: Date in format dd/mm/yyyy
2.Time: time in format hh:mm:ss
3.Global_active_power: household global minute-averaged active power (in kilowatt)
4.Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
5.Voltage: minute-averaged voltage (in volt)
6.Global_intensity: household global minute-averaged current intensity (in ampere)
7.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9.Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

The following variables will be added to the dataset:
10. numDate: Date transformed into date format for use in filtering the dataset
11. datetime: concatenation of Date and Time into a datetime format for plotting
12. powerInKilowatts: Global_active_power transformed into a numeric and divided by 1,000 to get power expressed in kilowatts