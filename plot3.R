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
data$datetime <- as.POSIXct(data$datetime)

#Create plot
plot(data$Sub_metering_1~data$datetime,
                type="l",
                ylab="Energy sub metering",
                xlab="")
     lines(data$Sub_metering_2~data$datetime,
           type="l",
           col="red")
     lines(data$Sub_metering_3~data$datetime,
           type="l",
           col="blue")
                legend("topright", 
                       lty=1,
                       col=c("black","red","blue"),
                       legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3")
                       )
                
#Export plot to .png file plot3.png
dev.copy(png, file="plot3.png")
dev.off()