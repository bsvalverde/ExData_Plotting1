url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "data.zip")
unzip("data.zip")
data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactor = FALSE)
names(data) <- data[1,]
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()