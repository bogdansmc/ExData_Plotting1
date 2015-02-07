x <- read.csv2("household_power_consumption.txt", header=TRUE, colClasses=c(rep("character",9)), na.strings="?")
x[,1] <- as.Date(x[,1], "%d/%m/%Y")
y <- x[x$Date == as.Date("2007-02-02") | x$Date == as.Date("2007-02-01"),]
y[,3] <- as.numeric(y[,3])
y$DateTime <- strptime(paste(y[,1], y[,2]), "%Y-%m-%d %H:%M:%OS")

png("plot2.png")
plot(y$DateTime, y$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()