library(lubridate)
data <- read.table("./Data/household_power_consumption.txt", sep = ";",stringsAsFactors = F,na.strings = "?",header = T)
data$datetime <- dmy_hms(apply(data[,1:2], 1, paste, collapse=" "))
specified_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
specified_data$day_of_week <- wday(specified_data$datetime, label=TRUE)
names(specified_data)
##PNG File Width 480 Pixels, Height 480 Pixels

labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(specified_data$Sub_metering_1~ specified_data$datetime , type="l", col="black", xlab="", ylab="Energy sub metering")
lines(specified_data$Sub_metering_2~ specified_data$datetime, col="orange")
lines(specified_data$Sub_metering_3~ specified_data$datetime, col="blue")
legend("topright", legend=labels, c("black","orange","blue"), lty="solid",cex = 0.5)


dev.copy(png, file = "plot3.png",width = 480,height = 480)  ## Copy my plot to a PNG file
dev.off()
