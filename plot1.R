# read only dates 2007-02-01 and 2007-02-02 from files
data <- read.csv("household_power_consumption.txt",
                 sep = ";", skip = 66636, nrows = 2880)

# Give column names from the file
n <- read.csv("household_power_consumption.txt", nrows = 1, sep = ";")
names(data) <- names(n)

# Convert Date and Time from string to Date/Time format
data$dt <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Create a plot a save it into png file
png(file = "plot1.png")
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")
dev.off()
