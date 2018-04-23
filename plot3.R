library(dplyr)
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

feb07 <- subset(data, DateTime>="2007-02-01" & DateTime<"2007-02-03")

feb07$Global_active_power<-as.numeric(feb07$Global_active_power)

png(filename = "plot3.png")
plot(feb07$DateTime, feb07$Sub_metering_1, xlab="Date/Time", ylab = "Energy sub metering", type="l")
lines(feb07$DateTime, feb07$Sub_metering_2, type="l", col="red")
lines(feb07$DateTime, feb07$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
