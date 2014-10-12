myfile <-read.table("./household_power_consumption.txt",sep=";", header=TRUE,na.strings="?")  #read file
myplot <- subset(myfile, myfile$Date=="1/2/2007"|myfile$Date=="2/2/2007")  # required days data

#add the dateTime in the dataset
myNewPlot <- transform(myplot, myDateTimeDT=strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))

png(filename="plot4.png",  width=480,height=480,units="px") # device to save graph


#we need 2x2 graphs
par(mfrow=c(2,2))


#Plot the graphs
with(myNewPlot,{
 plot(myDateTimeDT, Global_active_power,ylab="Global Active Power (kilowatts)", xlab="",type="l",yaxp = c(0,6,3)) #top left
 plot(myDateTimeDT,Voltage, type="l",xlab="datetime",yaxp=c(234,246,3))						#top right
														#bottom left
 {
 plot(myDateTimeDT, Sub_metering_1, type="l",col="black", ylab="Energy sub metering", xlab="",yaxp = c(0,30,3))
with(myNewPlot, lines(myDateTimeDT, Sub_metering_2,  col="Red"))
with(myNewPlot, lines(myDateTimeDT, Sub_metering_3, col="Blue"))
legend("topright", col = c("black", "red", "blue"), c("sub_metering_1","sub_metering_2","sub_metering_3"), 
	lty="solid", cex=.65,bty="n")										#legend with no border
}

 plot(myDateTimeDT,  Global_reactive_power, type="l", xlab="datetime", yaxp=c(0,0.5,5))				#bottom right
}
 )
 


dev.off()