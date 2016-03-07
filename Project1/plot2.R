##read and subset data
x <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ';', dec = ".")
x <- x[66637:69516,]
##convert Date & time & concatenate
y <- strptime(paste(x$Date, x$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
##convert Global_active power to numeric
x$Global_active_power <- as.numeric(x$Global_active_power)
##Save graph to png
png("plot2.png", width = 480, height = 480)
plot(y, x$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()