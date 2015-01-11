## PA 1: Exploratory Data Analysis
## Plot 2
## 

## set the working directory and the file path
setwd("D:/Coursera")
fnfile<-"exdata_data\\household_power_consumption.txt"

## Read the data
exdataAll <- read.table(fnfile, header = T, sep=";", na.strings = "?", as.is = T)
# str(exdataAll)

## Extract the required data
exdata2007Feb1_2 <- subset(exdataAll, as.Date(Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(Date, "%d/%m/%Y") < "2007-02-03")

## Add a new column to combine Date and Time
exdata2007Feb1_2["dateTime"] <- NA # Create a new column named "dateTime"
exdata2007Feb1_2$dateTime <- as.POSIXct(paste(exdata2007Feb1_2$Date,exdata2007Feb1_2$Time), format="%d/%m/%Y %H:%M:%S")

## Set to create the Line plot to PNG file
png(file = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(exdata2007Feb1_2$dateTime, exdata2007Feb1_2$Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab= "")
dev.off()
