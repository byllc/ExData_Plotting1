#Look here to see where / how the data is loaded. Will populate a variable called hpcData
source("get_data.R")

# Open the png plot component
png("plot2.png",width=480,height=480,units="px",bg="transparent")

plot(
  hpcDataForDates$datetime,
  hpcDataForDates$Global_active_power,
  xlab ="",
  ylab = "Global Active Power",
  type ="l"
)

dev.off() # Close the PNG device!