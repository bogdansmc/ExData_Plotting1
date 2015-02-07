x <- read.csv2("household_power_consumption.txt", header=TRUE, colClasses=c(rep("character",9)), na.strings="?")
x[,1] <- as.Date(x[,1], "%d/%m/%Y")
y <- x[x$Date == as.Date("2007-02-02") | x$Date == as.Date("2007-02-01"),]
y$DateTime <- strptime(paste(y[,1], y[,2]), "%Y-%m-%d %H:%M:%OS")

png("plot3.png", bg = "transparent")
plot(y$DateTime, y$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(y$DateTime, y$Sub_metering_2, col="red")
lines(y$DateTime, y$Sub_metering_3, col="blue")

legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()