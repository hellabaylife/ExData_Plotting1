library(lubridate)
data <- read.table("./Data/household_power_consumption.txt", sep = ";",stringsAsFactors = F,na.strings = "?",header = T)
data$datetime <- dmy_hms(apply(data[,1:2], 1, paste, collapse=" "))
specified_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
specified_data$day_of_week <- wday(specified_data$datetime, label=TRUE)
summary(specified_data$day_of_week)
##PNG File Width 480 Pixels, Height 480 Pixels

with(specified_data, hist(as.numeric(Global_active_power),main = "Global Active Power",col = "red",xlab = "Global Active Power (kilowatts)"))  ## Create plot on screen device
dev.copy(png, file = "plot1.png",width = 480,height = 480)  ## Copy my plot to a PNG file
dev.off() 
