# Generate raster data frame assigning pixels to shapes from a list of shapefiles 
library(terra)

### 1. Details for producing Bathymetry raster ####
fileBathy    <- "/Users/andreworca/Desktop/_w/_d/GEBCO_18_Jul_2023_34d702d84269/gebco_2023_n-40.0_s-80.0_w-180.0_e180.0.tif"
bathyCrop  <- NULL # c(50,100,-60,-50) # c(west,east,south,north)
DecreaseResolution<-TRUE
ResolutionFactor<-4 # for collapsing cells

### 2. Details of shapefiles for assigning statistics to raster & for focussing the raster to polygons of interest ####
fileShapes_CSB <- list( # use list names as the variable names in raster and dataframe
                   Iceshelf = list(file   = "/Users/andreworca/Desktop/_w/_d/Ice\ shapefiles/IceShelves.shp"
                                  ,var    = "IceShelf" # main variable for shapes
                                  ,subset = NULL)      # vector of polygon names to identify polygons to be used.  NULL = all
                  ,ASD      = list(file   = "/Users/andreworca/Desktop/_w/_d/CCAMLR\ shapefiles\ 20230719/split\ 88.1/CCAMLR\ ASD-WGS84\ Split\ 88_1.shp"
                                  ,var    ="ShortLabel"
                                  ,subset = NULL)      
                  ,SSRU     = list(file = "/Users/andreworca/Desktop/_w/_d/CCAMLR\ shapefiles\ 20230719/ssrus/ssrusPolygon_180break.shp"
                                  ,var="GAR_Short_"
                                  ,subset = NULL)      
                  ,SSMU     = list(file = "/Users/andreworca/Desktop/_w/_d/CCAMLR\ shapefiles\ 20230719/ssmus/ssmusPolygon.shp"
                                  ,var="GAR_Short_"
                                  ,subset = NULL)      
                  ) # end list

# only one shapefile is to be used here - is used for 'cropping' the raster for data processing
# the shapefile can have one or more polygons - processing of rasters will be for all polygons in this shapefile

fileShapes_Out <- list( # use list names as the variable names in raster and dataframe
                   MEASO    = list(file   = "/Users/andreworca/Desktop/_w/_d/MEASO\ polygons/MEASO_polygons.shp"
                                  ,var    ="MEASO_area"
                                  ,subset = NULL)  # tested example c("AOA","AOS","AON")      
                   ) # end list

dfBathy_Out_VarName<-names(fileShapes_Out[1])

# 3. Import bathymetry SpatRaster from file and crop ###########################

Bathy<-rast(fileBathy)
names(Bathy)<-"Depth"  # change from file name to manageable term - historical term

if(DecreaseResolution) r<-aggregate(Bathy,fact=ResolutionFactor,fun="mean") else r<-Bathy

if(!is.null(bathyCrop)) r<-crop(r,bathyCrop)

rm(Bathy)

# 4. Loop - shapefiles - assign shape names to raster cells ##########################
#         - one column per shapefile 
#         - subset shapefile if present

allShapes<-c(fileShapes_CSB,fileShapes_Out)
if(!is.null(allShapes)){
 for(s in 1:length(allShapes)){
   shp<-vect(allShapes[[s]]$file)
   if(!is.null(allShapes[[s]]$subset)) shp<-shp[as.vector(unlist(shp[[allShapes[[s]]$var]])) %in% allShapes[[s]]$subset]

   tmp<-rasterize(shp,r,allShapes[[s]]$var)
   names(tmp)<-names(allShapes)[s]
   r<-c(r,tmp)
     } # end s
    } # end if !is.null

rm(shp,tmp)

# 5. Convert raster to dataframe, tidy up, & save raster as geoTIFF ############
dfBathy<-as.data.frame(r,xy=TRUE,cells=TRUE)
dfBathy[is.nan(dfBathy[,"Iceshelf"]),"Iceshelf"]<-NA # noticed NaN in Iceshelf result

CellRes<-res(r) # resoluton (x,y) for raster - needed for calculating areas

writeRaster(r,"rBathy.tif",overwrite=TRUE)
plot(r)
rm(r)

# 6. add Area to data frame ####################################################

cellArea<-function(cLong # centre longitude
                   ,cLat  # centre latitude
                   ,dLon     # resolution in degrees on x axis
                   ,dLat     # resolution in degrees on y axis
){
  # based on haversine formula and convert to km
  LatN<-(cLat+dLat/2)/180*pi
  LatS<-(cLat-dLat/2)/180*pi
  
  # Radius of earth in kilometers is 6371
  kNorth<-2*6367*asin(
    (cos(LatN)^2*sin(dLon/180*pi/2)^2)^0.5)
  
  kSouth<-2*6367*asin((cos(LatS)^2 * 
                         sin(dLon/180*pi/2)^2)^0.5)
  
  kLat<- 111.12*dLat # 1.852 km per nm
  kShort<-kSouth; kLong<-kNorth
  if(kSouth>kNorth) {kShort<-kNorth; kLong<-kSouth}
  Area<-kLat*(kShort+(kLong-kShort)/2)
  return(Area)
} # end function


Area<-sapply(seq(1,nrow(dfBathy),1),function(i,df,cRes){cellArea(df[i,"x"],df[i,"y"],cRes[1],cRes[2])},dfBathy,CellRes)

# add Area to dfBathy (reordering dfBathy columns to suit naming in main code-historical)
dfBathy<-cbind(dfBathy,Area)
head(dfBathy)


# 7. Save data frame (Rds) and tidy up #########################################

if (file.exists(Seabed_CCAMLR_shape_df_file)) unlink(Seabed_CCAMLR_shape_df_file) # being careful (should not need it as this source is triggered when absent)
saveRDS(dfBathy,Seabed_CCAMLR_shape_df_file)
print(head(dfBathy))

rm(dfBathy)

detach("package:terra")
