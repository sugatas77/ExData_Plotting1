
myfile <-read.table("./household_power_consumption.txt",sep=";", header=TRUE,na.strings="?")
myplot <- subset(myfile, myfile$Date=="1/2/2007"|myfile$Date=="2/2/2007") # weneed only two days data


 png(filename="plot1.png",  width=480,height=480,units="px") # device to save graph


#draw histogram
 hist(myplot$Global_active_power, col="Red", main= "Global Active Power", xlab =  "Global Active Power (kilowatts)", breaks=12, xaxp = c(0,6,3), yaxp=c(0,1200,6))


dev.off() #closing device

