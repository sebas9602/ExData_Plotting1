

##plot 2
library(lubridate)
data<-read.csv2("./household_power_consumption.txt")#
data$Date<- as.character(data$Date)
data$Time<- as.character(data$Time)
data$Global_active_power<- as.numeric(as.character(data$Global_active_power))
#subsetting
data2<-subset(data, Date== "1/2/2007" |Date=="2/2/2007")
data2$fecha_hora<- as.POSIXct(paste(data2$Date,data2$Time,sep = ""), format="%d/%m/%Y %H:%M:%S")
##
png(filename = "plot2.png")
plot(data2$fecha_hora,data2$Global_active_power,type = 'n', ylab = "Global Active Power (Kilowatts)",xlab = "")
lines(data2$fecha_hora,data2$Global_active_power)
dev.off()
