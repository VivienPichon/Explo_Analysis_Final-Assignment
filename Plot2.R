## Plot 2

library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
balti<-subset(NEI, fips=="24510")

balti<-group_by(balti, year)
sumyear<-summarise(balti, sum(Emissions))$`sum(Emissions)`


png("Plot2.png")
plot(x=unique(balti$year), y=sumyear, type = "n",
     xlab = "Year", ylab="Quantity of PM2.5 (tons)", main = "Quantity of PM2.5 emitted in Baltimore")
points(x=unique(NEI$year), y=sumyear, cex =2, pch = 3)
dev.off()