## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

# Subsets data and appends two years in one data frame
MD <- subset(NEI, fips == '24510')

png(filename = 'plot2.png')
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), main = 'Total Emission in Baltimore City, Maryland', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()