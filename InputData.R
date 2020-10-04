############# data files needed to support analyses #######################


# files from CCAMLR Statistical Bulletin 2019

CSBdata           <-read.csv2(paste(WorkDir,'CCAMLR_2019_Stat_Bull_data_Files\\AggregatedFisheryCatch.csv',sep="")
                              , header = TRUE, sep = ",", dec = ".")
CEdata            <-read.csv2(paste(WorkDir,'CCAMLR_2019_Stat_Bull_data_Files\\AggregatedFisheryEffort.csv',sep="")
                              , header = TRUE, sep = ",", dec = ".")
CRcountry         <-read.csv2(paste(WorkDir,'CCAMLR_2019_Stat_Bull_data_Files\\ReferenceDataCountry.csv',sep="")
                              , header = TRUE, sep = ",", dec = ".")
CRfishingActivity <-read.csv2(paste(WorkDir,'CCAMLR_2019_Stat_Bull_data_Files\\ReferenceDataFishingActivity.csv',sep="")
                              , header = TRUE, sep = ",", dec = ".")
CRfishingGear     <-read.csv2(paste(WorkDir,'CCAMLR_2019_Stat_Bull_data_Files\\ReferenceDataFishingGear.csv',sep="")
                              , header = TRUE, sep = ",", dec = ".")
CRgeographicArea  <-read.csv2(paste(WorkDir,'CCAMLR_2019_Stat_Bull_data_Files\\ReferenceDataGeographicArea_to_MEASO.csv',sep="")
                              , header = TRUE, sep = ",", dec = ".")
CRvesselSize      <-read.csv2(paste(WorkDir,'CCAMLR_2019_Stat_Bull_data_Files\\ReferenceDataVesselSize.csv',sep="")
                              , header = TRUE, sep = ",", dec = ".")
CSB_taxa          <-read.csv2(paste(WorkDir,'CCAMLR_2019_Stat_Bull_data_Files\\ReferenceDataTaxon_MEASO.csv',sep="")
                              , header = TRUE, sep = ",", dec = ".")

# files with results from manual assignment of records to location of fishing gears - bottom (B) or midwater (M)
resultsDir<-"C:/_w/_r/Southern-Ocean-Catch/"
data_Location_B_M_Step_1<-read.csv2(paste(resultsDir,'B-M Step1.csv',sep="")
                                    , header = TRUE, sep = ",", dec = ".")
data_Location_B_M_Step_2<-read.csv2(paste(resultsDir,'B-M Step2.csv',sep="")
                                    , header = TRUE, sep = ",", dec = ".")

# for distribution of catches among MEASO areas
Seabed_file<-"C:\\_w\\_d\\seabed GEBCO\\GEBCO_cells_ASD_MEASO_ssmu_ssru.rds"


################# input data to support analyses #################


TF_Names<-data.frame(TFn     = c(           1,        2,          3,           4,           5,      6,      7,      8)
                     ,Fishery = c("Groundfish","Icefish","Toothfish","Silverfish","Myctophids","Krill","Squid","Crabs")
                     ,Colour  = c("darkslategray","grey80","bisque3","lightsteelblue1","thistle3","coral2","cadetblue4","salmon4"))

GT_Names<-data.frame(GTn      = c(   1,    2,    3,    4,   5,   6,    7,    8,   9,   10,  11)
                     ,Gear     = c("TX", "OT","OTB","TBB","OTM","TMB","TM","LLS","FPO","JIG","SX")
                     ,Location = c( "B",  "U",  "B",  "B",  "M",  "M", "M",  "B",  "B",  "M", "M")  # midwater = "M", bottom = "B"
                     ,Colour   = c("grey5","grey20","grey35","grey50","darkslategray4","darkslategray3","darkslategray2","coral3","coral1","orchid3","firebrick"))

CTY_Names<-data.frame(
  CTn      = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26)
  ,CTY_Code = c("ARG", "AUS", "BGR", "CHL", "CHN", "FRA", "DDR", "DEU", "IND", "JPN", "KOR", "LVA", "NAM"
                ,"NOR", "NZL", "PAN", "POL", "RUS", "SUN", "UKR", "ZAF", "ESP", "GBR", "USA", "URY", "VUT")
  ,Colour   = c("grey25", "grey60", "grey25", "grey60", "grey25", "grey60"
                ,"grey25", "grey60", "grey25", "grey60", "grey25", "grey60"
                ,"grey25", "grey60", "grey25", "grey60", "grey25", "grey60"
                ,"grey25", "grey60", "grey25", "grey60", "grey25", "grey60"
                , "grey25", "grey60")
) # end dataframe

############ details for reporting catch composition - BFTaxa ###########################

tCode          <- c("TOP","TOA","GRV","MCC","SRX","RAJ","ANT","WGR","GR2","RFA","GR1","ANI","NOS","BYR","LIC","SRR","NOR"
                    ,"ANS","GHP","NOG","NOT","NOX","ICX","KIF","SGI","SSI","WIC","KRI","LXX","MZZ","TRL","ELC","SQA","SPX","SQS","KCF","KCV")
Catch_Group   <- c(4,5,6,6,7,7,8,6,6,7,6,3,10,7,9,7,1
                   ,12,2,2,2,2,9,9,9,9,9,13,14,16,15,14,17,18,17,11,11)

BT_name                     <- c("Notothenia rossii"
                                 ,"Other Groundfish"
                                 ,"Mackerel Icefish"
                                 ,"Dissostichus eleginoides"
                                 ,"Dissostichus mawsoni"
                                 ,"Grenadiers"
                                 ,"Skates & rays"
                                 ,"Antimora spp."
                                 ,"Other icefish"
                                 ,"Lepidonotothen squamifrons"
                                 ,"Crabs"
                                 ,"Silverfish"
                                 ,"Krill"
                                 ,"Myctophids"
                                 ,"Trematomus spp."
                                 ,"Unknown fish"
                                 ,"Squid"
                                 ,"Salps")

BFTaxa <- data.frame(Code = tCode,Catch_Group) 
Taxon_Name<-BT_name[match(BFTaxa[,"Catch_Group"],c(1:length(BT_name)))]
BFTaxa<-cbind(BFTaxa,Taxon_Name)



############## for distribution of catches amongst MEASO areas ##################################

Depth_intervals<-data.frame("DepthRange" = c("Groundfish","Icefish","Toothfish","Silverfish","Myctophids","Krill","Squid","Crabs","Krill481")
                            ,"Minimum"    = c(-100,-100, -600,-100,  -3000,  -1000,  -600,-100,-300)
                            ,"Maximum"    = c(-600,-700,-1800,-500,-10000,-4000,-10000,-800,-1000)
)# end data frame
MEASOareas<-as.data.frame(matrix(c(
 "01","AOA","Atlantic Ocean","Antarctic",            "48",     "black","dashed"          
,"02","AOS","Atlantic Ocean","Subantarctic",         "48",     "black","solid" 
,"03","AON","Atlantic Ocean","Northern",             "48",     "black","longdash"
,"04","CIA","Central Indian","Antarctic",            "58",   "sienna2","dashed"
,"05","CIS","Central Indian","Subantarctic",         "58",   "sienna2","solid" 
,"06","CIN","Central Indian","Northern",             "58",   "sienna2","longdash"
,"07","EIA","East Indian   ","Antarctic",            "58",    "green4","dashed"
,"08","EIS","East Indian   ","Subantarctic",    "Outside",    "green4","solid"
,"09","EIN","East Indian   ","Northern",        "Outside",    "green4","longdash"
,"10","EPA","East Pacific  ","Antarctic",            "48",      "red3","dashed"
,"11","EPS","East Pacific  ","Subantarctic",         "48",      "red3","solid"
,"12","EPN","East Pacific  ","Northern",        "Outside",      "red3","longdash"
,"13","WPA","West Pacific  ","Antarctic",            "88",     "blue2","dashed"
,"14","WPS","West Pacific  ","Subantarctic",    "Outside",     "blue2","solid"
,"15","WPN","West Pacific  ","Northern",        "Outside",     "blue2","longdash"
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

ASDareas<-matrix(c(  "48.1","481","Antarctic Peninsula"
                     ,"48.2","482","South Orkney Islands"
                     ,"48.3","483","South Georgia Island"
                     ,"48.4","484","South Sandwich Islands"
                     ,"48.5","485","Weddell Sea"
                     ,"48.6","486","Dronning-Maud, Bouvey"
                     ,"58.4.1","5841","East Indian"
                     ,"58.4.2","5842","Western Indian"
                     ,"58.4.3a","5843a","Elan Bank"
                     ,"58.4.3b","5843b","BANZARE Bank"
                     ,"58.4.4","5844","Ob & Lena Banks"
                     ,"58.5.1","5851","Kerguelen Islands"
                     ,"58.5.2","5852","Heard Island and McDonald Islands"
                     ,"58.6","586","Crozet Island"
                     ,"58.7","587","Prince Edward and Marion Islands"
                     ,"88.1","881","Western Ross Sea"
                     ,"88.2","882","Eastern Ross Sea, Amundsen Sea"
                     ,"88.3","883","Bellingshausen Sea"
                     ,"Outside","Outside","not in ASD area"
),byrow=TRUE,ncol=3)
dimnames(ASDareas)[[2]]<-c("Code","CodeAlt","Name")

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

