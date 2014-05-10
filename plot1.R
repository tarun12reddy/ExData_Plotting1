data <- read.table('household_power_consumption.txt', sep = ";", header = TRUE)
data$Date <- strptime(data$Date, "%d/%m/%Y")
s <- split(data, as.Date(data$Date))
new_data <- rbind(s$'2007-02-01', s$'2007-02-02')


hist(as.numeric(as.character(new_data$Global_active_power)), xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', main = 'Global Active Power',ylim=c(0, 1200), col = 'red')
axis(2, at = c(0, 1200, 200))
dev.copy(png, file = "plot1.png")
dev.off()