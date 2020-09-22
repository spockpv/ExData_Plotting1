Sys.setlocale("LC_ALL","en_US.UTF-8")
data<-read.csv("household_power_consumption.txt", sep = ";")
data<-subset(data, Date=="2/2/2007" | Date=="1/2/2007")
data<-cbind(data, as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))
colnames(data)[10]<-"DateTime"
png(filename = "plot2.png")
plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()