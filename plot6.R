plot6 <- function(){
        NEI <- readRDS("./data/summarySCC_PM25.rds")
        
        
        ##subset the data from the whole dataset for Baltimore and California 
        bcityPMData <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
        ccityPMData <- NEI[NEI$fips=="06037" & NEI$type=="ON-ROAD",]
        
        
        ## getting aggregate sum of emission for every year
        bcityPMDataByYear <- aggregate(Emissions ~ year, bcityPMData, sum)
        ccityPMDataByYear <- aggregate(Emissions~year,ccityPMData,sum)
        
        
        ## adding a new column city in each dataset to identify the city seperately
        bcityPMDataByYear$city <- paste(rep("Baltimore",4))
        ccityPMDataByYear$city <- paste(rep("California",4))
        
        
        ## adding both datasets to become one
        bigData <- rbind(bcityPMDataByYear,ccityPMDataByYear)
        
        
        ## Generating plot 
        library(ggplot2)
        png("plot6.png",width=640,height=480)
        
       ggp<- ggplot(data=bigData, aes(x=year, y=Emissions)) + 
                geom_bar(aes(fill=year),stat="identity") + 
                guides(fill=F) + 
                ggtitle("Emissions from motor vehicle sources in\n Baltimore City Vs Emissions from motor vehicle sources in Los Angeles County") + 
                ylab("PM 2.5 Emisson") +
                xlab('Year') + 
                facet_grid(. ~ city) + 
                geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))
        
        print(ggp)
        
        dev.off()
        
        
}