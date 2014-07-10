## import subset of data
myFile<-"household_power_consumption.txt"
mySql<-"SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
data<-read.csv2.sql(myFile,mySql, header=TRUE)

## create POSIXt and POSIXct representation of date time
## 2 step so you can see what's going on
date.time <- paste(data$Date, data$Time, sep=" ")
date.time.POSIX <- strptime(date.time,"%d / %m / %Y %H : %M : %S")

## create and save plot
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

## plot 1
## Global Active Power. amended from plot1.R to shorter y label
plot(date.time.POSIX, data$Global_active_power, type="l", xlab=NA, ylab="Global Active Power")

## plot 2
## Voltage
plot(date.time.POSIX, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

## plot 3. amended from plot3.R to have no border on legend
## Energy sub metering
plot(date.time.POSIX, data$Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering")
lines(date.time.POSIX, data$Sub_metering_2, col="red")
lines(date.time.POSIX, data$Sub_metering_3, col="blue")
legend("topright",names(data)[7:9], lty=c(1,1), bty="n",col=c("black","red","blue"))

## plot 4
## Global_reactive_power
plot(date.time.POSIX, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
par(mfrow=c(1,1))
