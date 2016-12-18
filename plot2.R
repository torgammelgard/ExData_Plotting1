data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = T)

# Convert the date column and subset on the two dates in February
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datafortwodays = data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

datafortwodays$DateAndTime <- as.POSIXct(paste(datafortwodays$Date, datafortwodays$Time))

# Language setting (on mac)
Sys.setlocale("LC_TIME", "C")

# Plot
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(datafortwodays, plot(DateAndTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
