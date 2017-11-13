# read only dates 2007-02-01 and 2007-02-02 from files
data <- read.csv("household_power_consumption.txt",
                 sep = ";", skip = 66636, nrows = 2880)

# Give column names from the file
n <- read.csv("household_power_consumption.txt", nrows = 1, sep = ";")
names(data) <- names(n)

# Convert Date and Time from string to Date/Time format
data$dt <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Create a plot a save it into png file
png(file = "plot3.png")
with(data, plot(dt, Sub_metering_1, xlab = "", type = "l",
                ylab = "Energy sub metering", 
                main = ""))
with(data, lines(dt, Sub_metering_2, type = "l", col = "red"))
with(data, lines(dt, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
