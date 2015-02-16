plot5 <- function(){
        NEI <- readRDS("./data/summarySCC_PM25.rds")
        
        bcityPMData <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
        
        
        bcityPMDataByYear <- aggregate(Emissions ~ year, bcityPMData, sum)
        
        library(ggplot2)
        png("plot5.png",width=640,height=480)
        ggp <- ggplot(data=bcityPMDataByYear, aes(x=year, y=Emissions)) + 
                geom_bar(aes(fill=year,colour="green"),stat="identity")  + 
                ggtitle("Total Emissions of Motor Vehicle Sources in Baltimore City Per Year") +
                ylab("PM 2.5 Emission") + 
                xlab("Year") + 
                geom_text(aes(label=round(Emissions,0), size=1, hjust=1, vjust=0))
        
        print(ggp)
        dev.off()
        
        
        
       
}