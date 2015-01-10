## Import data and subset it, to get needed data. The data R object
## is stored in a file for next time uses.
simplifyData <- function() {
    # First check whether the file exists or not
    if (!file.exists("mydata.RData")) {
        
        # Data needed starts from line 66686, so here I skip first 66600 lines.
        mydata <- read.csv("household_power_consumption.txt", sep = ";", skip = 66600)
        
        names(mydata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                           "Voltage", "Global_intensity", "Sub_metering_1",
                           "Sub_metering_2", "Sub_metering_3")
        mydata <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
        
        save(mydata, file = "mydata.RData")
    }
    else {
        load("mydata.RData")
    }
    
    return (mydata)
}

## Plot a figure, showing relationship between Global Active
## Power and Frequency.
plot1 <- function() {
    mydata <- simplifyData()
    
    mydata[,3] <- as.numeric(as.character(mydata[,3]))
    hist(mydata[,3], main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)",
         ylab = "Frequency", col = "red")
    
    # Copy the graph to a png file.
    dev.copy(png, file = "plot1.png", width = 480, height = 480)
    dev.off()
}






