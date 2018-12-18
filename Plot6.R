## Plot 6

library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltla<-subset(NEI, fips=="24510" | fips=="06037")

motorindex<-as.character(SCC$SCC[grep("Mobile", SCC$EI.Sector)])
motordata<-subset(baltla, SCC %in% motorindex)
motordata<-group_by(motordata, year, fips)
motorsummary<-summarize(motordata, PM2.5 = sum(Emissions))

png("Plot6.png")
ggplot(motorsummary, aes(x= year, y= PM2.5, color = fips))+
  geom_point(shape = 4, size =4, stroke = 1.5)+
  geom_smooth()+
  scale_colour_discrete(name = "County", breaks = c("06037","24510"), labels = c("Los Angeles", "Baltimore"))+
  ggtitle("Comparison of the PM2.5 emissions from motor vehicles")+
  ylab("PM2.5 (tons)")
dev.off()
