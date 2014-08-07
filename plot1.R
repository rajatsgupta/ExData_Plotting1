## source the common data loading R code

source(file="LoadProcessedData.R")

## Using png function create the file

png(filename="plot1.png", width=480, height=480)

## Create the histogram

hist(processed$Global_active_power, 
     col="#ff2500", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

## Flush or write the data into the file

dev.off()

## delete no longer needed data from environment
rm(list="processed")