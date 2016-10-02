house<-read.table("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,na.strings = "?",header = TRUE)
house_data <- house[house$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(house_data$Date, house_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot3.png",width = 480,height = 480)
plot(datetime,house_data$Sub_metering_1,type="l",ylab = "Energy Sub Metering",xlab = "")
lines(datetime,house_data$Sub_metering_2,col="red")
lines(datetime,house_data$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1,lwd = 2,col=c("black","red","blue"))
dev.off()
