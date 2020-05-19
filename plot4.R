library(lubridate)
data <- read.table("./Data/household_power_consumption.txt", sep = ";",stringsAsFactors = F,na.strings = "?",header = T)
data$datetime <- dmy_hms(apply(data[,1:2], 1, paste, collapse=" "))
specified_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
specified_data$day_of_week <- wday(specified_data$datetime, label=TRUE)
names(specified_data)
##PNG File Width 480 Pixels, Height 480 Pixels


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(specified_data, 
     { 
       plot(Global_active_power ~ datetime,type = "l", ylab = "Global Active Power (kilowatts)",xlab = "")  ## Create plot on screen device
       plot(Voltage ~ datetime,type = "l", xlab ="")
       plot(Sub_metering_1 ~ datetime , type="l", col="black", xlab="", ylab="Energy sub metering")
       lines(Sub_metering_2~ datetime, col="orange")
       lines(Sub_metering_3~ datetime, col="blue")
       labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       legend("topright", legend=labels, c("black","orange","blue"), lty="solid",cex = 0.4)
       plot(Global_reactive_power ~ datetime,type = "l",xlab = "")
     })

dev.copy(png, file = "plot4.png",width = 480,height = 480)  ## Copy my plot to a PNG file
dev.off()
