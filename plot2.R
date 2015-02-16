plot2 <- function()
{
    NEI <- readRDS("./data/summarySCC_PM25.rds")
    bcityPMData <- NEI[NEI$fips=="24510",]
    bcityepmsumy <- tapply(bcityPMData$Emissions,bcityPMData$year,sum)
    png("plot2.png",width=480,height=480)
    plot(names(bcityepmsumy),bcityepmsumy,type="l",xlab="Year",ylab="PM2.5 Emissions Per Ton",main="Baltimore Maryland : PM2.5 Emissions by Year")
    dev.off()
    
}
