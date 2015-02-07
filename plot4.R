x <- read.csv2("household_power_consumption.txt", header=TRUE, colClasses=c(rep("character",9)), na.strings="?")
x[,1] <- as.Date(x[,1], "%d/%m/%Y")
y <- x[x$Date == as.Date("2007-02-02") | x$Date == as.Date("2007-02-01"),]
y$DateTime <- strptime(paste(y[,1], y[,2]), "%Y-%m-%d %H:%M:%OS")

png("plot4.png", bg = "transparent")
par(mfrow = c(2,2))

plot(y$DateTime, y$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(y$DateTime, y$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(y$DateTime, y$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(y$DateTime, y$Sub_metering_2, col="red")
lines(y$DateTime, y$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(y$DateTime, y$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
