# Set working directory to the downloaded dotaset
setwd("/Users/rraj/DataScience/class/exploratoryDataAnalysis/project1")

# Read the data by eliminating missing values
myData<-read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings="?")

# Open png device and plot 4 graphs
png(file="plot4.png",height=480,width=480,bg="transparent")

# Create 2x2 matrix on graphic device
par(mfrow=c(2,2))

# Date for X-axis
idx<-as.Date(myData$Date,format='%d/%m/%Y')=="2007-02-01" | as.Date(myData$Date,format='%d/%m/%Y')=="2007-02-02"
dt<-paste(myData$Date[idx],myData$Time[idx])
datetime<-strptime(dt,"%d/%m/%Y %H:%M:%S")

# Plot-1
y1<-myData$Global_active_power[idx]
plot(datetime,y1,type="l",ylab="Global Active Power",xlab="")

# Plot-2
y2<-myData$Voltage[idx]
plot(datetime,y2,type="l",ylab="Voltage")

# Plot-3
sm1<-myData$Sub_metering_1[idx]
sm2<-myData$Sub_metering_2[idx]
sm3<-myData$Sub_metering_3[idx]
plot(datetime,sm1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,sm2,col="red")
lines(datetime,sm3,col="blue")
legend("topright",box.lwd = 0,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

# Plot-4
y4<-myData$Global_reactive_power[idx]
plot(datetime,y4,type="l",ylab="Global_reactive_power")

dev.off()