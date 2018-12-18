## Plot 4
  
library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalindex<-as.character(SCC$SCC[grep("Coal", SCC$EI.Sector)])
coaldata<-subset(NEI, SCC %in% coalindex)
coaldata<-group_by(coaldata, year)
coalsummary<-summarize(coaldata, PM2.5 = sum(Emissions))

png("Plot4.png")
ggplot(coalsummary, aes(x= year, y= PM2.5))+
  geom_point(shape = 4, size =4, stroke = 1.5)+
  ggtitle("Emission of PM2.5 from coal in the US")+
  ylab("PM2.5 (tons)")
dev.off()
