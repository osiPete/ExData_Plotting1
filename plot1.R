## import subset of data
myFile<-"household_power_consumption.txt"
mySql<-"SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
data<-read.csv2.sql(myFile,mySql, header=TRUE)

## create and save plot
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()