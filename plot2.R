setwd("C:/Users/mycp1urz/Desktop/Exploratory/exdata_data_household_power_consumption")
library(lubridate)
data <- read.csv("household_power_consumption.txt", header =TRUE, sep =";",stringsAsFactors = FALSE,dec=".")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

global_active_power <- as.numeric(subset_data$Global_active_power)
date_time <- paste(subset_data$Date, subset_data$Time, sep=" ")
date_time1 <- strptime(date_time, format ="%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height =480)
plot(date_time1,global_active_power,type ="l",xlab =" ",ylab = "Global Active Power (kilowatts)")
dev.off()