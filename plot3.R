## source the common data loading R code

source(file="LoadProcessedData.R")

## Using png function create the file

png(filename="plot3.png", width=480, height=480)

## Create the plot

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

## Flush or write the data into the file

dev.off()

## delete no longer needed data from environment

rm(list="processed")