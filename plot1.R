setwd('D:/NILS/World Bank Test Data/Testing')
path <- 'D:/NILS/World Bank Test Data/Testing/household_power_consumption.txt'
library(ggplot2)
library(dplyr)
library(readr)
library(lubridate)

## Reading and Subsetting the Data ##

household_power_consumption <- read.table(path, header = TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.')

household_power_consumption <- household_power_consumption[household_power_consumption$Date %in% c('1/2/2007', '2/2/2007') ,]


## Plot 1 ## 

household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)

png('plot1.png', width = 480, height = 480)

hist(household_power_consumption$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

dev.off()