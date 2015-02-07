x <- read.csv2("household_power_consumption.txt", header=TRUE, colClasses=c(rep("character",9)), na.strings="?")
x[,1] <- as.Date(x[,1], "%d/%m/%Y")
y <- x[x$Date == as.Date("2007-02-02") | x$Date == as.Date("2007-02-01"),]
y[,3] <- as.numeric(y[,3])

png("plot1.png", bg = "transparent")
hist(y$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()