png(file ="plot4.png") 
pow_consumption<-read.csv("household_power_consumption.txt", header = FALSE,sep=";", na.strings = "?",nrows=2880, skip=66636, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
pow_consumption$datetime<-strptime(paste(pow_consumption$Date,pow_consumption$Time), format="%d/%m/%Y%H:%M:%S")

par(mfrow = c(2,2))



with(pow_consumption,
{
        plot(datetime,Global_active_power,type="l", xlab="",ylab="Global Active Power")
        
        plot(datetime,Voltage,type="l")
        
plot(datetime, Sub_metering_1,col="black",type="l", ylab="Energy sub metering",xlab="")
with(pow_consumption,lines(datetime, Sub_metering_2,col="red"))
with(pow_consumption,lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty =  1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(datetime,Global_reactive_power,type="l")
        
})
     
        
dev.off()