## Plot a figure to show relationship between energy sub metering 1, 
## energy sub metering 2, energy sub metering 3 and time.
plot3 <- function() {
    source("plot1.R") # simplifyData() function in plot1.R file is needed
    
    mydata <- simplifyData()
    mydata[,3] <- as.numeric(as.character(mydata[,3]))
    mydata[,7] <- as.numeric(as.character(mydata[,7]))
    mydata[,8] <- as.numeric(as.character(mydata[,8]))
    mydata[,9] <- as.numeric(as.character(mydata[,9]))
    
    # Convert Data column and Time column to a new Column Datetime.
    mydata$Datetime = strptime(apply(mydata[ , c("Date","Time")], 
                                     1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")
    
    # Plot the figure.
    plot(mydata[,10], mydata[,7], type = "l", lty = 1, col = "black",  
         xlab = "", ylab = "Energy sub metering")
    lines(mydata[,10], mydata[,8], type = "l", col = "red")
    lines(mydata[,10], mydata[,9], type = "l", col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           lty = 1, col = c("black", "red", "blue"))
    
    # Copy the graph to a png file.
    dev.copy(png, file = "plot3.png", width = 480, height = 480)
    dev.off()
}