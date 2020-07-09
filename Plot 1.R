

##plot 1
setwd(dirname(rstudioapi::getSourceEditorContext()$path))


data<-read.csv2("./household_power_consumption.txt")
data$Date<- as.Date(as.character(data$Date), format="%d/%m/%Y")
data<-subset(data, Date== "2007/02/01" |Date=="2007/02/02")
data$Global_active_power<- as.numeric(as.character(data$Global_active_power))

png(filename = "plot1.png")
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", col = "red")
dev.off()
