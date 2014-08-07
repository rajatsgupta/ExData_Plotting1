## source the common data loading R code

source(file="LoadProcessedData.R")

## Using png function create the file

png(filename="plot2.png", width=480, height=480)

## Create the plot

plot(x=processed$DateTime,
     y= processed$Global_active_power, 
      type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")

## Flush or write the data into the file

dev.off()

## delete no longer needed data from environment

rm(list="processed")