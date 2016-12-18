data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = T)

# Convert the date column and subset on the two dates in February
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datafortwodays = data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

datafortwodays$DateAndTime <- as.POSIXct(paste(datafortwodays$Date, datafortwodays$Time))

# Language setting (on mac)
Sys.setlocale("LC_TIME", "C")

# Plot
png(filename = "plot3.png", width = 480, height = 480, units = "px")

with(datafortwodays, {
  plot(Sub_metering_1 ~ DateAndTime, type="l", col="black", ylab = "Energy sub metering", xlab="")
  lines(Sub_metering_2 ~ DateAndTime, col = "red")
  lines(Sub_metering_3 ~ DateAndTime, col = "blue")
})

legend("topright", col=c("black", "red", "blue"), lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
