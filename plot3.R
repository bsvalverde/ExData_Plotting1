url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "data.zip")
unzip("data.zip")
data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactor = FALSE)
names(data) <- data[1,]
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
png("plot3.png")
plot(datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
points(datetime, data$Sub_metering_1, type = "l")
points(datetime, data$Sub_metering_2, col = "red", type = "l")
points(datetime, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()