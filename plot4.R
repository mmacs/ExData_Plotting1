# Reading files and subsetting 
dataFile <- "./household_power_consumption.txt"
entry_data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
formatted_data <- entry_data[entry_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Prepare the data
dates <- strptime(paste(formatted_data$Date, formatted_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
active_power <- as.numeric(formatted_data$Global_active_power)
sub_meter1 <- as.numeric(formatted_data$Sub_metering_1)
sub_meter2 <- as.numeric(formatted_data$Sub_metering_2)
sub_meter3 <- as.numeric(formatted_data$Sub_metering_3)
volt <- as.numeric(formatted_data$Voltage)
reactive_power <- as.numeric(formatted_data$Global_reactive_power)

# Draw the graph
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(data, {
  plot(dates, active_power, type="l", 
       ylab="Global Active Power", xlab="")
  plot(dates, volt, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(dates, sub_meter1, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(dates, sub_meter2, col='Red')
  lines(dates, sub_meter3, ,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(dates, reactive_power, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})
dev.off()