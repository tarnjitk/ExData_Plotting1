# *------------------------------------------------------------------
# | PROGRAM NAME: Exploratory Data Analysis - Course Project 1
# | DATE: May 2015
# | CREATED BY: Tarnjit Kaur  
# | PROJECT FILE: Exploratory Data Analysis             
# |*------------------------------------------------------------------
# | DATA USED:   Electric power consumption [20Mb]             
# |              UC Irvine Machine Learning Repository 
# |
# |*------------------------------------------------------------------

#setwd('/Users/tarnjitkaur/Exploratory Data Analysis') 


rm(list=ls()) # get rid of any existing data 
ls() # view open data sets

# IMPORT Data FILE

houseData <- read.table("household_power_consumption.txt", 
                        header = TRUE, na.strings=c("?"), 
                        sep = ";", 
                        encoding="UTF-8")

print(head(houseData))

# *------------------------------------------------------------------
# |                
# | Approximate RAM required for this dataset: 149.4186 MB
# |   (2,075,259 rows by 9 columns by 8 bytes)
# |  
# *-----------------------------------------------------------------

# *------------------------------------------------------------------
# | The Date and Time columns are factor classes. Convert to data and 
# | time classes.
# *-----------------------------------------------------------------

extractDateTime <- paste(houseData$Date, houseData$Time)

dataDateTime <- strptime(extractDateTime, "%d/%m/%Y %H:%M:%S")

houseData <- cbind(dataDateTime, houseData)

# *------------------------------------------------------------------
# subset the data to consider only data from the period:                
# 2007-02-01 to 2007-02-02 
# *-----------------------------------------------------------------
periodHouseData <- houseData[
  which(houseData$dataDateTime >= "2007-02-01 00:00:00" & 
          houseData$dataDateTime <= "2007-02-03 00:00:00"),]

# *------------------------------------------------------------------
# |               creating png file output
# *-----------------------------------------------------------------

 png("plot4.png",
     height = 480,
     width = 480)
# 
# *------------------------------------------------------------------
# |               Histogram plot using base plot
# *-----------------------------------------------------------------


par(mfrow = c(2, 2))
with(periodHouseData, {
  plot(dataDateTime, Global_active_power,
       col = "black", 
       type = "l",
       border = NULL,
       xlab = "",
       ylab = "Global Active Power")
  
  plot(dataDateTime, Voltage, 
       col = "black",
       type = "l",
       xlab = "datetime",
       ylab = "Voltage")
    
 plot(periodHouseData$dataDateTime, periodHouseData$Sub_metering_1, col = "black", 
      type = "l",
      xlab = "",
      ylab = "Energy sub metering")
   lines(periodHouseData$dataDateTime, periodHouseData$Sub_metering_2, col = "red")
   lines(periodHouseData$dataDateTime, periodHouseData$Sub_metering_3, col = "blue")
   legend("topright",
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"),
        lty=0,lwd=0, bty = "n")
 
 plot(dataDateTime, Global_reactive_power, 
      col = "black", 
      type = "l",
      xlab = "datetime",
      ylab = "Global_reactive_power")
 }
)
# *------------------------------------------------------------------
# |               close dev 
# *-----------------------------------------------------------------

 dev.off()

