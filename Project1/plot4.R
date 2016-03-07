##read and subset data
x <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ';', dec = ".")
x <- x[66637:69516,]
##convert Date & time & concatenate
y <- strptime(paste(x$Date, x$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
##convert sub_metering columns to numeric
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)
x$Sub_metering_3 <- as.numeric(x$Sub_metering_3)
##convert Global_active power to numeric
x$Global_active_power <- as.numeric(x$Global_active_power)
##Convert voltage to numeric
x$Voltage <- as.numeric(x$Voltage)
##Convert Global_reactive_power to numeric
x$Global_reactive_power <- as.numeric(x$Global_reactive_power)
##Save graph to png
png("plot4.png", width = 480, height = 480)
## set two rows, two columns for plots
par(mfrow = c(2,2))
plot(y, x$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(y, x$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(y, x$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(y, x$Sub_metering_2, col = "red")
lines(y, x$Sub_metering_3, col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c('black', 'red', 'blue' ), cex = .75 )
plot(y, x$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()