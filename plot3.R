# get the data
electric_power <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

png(file = "plot3.png")   # set the filename by which will be saved

# as.Date
electric_power$Date <- as.Date(electric_power$Date, format="%d/%m/%Y")
interes <- electric_power[(electric_power$Date=="2007-02-01") | (electric_power$Date=="2007-02-02"), ]

# as.POSIXct
interes <- transform(interes, timestamp=as.POSIXct(paste(Date, Time)))

# subplot 1
plot(interes$timestamp, interes$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col= "black")
# subplot 2
points(interes$timestamp, interes$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
#subplot 3
points(interes$timestamp, interes$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
# legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close the plot and save
dev.off("plot3.png saved")

