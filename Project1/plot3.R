##read and subset data
x <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ';', dec = ".")
x <- x[66637:69516,]
##convert Date & time & concatenate
y <- strptime(paste(x$Date, x$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
##convert sub_metering columns to numeric
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)
x$Sub_metering_3 <- as.numeric(x$Sub_metering_3)
##Save graph to png
png("plot3.png", width = 480, height = 480)
##create multiple line plot
plot(y, x$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(y, x$Sub_metering_2, col = "red")
lines(y, x$Sub_metering_3, col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c('black', 'red', 'blue' ), cex = .75 )
dev.off()