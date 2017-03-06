# Load the file, defining the separator character, including headers and using ? as N/A.
hpc <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

# Concatenate Date and Time and convertit into POSIXlt 
hpc$Date <- strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset to the required dates.
hpc <- subset(hpc,Date >= strptime("2007-2-1",format="%Y-%m-%d") & Date < strptime("2007-2-3",format="%Y-%m-%d"))

# Initialize the PNG device
png("plot4.png",width = 480,height = 480)

# Divide into 4 panels
par(mfcol = c(2,2))

#Plot the first graph (plot2).
with(hpc,plot(Date,Global_active_power,type="l",ylab="Global Active Power",xlab=""))

# Plot the second graph (plot3).
with(hpc,plot(Date,Sub_metering_1,type="n",ylab="Global Active Power",xlab=""))
# Add the line for the first sub metering
lines(hpc$Date,hpc$Sub_metering_1,col="black")
# Add the line for the second sub metering
lines(hpc$Date,hpc$Sub_metering_2,col="red")
# Add the line for the third sub metering
lines(hpc$Date,hpc$Sub_metering_3,col="blue")
# Add the legend to the plot
legend("topright",col=c("black","blue","red"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot the third graph.
with(hpc,plot(Date,Voltage,type="l", xlab = "datetime"))

# Plot the last graph.
with(hpc,plot(Date,Global_reactive_power,type="l", xlab = "datetime"))

# Close the device
dev.off()