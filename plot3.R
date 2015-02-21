# Loads RDS
# install.packages("ggplot2")
# library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

# Baltimore City, Maryland == fips
MD <- subset(NEI, fips == '24510')
MD$year <- factor(MD$year, levels = c('1999', '2002', '2005', '2008'))

png('plot3.png', width = 800, height = 500, units = 'px')
ggplot(MD, aes(year, Emissions, color = type)) +
		geom_point() +
		geom_line() +
		ylab(expression('Total PM'[2.5]*" Emissions")) +
        xlab('Year') +
		ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
dev.off()