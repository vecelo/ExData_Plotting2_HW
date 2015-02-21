## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

# Aggregates
Emissions <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)
Emissions$PM <- round(Emissions[, 2] / 1000, 2)


png(filename = "plot1.png")
barplot(Emissions$PM, names.arg = Emissions$Group.1, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()