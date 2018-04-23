library(dplyr)
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";")

data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

feb07 <- subset(data, DateTime>="2007-02-01" & DateTime<"2007-02-03")

feb07$Global_active_power<-as.numeric(feb07$Global_active_power)

png(filename = "plot2.png")
plot(feb07$DateTime, feb07$Global_active_power, xlab="Date/Time", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()
