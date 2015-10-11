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

# Draw the graph
png("plot3.png", width=480, height=480)
with(formatted_data, {
  plot(dates, sub_meter1, type="l",
       ylab="Energy sub metering", xlab="")
  lines(dates, sub_meter2, col='Red')
  lines(dates, sub_meter3, col='Blue')
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
