# MEASO routines archive
# routines not used in generalising but could be useful later

### Nations

[Under development]

```{r NationsSetup, echo=FALSE, eval=FALSE}


CheckSUN_OTassignments<-FALSE
if(CheckSUN_OTassignments){
  dfSUN<-CSBdata[CSBdata[,"Flag_CTY_Code"]=="SUN" &
                   (CSBdata[,"GAR_Code"]=="48"),]
  Factors<-c("GTY_Code","TFN","GAR_Code","Split_Year")
  LevelCombinations<-unique(dfSUN[,Factors])
  apply(LevelCombinations,1,fnCatch_summary
        ,dfSUN,Factors,BFTaxa,Threshold=2)
  remove("dfSUN")
} # end if



CheckStatAreaAssignments<-FALSE
if(CheckStatAreaAssignments){
  dfcombo<-CSBdata[,] # CSBdata[,"GAR_Code"] %in% c("48","58","88")
  Factors<-c("GTY_Code","GTY_rev","Flag_CTY_Code","TFN","GAR_Code","Split_Year")
  LevelCombinations<-unique(dfcombo[,Factors])
  apply(LevelCombinations,1,fnCatch_summary
        ,dfcombo,Factors,BFTaxa,Threshold=10)
  remove("dfCombo")
} # end if



##################################################################################################
tempContinue<-FALSE
if(tempContinue){
  
  # check catches by species
  cat("Total catch of individual taxa (where a catch in one year by a nation of the taxon :",sep="")
  df<-aggregate(df2[,"Tonnes"],by=list(df2[,"Nation"]),sum)
  dimnames(df)[[2]]<-c("Nation","Tonnes")
  
  # determine first and last years
  
  TrawlGfish_CTY<-df[,"Nation"]
  YearFirst<-unlist(do.call(rbind,lapply(TrawlGfish_CTY,function(c,dCSB){min(dCSB[dCSB[,"Nation"]==c,"Year"])},df2)))
  YearLast <-unlist(do.call(rbind,lapply(TrawlGfish_CTY,function(c,dCSB){max(dCSB[dCSB[,"Nation"]==c,"Year"])},df2)))
  df<-cbind(df,YearFirst,YearLast)
  
  # add zeros for each Nation*Decade 
  decade<-seq(1960,2010,10)
  CTzeros<-do.call(rbind,lapply(seq(1,length(decade),1),function(t,decade,CT){return(data.frame(Decade=rep(decade[t],length(CT)),Country=CT,Tonnes=rep(0,length(CT))))},decade,CTY_Names[,"CTn"]))
  
  res1<-data.frame(Decade=10*(floor(CSBdata[,"Calendar_Year"]/10))
                   ,Gear=GT_Names[match(CSBdata[,"GTY_Code"],GT_Names[,"Gear"]),"GTn"]
                   ,Tonnes = CSBdata[,"Green_Weight"])
  res1<-rbind(res1,GTzeros)
  res<-as.data.frame(aggregate(res1[,"Tonnes"],list(res1[,"Decade"],res1[,"Gear"]),sum))
  dimnames(res)[[2]]<-c("Decade","Gear","Tonnes")
  
  
  
  
  
  
  p <- ggplot(df, aes(x = factor(df[,"Nation"]), y = df[,"Tonnes"], fill = factor(df[,"Country"])))
  p <- p + geom_col(position = "dodge")
  p <- p + labs(x = "Gear", y ="Tonnes", fill = "Country",title=paste(CatchTaxon[ct]," catch by gear for countries",sep=""))
  p<-p + scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),labels = trans_format("log10", math_format(10^.x)), limits = c(1E0,1E8)) + annotation_logticks(sides="l")
  p <- p + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()
                 ,panel.background = element_blank()
                 , axis.line = element_line(colour = "black",size=1, linetype="solid"))
  p
  
  plots<- c(plots,list(p))
  
} # end tempContinue



```

```{r WorldMap, echo=FALSE}
# Countries WGS84 from ArcGIS Hub
# (https://hub.arcgis.com/datasets/a21fdb46d23e4ef896f31475217cbb08_1?geometry=-120.937%2C-89.983%2C120.937%2C-88.772)

World <- rgdal::readOGR(dsn=paste(RootDir,"maps/shapefiles/Longitude_Graticules_and_World_Countries_Boundaries-shp",sep=""), layer="99bfd9e7-bb42-4728-87b5-07f8c8ac631c2020328-1-1vef4ev.lu5nk")

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


```


```{r plotWorldScience, echo=FALSE, eval=FALSE}

# assessment of citations for Antarctica and Southern Ocean by country x decade and plotting a colour ramp on each country

WebOfScience_CTY<-read.csv("WebOfScience1970-2020 Antarctic & SO.csv")

# aggregate by WorldNames

WoSrecords<-aggregate(WebOfScience_CTY[,"records"],list(WebOfScience_CTY[,"WorldNames"]),sum)
dimnames(WoSrecords)[[2]]<-c("WorldNames","Records")

WoSCTY_attr<-rep(NA,length(CNTRY_names))
WoSCTY_attr[match(WoSrecords[,"WorldNames"],CNTRY_names)]<-WoSrecords[,"Records"]
World$Records<-WoSCTY_attr

#pmap<-ggplot() + geom_polygon(data = World, aes(x = long, y = lat))
#pmap

World$id<-as.numeric(World$OBJECTID)
mapWorld_pts<- fortify(World, region = "id")
mapWorld<-merge(mapWorld_pts,World,by="id")

p <- ggplot(data = mapWorld, aes(x=long, y=lat, group = group,
                                 fill = Records))
p<-p+geom_polygon() + scale_fill_continuous(type="gradient")
p<-p+geom_polygon(data=mapWorld[is.na(mapWorld[,"Records"]),],mapping=aes(x=long,y=lat),fill="grey90")
p<-p+geom_polygon(data=mapWorld[mapWorld[,"CNTRY_NAME"]=="Antarctica",],mapping=aes(x=long,y=lat),fill="grey90")
p <- p + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()
               ,panel.background = element_blank()
               , axis.line = element_blank()
               ,axis.text=element_blank()
               ,axis.ticks=element_blank()
               ,axis.title=element_blank())
p <- p + labs(title="Scientific Papers", fill = "Records")
p

if(PlotToFile) ggsave("Scientific_Papers_State.tiff",width=15,height=10,units="cm")

```
