## Script: plot.R
##
## This script creates plot #2 in the Course Project 1 of the course Exploratory Data Analysis
##
## Author: Bruno Ascenso
## Date: 12.Sep.2018


## Read and subset the data
power <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
power$timestamp <- strptime(paste(power$Date, power$Time, sep=";"), "%d/%m/%Y;%H:%M:%S")
powerSub <- subset(power, timestamp >= "2007-02-01 00:00:00" & timestamp <= "2007-02-02 23:59:59")

## Create plot #2
png(file = "plot2.png")
with(powerSub, { 
    plot(timestamp, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
    lines(timestamp, Global_active_power)
})

dev.off()


## Clean up
rm (power)
rm (powerSub)