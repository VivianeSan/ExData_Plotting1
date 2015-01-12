require('sqldf')

query <- "SELECT * from file WHERE Date IN('1/2/2007', '2/2/2007')"
data  <- read.csv.sql("./household_power_consumption.txt", sql = query, sep=";")

png('plot3.png', width = 480, height = 480)

# converting Date from string to DateTime
data$Date <- strptime(paste(data$Date,data$Time), '%d/%m/%Y %H:%M:%S')

# creating the plot with SubMetering_1
plot( data$Date, data$Sub_metering_1, type='l', xlab='',  ylab='Energy sub metering')
lines(data$Date, data$Sub_metering_2, type='l', col='red')
lines(data$Date, data$Sub_metering_3, type='l', col='blue')

legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
                 lty    = 1,
                 col    = c('black','red','blue'))

dev.off()