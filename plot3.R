## import subset of data
myFile<-"household_power_consumption.txt"
mySql<-"SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
data<-read.csv2.sql(myFile,mySql, header=TRUE)

## create POSIXt and POSIXct representation of date time
## 2 step so you can see what's going on
date.time <- paste(data$Date, data$Time, sep=" ")
date.time.POSIX <- strptime(date.time,"%d / %m / %Y %H : %M : %S")

## create and save plot
png(file="plot3.png",width=480,height=480)
plot(date.time.POSIX, data$Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering")
lines(date.time.POSIX, data$Sub_metering_2, col="red")
lines(date.time.POSIX, data$Sub_metering_3, col="blue")
legend("topright",names(data)[7:9], lty=c(1,1), col=c("black","red","blue"))
dev.off()