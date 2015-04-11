# Set working directory to the downloaded dotaset
setwd("/Users/rraj/DataScience/class/exploratoryDataAnalysis/project1")

# Read the data by eliminating missing values
myData<-read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings="?")

# Find Global Active Power data where date is "2007-02-01" OR "2007-02-02"
idx<-as.Date(myData$Date,format='%d/%m/%Y')=="2007-02-01" | as.Date(myData$Date,format='%d/%m/%Y')=="2007-02-02"
dt<-paste(myData$Date[idx],myData$Time[idx])
x<-strptime(dt,"%d/%m/%Y %H:%M:%S")
y<-myData$Global_active_power[idx]

# Open png device and plot
png(file="plot2.png",height=480,width=480,bg="transparent")
plot(x,y,ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()