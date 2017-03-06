# Load the file, defining the separator character, including headers and using ? as N/A.
hpc <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

# Concatenate Date and Time and convertit into POSIXlt 
hpc$Date <- strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset to the required dates.
hpc <- subset(hpc,Date >= strptime("2007-2-1",format="%Y-%m-%d") & Date < strptime("2007-2-3",format="%Y-%m-%d"))

# Initialize the PNG device
png("plot3.png",width = 480,height = 480)

# Plot the required scatter plot, blank.
with(hpc,plot(Date,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
# Add the line for the first sub metering
lines(hpc$Date,hpc$Sub_metering_1,col="black")
# Add the line for the second sub metering
lines(hpc$Date,hpc$Sub_metering_2,col="red")
# Add the line for the third sub metering
lines(hpc$Date,hpc$Sub_metering_3,col="blue")
# Add the legend to the plot
legend("topright",col=c("black","blue","red"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# Close the device
dev.off()