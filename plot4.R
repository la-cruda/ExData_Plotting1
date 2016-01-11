PLOT4

library(lubridate)

analysisData0 <- transform(subset(powerData, Date == "1/2/2007" | Date =="2/2/2007"), Date = format(dmy(Date), "%Y %b %d %a"), Global_active_power = as.numeric(as.character(Global_active_power)), Global_reactive_power = as.numeric(as.character(Global_reactive_power)), Voltage = as.numeric(as.character(Voltage)), Global_intensity = as.numeric(as.character(Global_intensity)), Sub_metering_1 = as.numeric(as.character(Sub_metering_1)), Sub_metering_2 = as.numeric(as.character(Sub_metering_2)), Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
analysisData <- transform(analysisData0, DateTime = as.POSIXct(paste(Date, Time), format = "%Y %b %d %a %H: %M: %S"))

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(analysisData, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

with(analysisData, plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

with(analysisData, plot(DateTime, Sub_metering_1, type = "l"))
with(analysisData, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(analysisData, points(DateTime, Sub_metering_3, type = "l", col = "blue", ylab = "Energy sub metering"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(analysisData, plot(DateTime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

dev.copy(png, file = "plot3.png")
dev.off()
