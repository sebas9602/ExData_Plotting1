##plot 3
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

data<-read.csv2("./household_power_consumption.txt",na.strings = "?",stringsAsFactors = FALSE)#
data2<-subset(data, Date== "1/2/2007" |Date=="2/2/2007")
data2$fecha_hora<- as.POSIXct(paste(data2$Date,data2$Time,sep = ""), format="%d/%m/%Y %H:%M:%S")
data2[,7:9]<-apply(data2[,7:9],2,as.numeric)

png(filename = "plot3.png")
plot(data2$fecha_hora, data2$Sub_metering_1, type = 'n',ylab = "Energy sub metering",xlab = "")
lines(data2$fecha_hora, data2$Sub_metering_1)
lines(data2$fecha_hora, data2$Sub_metering_2, col="red")
lines(data2$fecha_hora, data2$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red","blue"),lty = 1,cex = 1, y.intersp = 1,lwd = 3)
dev.off()