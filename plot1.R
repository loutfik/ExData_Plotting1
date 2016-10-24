## unzip the file
unzip("exdata_data_household_power_consumption.zip")

## Load the database with the correct column headers and the filtered dates

database <- file("household_power_consumption.txt")

total_Database <- read.table( text = grep("^[1,2]/2/2007", readLines(database), value = TRUE),
                              col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                              sep = ";", header = TRUE)

## Plot 1 generation
png(filename='plot1.png', width=480, height=480, units='px')
hist(total_Database$Global_active_power, main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()












