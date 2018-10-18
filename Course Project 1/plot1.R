##Sets a dataset
data1 <- read.table("C:/Users/Marina/Documents/household_power_consumption.txt", sep = ";", header = TRUE)
data2 <- subset(data1,data1$Date=="1/2/2007" | data1$Date =="2/2/2007")
head(data2)

##Draw a histogram
plot1 <- hist(as.numeric(data2$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Make png file 
dev.copy(png, file = "plot1.png")
dev.off()