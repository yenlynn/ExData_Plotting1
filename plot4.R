setwd("C:/Users/mycp1urz/Desktop/Exploratory/exdata_data_household_power_consumption")
library(lubridate)
data <- read.csv("household_power_consumption.txt", header =TRUE, sep =";",stringsAsFactors = FALSE,dec=".")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

global_active_power <- as.numeric(subset_data$Global_active_power)
date_time <- paste(subset_data$Date, subset_data$Time, sep=" ")
date_time1 <- strptime(date_time, format ="%d/%m/%Y %H:%M:%S")
sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)
global_reactive_power <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subset_data$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(subset_data,{
plot(date_time1,global_active_power,type ="l",xlab =" ",ylab = "Global Active Power")

plot(date_time1,voltage, type ="l",xlab="datetime",ylab="Voltage")  
  
plot(date_time1,sub_metering_1,type="l", xlab = "",ylab ="Energy sub metering")
lines(date_time1,sub_metering_2,col ="Red")
lines(date_time1,sub_metering_3,col="Blue")
legend("topright",lty =,lwd =1,col = c("Black","Red","Blue"),legend =c("Sub_metering_1",
                                                                        "Sub_metering_2",
                                                                        "Sub_metering_3"),
                                                                        bty ="n" )

plot(date_time1,global_reactive_power,type ="l",xlab ="datetime",ylab ="Global_reactive_power")
})

dev.off()