##
## plot3.R
##

setwd("C:/Users/ReginaldCarroll/Documents/R Programming/Coursera/Scripts")

source("load_data.R")
###########################
filename <- "household_power_consumption.txt"
df <- read.table(filename,
                 header=TRUE,
                 sep=";",
                 colClasses=c("character", "character", rep("numeric",7)),
                 na="?")
df <- read.csv("household_power_consumption.txt")

# convert date and time variables to Date/Time class
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
# only use data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
df <- subset(df, Date %in% dates)

data <- subset(df, Date %in% dates)
head(data)
##########################

##data <- read.csv("household_power_consumption.txt")

tst <- load_data()

plot3 <- function(data=NULL) {
  if(is.null(data))
    data <- load_data()
  
  png("plot3.png", width=480, height=480)
  
  plot(data$Time, data$Sub_metering_1, type="l", col="black",
       xlab="", ylab="Energy sub metering")
  lines(data$Time, data$Sub_metering_2, col="red")
  lines(data$Time, data$Sub_metering_3, col="blue")
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1)
  
  dev.off()
}