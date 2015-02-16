plot4 <- function(){
        library(ggplot2)
        NEI <- readRDS("./data/summarySCC_PM25.rds")
        SCC <- readRDS("./data/Source_Classification_Code.rds")
        
        NEI_SSC <- merge(NEI,SCC,by="SCC")
        coalSources <- grepl("coal",NEI_SSC$Short.Name,ignore.case=TRUE)
        NEISSCCoal <- NEI_SSC[coalSources,]
        
        
        
        coalEmissionsDataYear <- aggregate(Emissions ~ year, NEISSCCoal, sum)
        
        
        png("plot4.png",width=480,height= 480, bg="transparent")
        ggp <- ggplot(coalEmissionsDataYear,aes(factor(year),Emissions)) +
                geom_bar(stat="identity") +8
                labs(x="year",y = "Total PM2.5 Emission") +
                labs(title="Total Emission from Coal")
        
        print(ggp)
        dev.off()
}