#### libraries ####
library(knitr)
library(ggplot2)
library(scales)
library(png) # for grabbing dimensions of png files
library(dplyr)

# replace use of the following - use sf and terra instead
# library(raster)
# library(rgdal)
# library(maptools)
# library(sp)
# library(rgeos)


# library(measoshapes) # from GitHub  remotes::install_github("AustralianAntarcticDivision/measoshapes")
# library(SOmap)  #remotes::install_github("AustralianAntarcticDivision/SOmap")  # is dependent on raster, sp


# library(sf)
# library(RColorBrewer)
# library(geodist)
# library(colorspace)

#### directories & filenames ####

dirIn<-"./In"
dirOut<-"./Out"
dirFns<-"./Fns"

#### Output flags & limits ####
AllocateStatsToAllCells <- TRUE # if FALSE then use the output polygons to mask the cells for generating statistics

printMaps<-TRUE
plotCatchMaps <- TRUE
plotToothfish<-TRUE
addIUU<-TRUE

PlotToFile<-TRUE

SOmapTrimLat<--40
SOmapFixBreaks<-TRUE


################# load functions #####################

source(file.path(dirFns,"fnBaseRules.R")) # the rules for dividing ASD catch and effort into raster cells
source(file.path(dirFns,"fnCatch_summary.R"))
source(file.path(dirFns,"fnDepthArea.R"))
source(file.path(dirFns,"fnCalcMEASO_TimeSeries.R"))
source(file.path(dirFns,"fnSetupCatchDistRule.R"))
source(file.path(dirFns,"fnCatchDistRule.R"))
source(file.path(dirFns,"fnPropInMareaForRule.R"))


fnYmax<-function(m){# m is the maximum catch
  om<-floor(log10(m)) # order of magnitude
  if((m*10^(-om))>5) cInt<-10^om else cInt<-0.5*10^om
  return(c(ceiling(m/cInt)*cInt,cInt))
} # end function

