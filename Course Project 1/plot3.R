##Sets a dataset
data1 <- read.table("C:/Users/Marina/Documents/household_power_consumption.txt", sep = ";", header = TRUE)
data2 <- subset(data1,data1$Date=="1/2/2007" | data1$Date =="2/2/2007")

#Transform Date and Time to POSIXIt
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
data2$Time <- strptime(data2$Time, format="%H:%M:%S")
data2[1:1440,"Time"] <- format(data2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data2[1441:2880,"Time"] <- format(data2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Draw a histogram and make png file
png("plot3.png", width = 480, height = 480)
plot(data2$daytime,data2$Sub_metering_1, type = "n",xlab="",ylab="Energy sub metering")
with(data2,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(data2,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data2,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()