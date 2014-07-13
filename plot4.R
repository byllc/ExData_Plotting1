#open PNG rendering
png("plot4.png", width=480, height=480, units="px", bg="transparent")

# Multiple Plots on a 2x2 grid
par(mfrow=c(2,2))

legendLabels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

plot(
  hpcDataForDates$datetime,
  hpcDataForDates$Global_active_power,
  ylab = "Global Active Power",
  xlab ="",
  type ="l"
)


plot(
  hpcDataForDates$datetime,
  hpcDataForDates$Voltage,
  ylab = "Voltage",
  xlab ="datetime",
  type ="l"
)

plot(
  hpcDataForDates$datetime,
  hpcDataForDates$Sub_metering_1,
  xlab ="",
  ylab = "Energy sub metering",
  type ="l",
  col = 'black'
)


lines( hpcDataForDates$datetime, hpcDataForDates$Sub_metering_2, col = "red" )
lines( hpcDataForDates$datetime, hpcDataForDates$Sub_metering_3, col = "blue")

legend(
  'topright',
  legendLabels,
  col = c('black','red','blue'),
  lty = 1,
  lwd = 3
)

plot(
  hpcDataForDates$datetime,
  hpcDataForDates$Global_reactive_power,
  xlab ="datetime",
  ylab = "Global_reactive_power",
  type ="l"
)

dev.off() # Close the PNG device!