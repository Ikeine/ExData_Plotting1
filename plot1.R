# Load the file, defining the separator character, including headers and using ? as N/A.
hpc <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

# Concatenate Date and Time and convertit into POSIXlt 
hpc$Date <- strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset to the required dates.
hpc <- subset(hpc,Date >= strptime("2007-2-1",format="%Y-%m-%d") & Date < strptime("2007-2-3",format="%Y-%m-%d"))

# Initialize the PNG device
png("plot1.png",width = 480,height = 480)

# Plot the required histogram
hist(hpc$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

# Close the device
dev.off()



