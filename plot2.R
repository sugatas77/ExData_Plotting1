myfile <-read.table("./household_power_consumption.txt",sep=";", header=TRUE,na.strings="?") #read file
myplot <- subset(myfile, myfile$Date=="1/2/2007"|myfile$Date=="2/2/2007") # we only need two days data


#create the date-time from two fields
myDateTime <- paste(myplot$Date,myplot$Time)
myDateTimeDT <- strptime(myDateTime, "%d/%m/%Y %H:%M:%S")

#plot the graph
plot(myDateTimeDT, myplot$Global_active_power,ylab="Global Active Power (kilowatts)", xlab="",type="l",yaxp = c(0,6,3))

#create the output file
dev.copy(png, file="plot2.png",width=480,height=480,units="px")
dev.off()


