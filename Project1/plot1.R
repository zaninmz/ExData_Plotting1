##read and subset data
x <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ';', dec = ".")
x <- x[66637:69516,]
##convert Date column to date class
x$Date <- as.Date(x$Date, "m%/%d/%y")
##Convert Time column to POSIXlt class
x$Time <- strptime(x$Time, format ="%H:%M:%S")
##convert Global_active_power to numeric
x$Global_active_power <- as.numeric(x$Global_active_power)
##save histogram to png
png("plot1.png", width = 480, height = 480)
##Create histogram
hist(x$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()