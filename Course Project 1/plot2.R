##Sets a dataset
data1 <- read.table("C:/Users/Marina/Documents/household_power_consumption.txt", sep = ";", header = TRUE)
data2 <- subset(data1,data1$Date=="1/2/2007" | data1$Date =="2/2/2007")
head(data2)

##Draw a histogram and make png file
data2$daytime <- with(data2,  strptime(paste(Date, Time), format = "%d/%m/%Y %T"))
png("plot2.png", width = 480, height = 480)
with(data2, plot(daytime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()