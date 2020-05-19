library(lubridate)
data <- read.table("./Data/household_power_consumption.txt", sep = ";",stringsAsFactors = F,na.strings = "?",header = T)
data$datetime <- dmy_hms(apply(data[,1:2], 1, paste, collapse=" "))
specified_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
specified_data$day_of_week <- wday(specified_data$datetime, label=TRUE)
head(specified_data)
##PNG File Width 480 Pixels, Height 480 Pixels

with(specified_data, plot(Global_active_power ~ datetime,type = "l", ylab = "Global Active Power (kilowatts)",xlab = ""))  ## Create plot on screen device
dev.copy(png, file = "plot2.png",width = 480,height = 480)  ## Copy my plot to a PNG file
dev.off() 
