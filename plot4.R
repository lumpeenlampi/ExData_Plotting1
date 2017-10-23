## Script for the Exploring data course assignment to generate plot4

## Read the data

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Convert Date and Time columns to classes

hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

## Select only entries with dates 2007-02-01 and 2007-02-02

hpcs <- subset(hpc, Date==as.Date("2007-02-01")| Date==as.Date("2007-02-02"))

## Set plotting device

png("plot4.png")

## Set plotting parameters to create 2x2 plots

par(mfrow=c(2, 2))

## Generate plots

## plot 1

with(hpcs, plot(Time, Global_active_power, type="l", xlab="", ylab = "Global Active Power"))

## plot 2

with(hpcs, plot(Time, Voltage, type="l", xlab="datetime"))

## plot 3

with(hpcs, plot(Time, Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering"))
with(hpcs, lines(Time, Sub_metering_1))
with(hpcs, lines(Time, Sub_metering_2, col="red"))
with(hpcs, lines(Time, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1, 1, 1), bty="n")

## plot 4

with(hpcs, plot(Time, Global_reactive_power, type="l", xlab="datetime"))

## Close plotting devic

dev.off()
