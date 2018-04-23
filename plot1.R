library(dplyr)
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data$Time<-strptime(data$Time, format = "%H:%M:%S")

feb07 <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

feb07$Global_active_power<-as.numeric(feb07$Global_active_power)

png(filename = "plot1.png")
hist(feb07$Global_active_power,col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
