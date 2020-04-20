#THIS IS HOW THE PROGRAM WORKS
#First it download the files using download.file()
#it unzip the files using unzip()
#Here the subset data are choosen between 2007-02-01 and 2007-02-02
#It graph energy sub metering for the given data
#It will export 500px X 500px PNG

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power_consumption.zip",method = "curl")
unzip("power_consumption.zip")
Household_Power_Consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

Household_Power_Consumption$Date<-as.Date(Household_Power_Consumption$Date, format = "%d/%m/%Y")
Household_Power_Consumption$Time<-strptime(paste(Household_Power_Consumption$Date,Household_Power_Consumption$Time),"%F %T")

Household_Power_Consumption<-subset(Household_Power_Consumption,Household_Power_Consumption$Date %in% as.Date(c("2007-02-01","2007-02-02")))

plot(Household_Power_Consumption$Time,Household_Power_Consumption$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(Household_Power_Consumption$Time,Household_Power_Consumption$Sub_metering_2, col="red", type="l")
points(Household_Power_Consumption$Time,Household_Power_Consumption$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(Household_Power_Consumption[,7:9]))

png("plot_img_3.png", width = 500, height = 500, units = "px")
plot(Household_Power_Consumption$Time,Household_Power_Consumption$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(Household_Power_Consumption$Time,Household_Power_Consumption$Sub_metering_2, col="red", type="l")
points(Household_Power_Consumption$Time,Household_Power_Consumption$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(Household_Power_Consumption[,7:9]))
dev.off()
