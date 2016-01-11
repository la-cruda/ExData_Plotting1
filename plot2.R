PLOT2

library(lubridate)

analysisData0 <- transform(subset(powerData, Date == "1/2/2007" | Date =="2/2/2007"), Date = format(dmy(Date), "%Y %b %d %a"), Global_active_power = as.numeric(as.character(Global_active_power)), Global_reactive_power = as.numeric(as.character(Global_reactive_power)), Voltage = as.numeric(as.character(Voltage)), Global_intensity = as.numeric(as.character(Global_intensity)), Sub_metering_1 = as.numeric(as.character(Sub_metering_1)), Sub_metering_2 = as.numeric(as.character(Sub_metering_2)), Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
analysisData <- transform(analysisData0, DateTime = as.POSIXct(paste(Date, Time), format = "%Y %b %d %a %H: %M: %S"))

with(analysisData, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()
