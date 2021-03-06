## Script: plot.R
##
## This script creates plot #3 in the Course Project 1 of the course Exploratory Data Analysis
##
## Author: Bruno Ascenso
## Date: 12.Sep.2018


## Read and subset the data
power <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
power$timestamp <- strptime(paste(power$Date, power$Time, sep=";"), "%d/%m/%Y;%H:%M:%S")
powerSub <- subset(power, timestamp >= "2007-02-01 00:00:00" & timestamp <= "2007-02-02 23:59:59")

## Create plot #3
png(file = "plot3.png")

with (powerSub, {
    plot(timestamp, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
    lines(timestamp, Sub_metering_1)
    lines(timestamp, Sub_metering_2, col = "red")
    lines(timestamp, Sub_metering_3, col = "blue")
    legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()


## Clean up
rm (power)
rm (powerSub)