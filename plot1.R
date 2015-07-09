setwd("C:/Users/mycp1urz/Desktop/Exploratory/exdata_data_household_power_consumption")
library(lubridate)
data <- read.csv("household_power_consumption.txt", header =TRUE, sep =";",stringsAsFactors = FALSE,dec=".")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

global_active_power <- as.numeric(subset_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_active_power,col ="red", main ="Global Active Power", xlab ="Global Active Power (kilowatts)",
     ylab ="Frequency")
dev.off()


