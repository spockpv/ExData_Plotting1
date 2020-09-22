Sys.setlocale("LC_ALL","en_US.UTF-8")
data<-read.csv("household_power_consumption.txt", sep = ";")
data<-subset(data, Date=="2/2/2007" | Date=="1/2/2007")
data<-cbind(data, as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))
colnames(data)[10]<-"DateTime"
png(filename = "plot4.png")

par(mfrow = c(2,2))

plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")

plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type="l")

plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(data$DateTime, data$Sub_metering_1, type = "l", col="black")
points(data$DateTime, data$Sub_metering_2, type = "l", col="red")
points(data$DateTime, data$Sub_metering_3, type = "l", col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"),box.lwd = 0)

plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Voltage", type="l")

dev.off()