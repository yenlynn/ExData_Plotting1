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

png("plot3.png", width=480, height =480)
plot(date_time1,sub_metering_1,type="l", xlab = "",ylab ="Energy sub metering")
lines(date_time1,sub_metering_2,col ="Red")
lines(date_time1,sub_metering_3,col="Blue")
legend("topright",lty =1,lwd =2,col = c("Black","Red","Blue"),legend =c("Sub_metering_1",
                                                                        "Sub_metering_2",
                                                                        "Sub_metering_3"))
dev.off()