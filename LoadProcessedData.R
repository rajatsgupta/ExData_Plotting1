## Download the dataset once, if not already available

if (!file.exists("ElectricPowerConsumption.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="ElectricPowerConsumption.zip")
  unzip("ElectricPowerConsumption.zip")  
}

## using readlines function, read all the data as a character vector into R 

file <- readLines("household_power_consumption.txt")

## identify the indexes where the date matches 1/2/2007 or 2/2/2007

fileIndexes <- grep(pattern="^[1|2][/][2][/][2][0][0][7][;]", file)

##subset the datset to filter along the 2 dates mentioned above

file <- file[fileIndexes]

## Get a text connection to the filtered character vector 

tc <- textConnection(object=file)

## create a data frame using the read.table on the text connection created; this would only have the data 
## without any header as the filter condition would not have sufficed

processed <- read.table(tc, sep=";", na.string="?", as.is=T)

## close the connection from the textConnection

close(tc)

## get one record from the file again to get hold of the column names

headerinfo<-read.table(file="household_power_consumption.txt",header=T, sep=";",as.is=T, na.strings="?", nrows=1)

## set the column names appropriately

names(processed)<-names(headerinfo)

## create a new column that would be the concatenation of the date and time columns but in the appropriate format

processed$DateTime <- as.POSIXct(paste(processed$Date, processed$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")

## remove all interim variables created

rm(list=c("file", "fileIndexes", "tc","headerinfo"))