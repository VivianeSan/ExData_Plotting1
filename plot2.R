require('sqldf')

query <- "SELECT * from file WHERE Date IN('1/2/2007', '2/2/2007')"
data  <- read.csv.sql("./household_power_consumption.txt", sql = query, sep=";")

png('plot2.png', width = 480, height = 480)

data$DateTime <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')
plot(data$DateTime, data$Global_active_power, type='l', ylab = 'Global Active Power (kilowatts)', xlab = '')

dev.off()