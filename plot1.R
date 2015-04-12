# Set working directory to the downloaded dotaset
setwd("/Users/rraj/DataScience/class/exploratoryDataAnalysis/project1")

# Read the data by eliminating missing values
myData<-read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings="?")

# Find Global Active Power data where date is 2007-02-01" OR "2007-02-02"
idx<-as.Date(myData$Date,format='%d/%m/%Y')=="2007-02-01" | as.Date(myData$Date,format='%d/%m/%Y')=="2007-02-02"
gap<-myData$Global_active_power[idx]

# Open png device and draw histogram
png(file="plot1.png",height=480,width=480)
hist(gap,right=FALSE, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)",plot=TRUE)
dev.off()