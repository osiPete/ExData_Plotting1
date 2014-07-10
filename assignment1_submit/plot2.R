## import subset of data
myFile<-"household_power_consumption.txt"
mySql<-"SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
data<-read.csv2.sql(myFile,mySql, header=TRUE)

## create POSIXt and POSIXct representation of date time
## 2 step so you can see what's going on
date.time <- paste(data$Date, data$Time, sep=" ")
date.time.POSIX <- strptime(date.time,"%d / %m / %Y %H : %M : %S")

## create and save plot
png(file="plot2.png",width=480,height=480)
plot(date.time.POSIX, data$Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)")
dev.off()

## alternate method that ignores POSIX and hack's around it.
##plot(data$Global_active_power, type="l",xaxt="n", xlab=NA, ylab="Global Active Power (kilowatts)")
##axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
