## Plot a figure to show relationship between global active
## power and time.
plotGlobalAvticePower <- function(mydata) {
    plot(mydata[,10], mydata[,3], type = "l", lty = 1, 
         xlab = "", ylab = "Global Active Power")
}

## Plot a figure to show relationship between energy sub metering 1,
## energy sub metering 2, energy sub metering 3 and time.
plotSubMetering <- function(mydata) {
    plot(mydata[,10], mydata[,7], type = "l", lty = 1,   
         xlab = "", ylab = "Energy sub metering")
    lines(mydata[,10], mydata[,8], type = "l", col = "red")
    lines(mydata[,10], mydata[,9], type = "l", col = "blue")
    # bty = "n" => plot without legend border
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           lty = 1, col = c("black", "red", "blue"), bty = "n")
}

## Plot a figure to show relationship between voltage and time.
plotVoltage <- function(mydata) {
    plot(mydata[,10], mydata[,5], type = "l", lty = 1, 
         xlab = "datetime", ylab = "Voltage")
}

## Plot a figure to show relationship between global active
## power and time.
plotGlobalReactivePower <- function(mydata) {
    plot(mydata[,10], mydata[,4], type = "l", lty = 1, 
         xlab = "datatime", ylab = "Global_reactive_power")
}

## Plot four different kinds of figures, by invoking the four 
## functions above.
plot4 <- function() {
    source("plot1.R") # simplifyData() function in plot1.R file is needed
    
    mydata <- simplifyData()
    
    for (i in 3:9) {
        mydata[,i] <- as.numeric(as.character(mydata[,i]))
    }
    
    # Convert Data column and Time column to a new Column Datetime.
    mydata$Datetime = strptime(apply( mydata[ , c("Date","Time")], 
                                      1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")
    # Plot the figures.
    par(mfrow = c(2,2))
    plotGlobalAvticePower(mydata)
    plotVoltage(mydata)
    plotSubMetering(mydata)
    plotGlobalReactivePower(mydata)
    
    # Copy the graph to a png file.
    dev.copy(png, file = "plot4.png", width = 480, height = 480)
    dev.off()
}