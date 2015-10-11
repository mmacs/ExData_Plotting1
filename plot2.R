# Read files and subset
dataFile <- "./household_power_consumption.txt"
entry_data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
formatted_data <- entry_data[entry_data$Date %in% c("1/2/2007","2/2/2007") ,]
 
# Prepare the data
dates <- strptime(paste(formatted_data$Date, formatted_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
active_power <- as.numeric(formatted_data$Global_active_power)

# Draw the plot
png("plot2.png", width=480, height=480)
plot(dates, active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()