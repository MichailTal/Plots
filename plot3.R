setwd('D:/NILS/World Bank Test Data/Testing')
path <- 'D:/NILS/World Bank Test Data/Testing/household_power_consumption.txt'
library(ggplot2)
library(dplyr)
library(readr)
library(lubridate)

## Reading and Subsetting the Data ##

household_power_consumption <- read.table(path, header = TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.')

household_power_consumption <- household_power_consumption[household_power_consumption$Date %in% c('1/2/2007', '2/2/2007') ,]


## Plot 3 ## 

contTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep = ' '), "%d/%m/%Y %H:%M:%S")

household_power_consumption$Sub_metering_1 <- as.numeric(household_power_consumption$Sub_metering_1)
household_power_consumption$Sub_metering_2 <- as.numeric(household_power_consumption$Sub_metering_2)
household_power_consumption$Sub_metering_3 <- as.numeric(household_power_consumption$Sub_metering_3)

png('plot3.png', width = 480, height = 480)


plot(contTime, household_power_consumption$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy Submetering')
lines(contTime, household_power_consumption$Sub_metering_2, type  = 'l', col = 'red')
lines(contTime, household_power_consumption$Sub_metering_3, type  = 'l', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, lwd = 2.5, col = c('black', 'red', 'blue'))

dev.off()