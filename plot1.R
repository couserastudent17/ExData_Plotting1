## First we read the data

file <- "./household_power_consumption.txt"
database <- read.table(file, header=TRUE, sep=";",stringsAsFactors=FALSE,  na.strings = "?")

## now we subset the two days we are interested in
dates <- c("1/2/2007", "2/2/2007")
database_subset <- database[database$Date %in% dates, ]

## now we open the device PNG 480 by 480 and plot there the GlobalActivePower in red color with corresponding title

png("plot1.png", width=480, height=480)
hist(database_subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## and we do not forget to switch off the device
dev.off()
