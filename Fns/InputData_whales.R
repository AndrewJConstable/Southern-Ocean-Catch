############# whale inpupt data files needed to support analyses #######################

WhaleCatchData           <-read.csv2(paste(WorkDir,'measo_whale_catch_summary.csv',sep="")
                              , header = TRUE, sep = ",", dec = ".")
# for distribution of catches among MEASO areas
Seabed_file<-"/Users/andreworca/Desktop/_wAAD/_d/seabed GEBCO/GEBCO_cells_ASD_MEASO_ssmu_ssru.rds"


################# input data to support analyses #################


WhaleSp<-data.frame(Name    = c("Baleen","Blue","Pygmy_Blue","Fin","Humpback","Right","Sei","Brydes","Antarctic_Minke","Common_Minke","Unidentified"
                            ,"Sperm","Bottlenose" ,"Killer")
                   ,General = c("Baleen","Baleen","Baleen","Baleen","Baleen","Baleen","Baleen","Baleen","Baleen","Baleen","Baleen"
                             ,"Toothed","Toothed","Toothed")
                   ,Group   = c("Other","Blue","Pygmy_Blue","Fin","Humpback","Right","Sei","Other","Antarctic_Minke","Other","Other"
                              ,"Sperm","Bottlenose" ,"Killer")
                   ,Zone    = c("Antarctic","Antarctic","SubAntarctic","Widespread","Widespread","Widespread","Widespread","Northern","Antarctic","SubAntarctic","Antarctic"
                                ,"Widespread","Antarctic" ,"Antarctic")
,Mass   = c(80,120,80,48,30,23,20,20,6,6,20,50,3,4) # tonnes
) # end data frame


WspCodes<-data.frame(Name    = c("Blue","Pygmy_Blue","Fin","Humpback","Right","Sei","Antarctic_Minke","Other"
                                 ,"Sperm","Bottlenose" ,"Killer")
                    ,Order  = c(1:11) 
                    ,Colour = c("blue4","darkslategray4","gray","palevioletred1","goldenrod3","wheat2","cadetblue2","springgreen3"
                                ,"gray40","tomato3","black")
                    ,Line   = c(NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA)
) # end data frame

############## for distribution of catches amongst MEASO areas ##################################

MEASOareas<-as.data.frame(matrix(c(
 "01","AOA","Atlantic"      ,"Antarctic",            "48",     "black","dashed"          
,"02","AOS","Atlantic"     ,"Subantarctic",         "48",     "black","solid" 
,"03","AON","Atlantic"       ,"Northern",             "48",     "black","longdash"
,"04","CIA","Central Indian","Antarctic",            "58",   "sienna2","dashed"
,"05","CIS","Central Indian","Subantarctic",         "58",   "sienna2","solid" 
,"06","CIN","Central Indian","Northern",             "58",   "sienna2","longdash"
,"07","EIA","East Indian"   ,"Antarctic",            "58",    "green4","dashed"
,"08","EIS","East Indian"   ,"Subantarctic",    "Outside",    "green4","solid"
,"09","EIN","East Indian"   ,"Northern",        "Outside",    "green4","longdash"
,"10","WPA","West Pacific"  ,"Antarctic",            "88",     "blue2","dashed"
,"11","WPS","West Pacific"  ,"Subantarctic",    "Outside",     "blue2","solid"
,"12","WPN","West Pacific"  ,"Northern",        "Outside",     "blue2","longdash"
,"13","EPA","East Pacific"  ,"Antarctic",            "48",      "red3","dashed"
,"14","EPS","East Pacific"  ,"Subantarctic",         "48",      "red3","solid"
,"15","EPN","East Pacific"  ,"Northern",        "Outside",      "red3","longdash"
,"16","Outside","not in MEASO area","","","",""),byrow=TRUE,ncol=7))
MEASOareas<-bind_cols(Order = seq(1,nrow(MEASOareas),1),MEASOareas)
dimnames(MEASOareas)[[2]]<-c("Order","chOrder","Code","Sector","Zone","CSB_Stat_Area","Col","LTY")

MEASOsectors <- data.frame(Order =c(1,2,3,4,5,6)
                           ,Name = c("Atlantic","Central Indian","East Indian","West Pacific","East Pacific","Outside")
                           ,Colour = c("black","sienna2","green4","red3","blue2",NA)
                           ) #end df

MEASOzones <- data.frame(Order =c(1,2,3,4)
                           ,Name = c("Antarctic","Subantarctic","Northern","Temperate")
                           ,Linetype = c("dashed","solid","longdash",NA)
                           ) #end df

#####################################################################
# Map grid and projection
prj <- "+proj=laea +lat_0=-90 +datum=WGS84"
template <- raster(extent(-5398000, 5386000, -5260000, 5570000)
                   , nrows = 5415, ncols = 5392, crs = prj)
# importing shape files if needed
shapeCRS<-"+proj=longlat +datum=WGS84 +no_defs"

# measo shapes from SOmap
measo_shapes <- measo_regions05 %>% group_by(name) %>% summarize() %>% 
  inner_join(measo_names)
# remove temperate areas
measo_shapes<-measo_shapes[-which(
  measo_shapes$name %in% c("AOT","CIT","EIT","WPT","EPT")),]


