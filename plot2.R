# Load the file, defining the separator character, including headers and using ? as N/A.
hpc <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

# Concatenate Date and Time and convertit into POSIXlt 
hpc$Date <- strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset to the required dates.
hpc <- subset(hpc,Date >= strptime("2007-2-1",format="%Y-%m-%d") & Date < strptime("2007-2-3",format="%Y-%m-%d"))

# Initialize the PNG device
png("plot2.png",width = 480,height = 480)

# Plot the required scatter plot, with lines instead of points.
with(hpc,plot(Date,Global_active_power,type="l",ylab="Global Active Power",xlab=""))

# Close the device
dev.off()
