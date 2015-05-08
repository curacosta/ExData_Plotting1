# get the data
electric_power <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

png(file = "plot1.png")   # set the filename by which will be saved

#plot the histogram
hist(as.numeric(as.character(electric_power$Global_active_power)), col="red", xlab="Global Active power (kilowatts)", ylab="Frequency", main="Global Active Power", xlim=c(0,6))

# close the plot and save
dev.off("plot1.png saved")
