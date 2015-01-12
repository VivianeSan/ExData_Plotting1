require('sqldf')

query <- "SELECT * from file WHERE Date IN('1/2/2007', '2/2/2007')"
data  <- read.csv.sql("./household_power_consumption.txt", sql = query, sep=";")

png('plot1.png', width = 480, height = 480)

hist(
  data$Global_active_power,
  col  = 'red',
  xlab = 'Global Active Power (kilowatts)',
  main = 'Global Active Power')

dev.off()