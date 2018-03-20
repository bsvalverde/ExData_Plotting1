url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "data.zip")
unzip("data.zip")
data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactor = FALSE)
names(data) <- data[1,]
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()