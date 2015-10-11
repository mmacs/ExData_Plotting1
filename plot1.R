# Reading files and subsetting 
dataFile <- "./household_power_consumption.txt"
entry_data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
formatted_data <- entry_data[entry_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Preparing data
active_power <- as.numeric(formatted_data$Global_active_power)

# Drawing a graph
png("plot1.png", width=480, height=480)
hist(active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()