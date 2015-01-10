## Plot a figure to show relationship between global active
## power and time.
plot2 <- function() {
    source("plot1.R") # simplifyData() function in plot1.R file is needed
    
    mydata <- simplifyData()
    mydata[,3] <- as.numeric(as.character(mydata[,3]))
    
    # Convert Data column and Time column to a new Column Datetime.
    mydata$Datetime = strptime(apply(mydata[, c("Date","Time")], 
                                     1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")
    
    plot(mydata[,10], mydata[,3], type = "l", lty = 1, 
         xlab = "", ylab = "Global Active Power (kilowatts)")
    
    # Copy the graph to a png file.
    dev.copy(png, file = "plot2.png", width = 480, height = 480)
    dev.off()
}