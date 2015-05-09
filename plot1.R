# *------------------------------------------------------------------
# | PROGRAM NAME: Exploratory Data Analysis - Course Project 1
# | DATE: May 2015
# | CREATED BY: Tarnjit Kaur  
# | PROJECT FILE: Exploratory Data Analysis             
# *----------------------------------------------------------------
# | PURPOSE:      Learning to use the base plot function         
# |
# *------------------------------------------------------------------
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

  png("plot1.png",
     height = 480,
     width = 480)

# *------------------------------------------------------------------
# |               Histogram plot using base plot
# *-----------------------------------------------------------------

hist(periodHouseData$Global_active_power,
          col = "red", border = NULL,
          main = "Global Active Power",
          xlab = "Global Active Power (kilowatts)",
          axes = TRUE, plot = TRUE, labels = FALSE,
          nclass = NULL, warn.unused = TRUE)

# *------------------------------------------------------------------
# |               close dev 
# *-----------------------------------------------------------------

   dev.off()

