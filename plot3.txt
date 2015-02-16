plot3 <- function(){
        library(ggplot2)
        NEI <- readRDS("./data/summarySCC_PM25.rds")
        
        bcityPMData <- NEI[NEI$fips=="24510",]
        
        
        
        
        png("plot3.png",width=480,height= 480, bg="transparent")
        ggp <- ggplot(bcityPMData,aes(factor(year),Emissions,fill=type)) +
                geom_bar(stat="identity") +
                theme_bw() + guides(fill=FALSE) +
                facet_grid(.~type,scales="free",space="free") +
                labs(x="year",y = "Total PM2.5 Emission In Tons") +
                labs(title="Baltimore City PM2.5 Emissions, By Source Type and Year")
        
        print(ggp)
        dev.off()
}