## Plot 5

library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
balti<-subset(NEI, fips=="24510")

motorindex<-as.character(SCC$SCC[grep("Mobile", SCC$EI.Sector)])
motordata<-subset(balti, SCC %in% motorindex)
motordata<-group_by(motordata, year)
motorsummary<-summarize(motordata, PM2.5 = sum(Emissions))

png("Plot5.png")
ggplot(motorsummary, aes(x= year, y= PM2.5))+
  geom_point(shape = 4, size =4, stroke = 1.5)+
  ggtitle("Emission of PM2.5 from motor vehicles in Baltimore")+
  ylab("PM2.5 (tons)")
dev.off()
