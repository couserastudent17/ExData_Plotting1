## First we read the data

file <- "./household_power_consumption.txt"
database <- read.table(file, header=TRUE, sep=";",stringsAsFactors=FALSE,  na.strings = "?")

## now we subset the two days we are interested in
dates <- c("1/2/2007", "2/2/2007")
database_subset <- database[database$Date %in% dates, ]


#now we create the two vectors to make the plot we need with global active power and the time
days <- strptime(paste(database_subset$Date, database_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(database_subset$Global_active_power)

## now we open the device PNG 480 by 480 and plot there the GlobalActivePower in red color with corresponding title

png("plot2.png", width=480, height=480)
plot(days, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()