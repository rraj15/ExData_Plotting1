# Set working directory to the downloaded dotaset
setwd("/Users/rraj/DataScience/class/exploratoryDataAnalysis/project1")

# Read the data by eliminating missing values
myData<-read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings="?")

# Find Sub Metering 1,2 and 3 where date is "2007-02-01" OR "2007-02-02"
idx<-as.Date(myData$Date,format='%d/%m/%Y')=="2007-02-01" | as.Date(myData$Date,format='%d/%m/%Y')=="2007-02-02"
dt<-paste(myData$Date[idx],myData$Time[idx])
x<-strptime(dt,"%d/%m/%Y %H:%M:%S")
sm1<-myData$Sub_metering_1[idx]
sm2<-myData$Sub_metering_2[idx]
sm3<-myData$Sub_metering_3[idx]


# Open png device and plot with legend
png(file="plot3.png",height=480,width=480)
plot(x,sm1,type="l",ylab="Energy sub metering",xlab="")
lines(x,sm2,col="red")
lines(x,sm3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),lwd=c(2,2,2))
dev.off()