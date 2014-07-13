
# Open the png plot component
png("plot3.png",width=480,height=480,units="px",bg="transparent")

plot( hpcDataForDates$datetime, hpcDataForDates$Sub_metering_1,
  xlab ="",
  ylab = "Energy sub metering",
  type ="l",
  col = 'black'
)

lines( hpcDataForDates$datetime, hpcDataForDates$Sub_metering_3,
  col = "blue"
)

lines( hpcDataForDates$datetime, hpcDataForDates$Sub_metering_2,
  col = "red"
)

legendLabels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend( 'topright', legendLabels,
  lty = 1,
  lwd = 3,
  col = c('black','red','blue')
)

dev.off() # Close the PNG device!