######### codePlotCatchWorldMap #################

# Countries WGS84 from ArcGIS Hub
# (https://hub.arcgis.com/datasets/a21fdb46d23e4ef896f31475217cbb08_1?geometry=-120.937%2C-89.983%2C120.937%2C-88.772)

World <- rgdal::readOGR(dsn="C:/_w/maps/shapefiles/Longitude_Graticules_and_World_Countries_Boundaries-shp", layer="99bfd9e7-bb42-4728-87b5-07f8c8ac631c2020328-1-1vef4ev.lu5nk")

CNTRY_names<-World$CNTRY_NAME
CNTRY_n<-CNTRY_names


# match country codes in CSBdata and names in World Map

CR_Flag_CTY<-CRcountry[ which(CRcountry[,"CTY_Code"] %in%  unique(CSBdata[,"Flag_CTY_Code"])),]
CR_Flag_CTY<-cbind(CR_Flag_CTY,CR_Flag_CTY[,"CTY_Name"])
dimnames(CR_Flag_CTY)[[2]]<-c("CTY_Code","Name","World_Name")

WorldNames<-matrix(c("GBR","United Kingdom"
                     ,"SUN","Russia-Ukraine"
                     ,"KOR","South Korea"
                     ,"DDR","Germany"
                     ,"USA","United States"
                     ,"DEU","Germany"
                     ,"RUS","Russia"
                     ,"CHN","China"),ncol=2,byrow=TRUE,dimnames=list(NULL,c("CTY_Code","World_Name")))
whereReplaceName <- which(CR_Flag_CTY[,"CTY_Code"] %in% WorldNames[,1])
CR_Flag_CTY<-bind_rows(CR_Flag_CTY[-whereReplaceName,]
                       ,merge(CR_Flag_CTY[whereReplaceName,c(1,2)],WorldNames,by="CTY_Code"))
CR_Flag_CTY<-CR_Flag_CTY[order(CR_Flag_CTY[,"World_Name"]),]


dfSubset<-CSBdata[which(CSBdata[,"Catch_TXN_Code"] %in% CatchTaxa),c("Flag_CTY_Code","Green_Weight")]

dfSubset<-bind_cols(dfSubset,WorldName = CR_Flag_CTY[match(dfSubset[,"Flag_CTY_Code"],CR_Flag_CTY[,"CTY_Code"]),"World_Name"])

WorldCatch<-aggregate(dfSubset[,"Green_Weight"],by=list(dfSubset[,"WorldName"]),sum)
dimnames(WorldCatch)[[2]]<-c("Country","Catch")
WorldCatch[match(c("Russia","Ukraine"),WorldCatch[,"Country"]),"Catch"]<-
  WorldCatch[match(c("Russia","Ukraine"),WorldCatch[,"Country"]),"Catch"]+
  WorldCatch[which(WorldCatch[,"Country"] %in% c("Russia-Ukraine")),"Catch"]*c(0.78,0.22)# population proportions in Year 2000
WorldCatch<-WorldCatch[-which(WorldCatch[,"Country"] %in% c("Russia-Ukraine")),]

WcatchCTY_attr<-rep(NA,length(CNTRY_names))
WcatchCTY_attr[match(WorldCatch[,"Country"],CNTRY_names)]<-WorldCatch[,"Catch"]/1000
World$Catch<-WcatchCTY_attr

World$id<-as.numeric(World$OBJECTID)
mapWorld_pts<- fortify(World, region = "id")
mapWorld<-merge(mapWorld_pts,World,by="id")

p <- ggplot(data = mapWorld, aes(x=long, y=lat, group = group,
                                 fill = Catch))
p<-p+geom_polygon() + scale_fill_continuous(type="gradient")
p<-p+geom_polygon(data=mapWorld[is.na(mapWorld[,"Catch"]),],mapping=aes(x=long,y=lat),fill="grey90")
p<-p+geom_polygon(data=mapWorld[mapWorld[,"CNTRY_NAME"]=="Antarctica",],mapping=aes(x=long,y=lat),fill="lightgoldenrod1")
p <- p + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()
               ,panel.background = element_blank()
               , axis.line = element_blank()
               ,axis.text=element_blank()
               ,axis.ticks=element_blank()
               ,axis.title=element_blank())
p <- p + labs(title="Total accumulated Toothfish Catch by Flag State", fill = "Catch (,000 tonnes)")
p
