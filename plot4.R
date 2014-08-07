## source the common data loading R code

source(file="LoadProcessedData.R")

## Using png function create the file#

png(filename="plot4.png", width=480, height=480)

## Set the device's structure to be 2 columns and 2 rows

par(mfcol=c(2,2))

## Create the plotes

plot(processed$DateTime, 
     processed$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")

plot(processed$DateTime, 
     processed$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")
lines(processed$DateTime, processed$Sub_metering_2, col="red")
lines(processed$DateTime, processed$Sub_metering_3, col="blue")
legend("topright", 
       lwd=1, 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(processed$DateTime, 
     processed$Voltage, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Voltage", 
     main="")

plot(processed$DateTime, 
     processed$Global_reactive_power, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Global_reactive_power", 
     main="")

## Flush or write the data into the file

dev.off()

## delete no longer needed data from environment

rm(list="processed")