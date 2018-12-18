## Plot 1
library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI<-group_by(NEI, year)
sumyear<-summarise(NEI, sum(Emissions))$`sum(Emissions)`

png("Plot1.png")
plot(x=unique(NEI$year), y=sumyear, type = "n",
     xlab = "Year", ylab="Quantity of Fine Particular Matter (Tons)", main = "Quantity of Fine Particular Matter emitted in the US")
points(x=unique(NEI$year), y=sumyear, cex =2, pch = 3)
dev.off()