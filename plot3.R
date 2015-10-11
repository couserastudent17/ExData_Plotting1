## First we read the data

file <- "./household_power_consumption.txt"
database <- read.table(file, header=TRUE, sep=";",stringsAsFactors=FALSE,  na.strings = "?")

## now we subset the two days we are interested in
dates <- c("1/2/2007", "2/2/2007")
database_subset <- database[database$Date %in% dates, ]


# now we create the vectors we need to plot the lines
dates <- strptime(paste(database_subset$Date, database_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

sm1 <- database_subset$Sub_metering_1
sm2 <- database_subset$Sub_metering_2
sm3 <- database_subset$Sub_metering_3

## now we open the device PNG 480 by 480 and plot there the the three lines of submetering in red, blue and black with the corresponding titles
png("plot3.png", width=480, height=480)
plot(dates, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(dates, sm2, type="l", col="red")
lines(dates, sm3, type="l", col="blue")

#we do not forget to edit the legend and to close the device
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2.5)
dev.off()