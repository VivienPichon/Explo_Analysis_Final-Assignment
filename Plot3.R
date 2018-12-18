## Plot 3

library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
balti<-subset(NEI, fips=="24510")

balti<-group_by(balti, year, type)
plotdata<-summarise(balti, sum(Emissions))

png("Plot3.png")
ggplot(plotdata, aes(x= year, y= PM25, color = type))+
  geom_point(shape = 4, size =4, stroke = 1.5)+
  geom_smooth()+
  ggtitle("Emission of PM2.5 in Baltimore per type per year")+
  ylab("PM2.5 (tons)")
dev.off()