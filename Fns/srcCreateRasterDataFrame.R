# Generate raster data frame assigning pixels to shapes from a list of shapefiles 
library(terra)

fileBathy    <- "/Users/andreworca/Desktop/_w/_d/GEBCO_18_Jul_2023_34d702d84269/gebco_2023_n-40.0_s-80.0_w-180.0_e180.0.tif"
bathyCrop  <- NULL # c(50,100,-60,-50) # c(west,east,south,north)
DecreaseResolution<-TRUE
ResolutionFactor<-4

fileShapes   <- list(CCAMLR_asd = list(file = "/Users/andreworca/Desktop/_w/_d/CCAMLR\ shapefiles\ 20230719/split\ 88.1/CCAMLR\ ASD-WGS84\ Split\ 88_1.shp"
                                      ,var="LongLabel"  # main variable for shapes
                                      ,label="CCAMLR")       # variable (name) to be have label given to dataframe
                ,MEASO = list(file = "/Users/andreworca/Desktop/_w/_d/MEASO\ polygons/MEASO_polygons.shp"
                             ,var="MEASO_area"
                             ,label="MEASO")
                ) # end list

# 1. Import bathymetry SpatRaster from file and crop ####

Bathy<-rast(fileBathy)
names(Bathy)<-"Height"  # change from file name to manageable term

if(DecreaseResolution) r<-aggregate(Bathy,fact=ResolutionFactor,fun="mean") else r<-Bathy

if(!is.null(bathyCrop)) r<-crop(r,bathyCrop)

rm(Bathy)

# 2. Loop through list of shapefiles to assign shape names to cells - one column per shapefile ####

if(!is.null(fileShapes)){
 for(s in 1:length(fileShapes)){
   shp<-vect(fileShapes[[s]]$file)
   tmp<-rasterize(shp,r,fileShapes[[s]]$var)
   names(tmp)<-fileShapes[[s]]$label
   r<-c(r,tmp)
     } # end s
    } # end if !is.null

dfBathy<-as.data.frame(r,xy=TRUE)

rm(shp,tmp)

# 3. Save result as geoTIFF and as data frame (Rds)

dfBathyFilename<-"dfBathy.rds"
if (file.exists(dfBathyFilename)) unlink(dfBathyFilename)
saveRDS(dfBathy,dfBathyFilename)
print(head(dfBathy))

writeRaster(r,"rBathy.tif",overwrite=TRUE)
plot(r)

rm(r,dfBathy)

detach("package:terra")
