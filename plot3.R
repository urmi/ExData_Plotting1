## PA 1: Exploratory Data Analysis
## Plot 3
## 

## set the working directory and the file path
setwd("D:/Coursera")
fnfile<-"exdata_data\\household_power_consumption.txt"

## Load the data
exdataAll <- read.table(fnfile, header = T, sep=";", na.strings = "?", as.is = T)
# str(exdataAll)

## Extract the required data
exdata2007Feb1_2 <- subset(exdataAll, as.Date(Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(Date, "%d/%m/%Y") < "2007-02-03")

## Add a new column to combine Date and Time
exdata2007Feb1_2["dateTime"] <- NA # Create a new column named "dateTime"
exdata2007Feb1_2$dateTime <- as.POSIXct(paste(exdata2007Feb1_2$Date,exdata2007Feb1_2$Time), format="%d/%m/%Y %H:%M:%S")

## Set to create the Line plots to PNG file with appropriate annotations
png(file = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
with(exdata2007Feb1_2, plot(dateTime, Sub_metering_1, col = "black", ylab="Energy sub metering", xlab= "", type = "l" ))
with(exdata2007Feb1_2, points(dateTime, Sub_metering_2, col = "red", type = "l"))
with(exdata2007Feb1_2, points(dateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
