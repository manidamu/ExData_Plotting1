## Read source data - could be made more efficient by only reading required data
mydata <- read.csv("household_power_consumption.txt", sep=";",skip=66636,nrows=2880,na.strings="?")
colnames(mydata) <- c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')
## Coerce to required data types
mydata$Time <- strptime(paste(mydata$Date, mydata$Time), format="%d/%m/%Y%H:%M:%S")
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
mydata$Global_reactive_power <- as.numeric(as.character(mydata$Global_reactive_power))
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3))
mydata$Voltage <- as.numeric(as.character(mydata$Voltage))


## Plot 1 logic
png(file="plot1.png", width=480, height=480)
hist(mydata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
