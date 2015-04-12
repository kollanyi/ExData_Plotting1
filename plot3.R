# Loading the data
setwd("~/Desktop/Data Scientist/04-exdata")
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

# Filtering the data
filter<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
GAP<-as.numeric(filter$Global_active_power)

# Convert the date and time
DT<-strptime(paste(filter$Date, filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Sub_metering
Sub_metering_1 <- as.numeric(filter$Sub_metering_1)
Sub_metering_2 <- as.numeric(filter$Sub_metering_2)
Sub_metering_3 <- as.numeric(filter$Sub_metering_3)

# Plot the data
png("plot3.png", width=480, height=480)
plot(DT, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(DT, Sub_metering_2, type="l", col="red")
lines(DT, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
