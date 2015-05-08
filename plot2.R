# get the data
electric_power <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

png(file = "plot2.png")   # set the filename by which will be saved

electric_power$Date <- as.Date(electric_power$Date, format="%d/%m/%Y")
interes <- electric_power[(electric_power$Date=="2007-02-01") | (electric_power$Date=="2007-02-02"), ]

interes <- transform(interes, timestamp=as.POSIXct(paste(Date, Time)))

plot(interes$timestamp, as.numeric(as.character(interes$Global_active_power)),type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close the plot and save
dev.off("plot2.png saved")
