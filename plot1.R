## PA 1: Exploratory Data Analysis
## Plot 1
## 
##
## set the working directory and the file path
setwd("D:/Coursera")
fnfile <- "exdata_data\\household_power_consumption.txt"

## Read the data
exdataAll <- read.table(fnfile, header = T, sep=";", na.strings = "?", as.is = T)
# str(exdataAll)

## Extract the required data
exdata2007Feb1_2 <- subset(exdataAll, as.Date(Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(Date, "%d/%m/%Y") < "2007-02-03")

## Set to create the histogram plot to PNG file
png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(exdata2007Feb1_2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
