setwd('D:/NILS/World Bank Test Data/Testing')
path <- 'D:/NILS/World Bank Test Data/Testing/household_power_consumption.txt'
library(ggplot2)
library(dplyr)
library(readr)
library(lubridate)

## Reading and Subsetting the Data ##

household_power_consumption <- read.table(path, header = TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.')

household_power_consumption <- household_power_consumption[household_power_consumption$Date %in% c('1/2/2007', '2/2/2007') ,]



## Plot 2 ## 

contTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep = ' '), "%d/%m/%Y %H:%M:%S")

png('plot2.png', width = 480, height = 480)

plot(contTime, household_power_consumption$Global_active_power, type = 'l', xlab= '', ylab = 'Global Acive Power (kilowatts)')

dev.off()