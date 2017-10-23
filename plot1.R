## Script for the Exploring data course assignment to generate plot1

## Read the data

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Convert Date and Time columns to classes

hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

## Select only entries with dates 2007-02-01 and 2007-02-02

hpcs <- subset(hpc, Date==as.Date("2007-02-01")| Date==as.Date("2007-02-02"))

## Set plotting device

png("plot1.png")

## Generate plot

hist(hpcs$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

## Close plotting device

dev.off()
