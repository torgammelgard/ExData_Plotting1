data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = T)

# Check out the data
#head(data)
#dim(data)
#names(data)

# Convert the date column and subset on the two dates in February
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datafortwodays = data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

png("plot1.png", width = 480, height = 480, units = "px")
hist(datafortwodays$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
