# get the data
electric_power <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

png(file = "plot4.png")   # set the filename by which will be saved

# as.Date
electric_power$Date <- as.Date(electric_power$Date, format="%d/%m/%Y")
interes <- electric_power[(electric_power$Date=="2007-02-01") | (electric_power$Date=="2007-02-02"), ]

# as.POSIXct
interes <- transform(interes, timestamp=as.POSIXct(paste(Date, Time)))

par(mfrow = c(2, 2))

# plot 1
plot(interes$timestamp, as.numeric(as.character(interes$Global_active_power)), type = "l", ylab = "Global Active Power", xlab = "")

# plot 2
plot(interes$timestamp, interes$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot 3
plot(interes$timestamp, interes$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
    xlab = "", col = "black")
points(interes$timestamp, interes$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
points(interes$timestamp, interes$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", )

# plot 4
plot(interes$timestamp, interes$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# close the plot and save
dev.off("plot4.png saved")
