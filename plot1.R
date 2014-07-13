#Look here to see where / how the data is loaded. Will populate a variable called hpcData
source("get_data.R")

#open PNG rendering
png("plot1.png",width=480,height=480,units="px",bg="transparent")

hist(  hpcDataForDates$Global_active_power,
       breaks=16,
       col="red",
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       freq=TRUE
)


dev.off()