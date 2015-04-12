# Loading the data
setwd("~/Desktop/Data Scientist/04-exdata")
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

# Filtering the data
filter<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
GAP<-as.numeric(filter$Global_active_power)

# Plot the data
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
