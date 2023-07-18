######### codePlotCatchMap #################

frame()
ticks<-seq(Cmin,Cmax,1)
SOmap(graticules=TRUE,graticules_col="grey30"
      ,trim=SOmapTrimLat
      #      ,col=NA,border=NA
      ,land=FALSE
      ,ice=FALSE
)
SOplot(measo_shapes,col=NA,border="black",size=0.25, add=TRUE)
SOplot(SOmap::SOmap_data$ant_coast_ice
       ,add=TRUE,col="white",border="grey50",lwd=0.25)

## create a circle
## distance from south pole to -40
width <-  geodist::geodist(cbind(0, -90), data.frame(lon= 0, lat = SOmapTrimLat), measure = "geodesic")
pContinent<- SOmap::SOmap_data$continent

#crop not working yet
#pContinent <- raster::crop(pContinent, 
#   rgeos::gBuffer(SpatialPoints(cbind(0, 0)), width = width))

SOplot(pContinent, add=TRUE, col="grey90",border="black",lwd=0.25)

SOplot(pContinent,add=TRUE,col="grey90",border="black",lwd=0.25)
plot(r_small,col=rCols,legend=FALSE, add=TRUE)
SOleg(r_small, position = "topright", col = rCols
      , ticks = length(ticks),
      tlabs = as.character(ticks),#breaks=ticks,
      trim = (SOmapTrimLat+5), label = "log10 (t/km2)", type = "continuous")
