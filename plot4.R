require('sqldf')

query <- "SELECT * from file WHERE Date IN('1/2/2007', '2/2/2007')"
data  <- read.csv.sql("./household_power_consumption.txt", sql = query, sep=";")

png('plot4.png', width = 480, height = 480)

# load libraries
library(data.table)
  
# tidy up data
colnames(data) <- c('Date','Time','GlobalActivePower','GlobalReactivePower',
                       'Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')

data$DateTime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
data <- data[ , c(10,3:9)]

par(mfrow=c(2,2))

plot(data$DateTime,data$GlobalActivePower, ylab='Global Active Power', xlab='', type='l')

plot(data$DateTime,data$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

colors <- c('black','red','blue')

plot( data$DateTime, data$SubMetering1, col = colors[1],type='l',xlab='',ylab='Energy sub metering')
lines(data$DateTime, data$SubMetering2, col = colors[2])
lines(data$DateTime, data$SubMetering3, col = colors[3])
legend('topright', col = colors, bty='n', lty = 'solid', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

plot(data$DateTime,data$GlobalReactivePower, xlab='datetime', ylab='Global_reactive_power', type='l')

dev.off()