## unzip the file
unzip("exdata_data_household_power_consumption.zip")

## Load the database with the correct column headers and the filtered dates


data_unfiltered <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', 
                            na.strings = "?", nrows = 2075259, check.names = FALSE, 
                            stringsAsFactors = FALSE, comment.char = "", quote = '\"')

## change date type to use subset
data_unfiltered$Date <- as.Date(data_unfiltered$Date, format = "%d/%m/%Y")

## filtering for only relevant data
data_filtered <- subset(data_unfiltered, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data_filtered$Date), data_filtered$Time)
data_filtered$Datetime <- as.POSIXct(datetime)

## Plot 2 generation
png(filename='plot2.png', width=480, height=480, units='px')
plot(data_filtered$Global_active_power ~ data_filtered$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()