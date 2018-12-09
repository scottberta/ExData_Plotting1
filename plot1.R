# plot1.R
library(dplyr)

#Read data
data <- read.csv("./data/household_power_consumption.txt", sep=";", header=T, check.names=FALSE, stringsAsFactors = FALSE, na.strings="?")

#Format data field
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset for data over 2 day period 2007/02/01 and 2007/02/02
data <- subset(data, subset=(Date>="2007-02-01" & Date<="2007-02-02"))

#Convert date and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#Create plot
hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

#Export plot to .png file plot1.png
dev.copy(png, file="plot1.png")
dev.off()