############# data files needed to support analyses #######################

#### Data Input Flags ####

checkTaxa_keepTaxaCodesNotPresent<-FALSE
checkTaxa_keepNewTaxaCodes<-TRUE

#### CCAMLR Statistical Bulletin (CSB) ####
##### Instructions for updating to a different statistical bulletin
# 1. check column headings are the same.  If not, there may be implications for the code

# Volume 34, downloaded 18 July 2023

dirCCAMLRstatisticalBulletin<-"/Users/andreworca/Desktop/_w/_d/CCAMLR_Statistical_Bulletin_Volume_34/catch_and_effort/"

CDcatch           <-read.csv2(paste(dirCCAMLRstatisticalBulletin,"catch.csv",sep="")
                              , header = TRUE, sep = ",", dec = ".")
CDeffort          <-read.csv2(paste(dirCCAMLRstatisticalBulletin,"effort.csv",sep="")
                              , header = TRUE, sep = ",", dec = ".")
CRcountry         <-read.csv2(paste(dirCCAMLRstatisticalBulletin,"country.csv",sep="")
                              , header = TRUE, sep = ",", dec = ".")
CRfishingPurpose  <-read.csv2(paste(dirCCAMLRstatisticalBulletin,"fishing_purpose.csv",sep="")
                              , header = TRUE, sep = ",", dec = ".")
CRfishingGear     <-read.csv2(paste(dirCCAMLRstatisticalBulletin,"fishing_gear.csv",sep="")
                              , header = TRUE, sep = ",", dec = ".")
CRasd             <-read.csv2(paste(dirCCAMLRstatisticalBulletin,"area.csv",sep="") 
                              , header = TRUE, sep = ",", dec = ".")
CRvesselSize      <-read.csv2(paste(dirCCAMLRstatisticalBulletin,"vessel_size.csv",sep="")
                              , header = TRUE, sep = ",", dec = ".")
CRtaxa            <-read.csv2(paste(dirCCAMLRstatisticalBulletin,"taxon.csv",sep="")
                              , header = TRUE, sep = ",", dec = ".")

#### Create CSB_taxa from CSB file and grouping file ####
# Steps:
#   place file of taxon groups in '.\In' folder - requires two variables taxon_code, Taxa_Group
#   run this code
#   check taxon codes have not been altered and add taxon groupings for analysis as needed  if so add assignment in group input file & rerun this code

      fileTaxonGroups<-"CSB_taxon_to_Groups.csv"

   if (!file.exists(file.path(dirIn,fileTaxonGroups)))  "Taxon Group file does not exist in In directory" else {
     TaxonGroups<-read.csv2(file.path(dirIn,fileTaxonGroups), header = TRUE, sep = ",", dec = ".")
     CSB_taxa<-merge(CRtaxa,subset(TaxonGroups,select= -c(taxon_scientific_name,taxon_vernacular_name)),by=c("taxon_code"),all=TRUE)
     TaxaCheck<-CSB_taxa
     # check taxon codes no longer present (or have changed)

     Taxon_Codes_Not_Present<-!(CSB_taxa[,"taxon_code"] %in% CRtaxa[,"taxon_code"])
     if(sum(Taxon_Codes_Not_Present)>1) {
        print("Taxon Codes no longer present - check variable ABSENT in file")
        print(file.path(dirIn,"file_check_taxa","taxa_missing.csv"))
        vNames<-c(dimnames(TaxaCheck)[[2]],"ABSENT")
        TaxaCheck<-cbind(TaxaCheck,rep(0,nrow(TaxaCheck)))
        dimnames(TaxaCheck)[[2]]<-vNames
        TaxaCheck[Taxon_Codes_Not_Present,"ABSENT"]<-1
     } else print("Previous Taxon Codes all present")

      # check all taxa have groups
     Taxon_Groups_Not_Present<-is.na(CSB_taxa[,ncol(CSB_taxa)])
     if(sum(Taxon_Groups_Not_Present)>1) {
          print("Not all taxa have been assigned to groups - check variable NO_GROUP in file")
          print(file.path(dirIn,"file_check_taxa","taxa_no_group.csv"))
          vNames<-c(dimnames(TaxaCheck)[[2]],"NO_GROUP")
          TaxaCheck<-cbind(TaxaCheck,rep(0,nrow(TaxaCheck)))
          dimnames(TaxaCheck)[[2]]<-vNames
          TaxaCheck[Taxon_Groups_Not_Present,"NO_GROUP"]<-1
        } else print("All taxa assigned to groups")

if(sum(c(Taxon_Codes_Not_Present,Taxon_Groups_Not_Present))) {
  if (!file.exists(file.path(dirIn,"file_check_taxa"))) dir.create(file.path(dirIn,"file_check_taxa"))
  if(file.exists(file.path(dirIn,"file_check_taxa","taxa_check.csv"))) unlink(file.path(dirIn,"file_check_taxa","taxa_check.csv"))
  write.csv(TaxaCheck,file.path(dirIn,"file_check_taxa","taxa_check.csv"),row.names=FALSE)
   }

  # excluding those not wishing to be kept        
   if(!checkTaxa_keepTaxaCodesNotPresent){
     if(!checkTaxa_keepNewTaxaCodes) CSB_taxa<-CSB_taxa[(!Taxon_Codes_Not_Present & !checkTaxa_keepNewTaxaCodes),] else CSB_taxa<-CSB_taxa[!Taxon_Codes_Not_Present,]
     } 
      
   rm(TaxaCheck,Taxon_Codes_Not_Present,Taxon_Groups_Not_Present,vNames)

   } # end if not file exists


#### Input manual assignment of records to location of fishing gears - bottom (B) or midwater (M) ####
# these files are essential for assignment of ambiguous records in the early years of CCAMLR

if (!file.exists(file.path(dirIn,"B-M Step1.csv")))  "Manual Assignment of Gears for Step 1 does not exist in In directory" else
  data_Location_B_M_Step_1<-read.csv2(file.path(dirIn,"B-M Step1.csv"), header = TRUE, sep = ",", dec = ".")
  
if (!file.exists(file.path(dirIn,"B-M Step2.csv")))  "Manual Assignment of Gears for Step 2 does not exist in In directory" else
  data_Location_B_M_Step_1<-read.csv2(file.path(dirIn,"B-M Step2.csv"), header = TRUE, sep = ",", dec = ".")

##### Input Toothfish IUU catch from CCAMLR Fishery Reports ####

if (!file.exists(file.path(dirIn,"CCAMLR Fishery Reports Toothfish IUU Catch.csv")))  "IUU toothfish catch is not in the In directory" else
  Toothfish_IUU<-read.csv2(file.path(dirIn,"CCAMLR Fishery Reports Toothfish IUU Catch.csv"), header = TRUE, sep = ",", dec = ".")


#### load bathymetry and assign cells to CCAMLR and output shapes ####

# for distribution of catches among MEASO areas
Seabed_file<-"/Users/andreworca/Desktop/_wAAD/_d/seabed GEBCO/GEBCO_cells_ASD_MEASO_ssmu_ssru.rds"

################# input data to support analyses #################


TF_Names<-data.frame(TFn     = c(           1,        2,          3,               4,           5,           6,      7,      8,      9)
                     ,Fishery = c("Groundfish","Icefish","Toothfish","Toothfish IUU","Silverfish","Myctophids","Krill","Squid","Crabs")
                     ,Colour  = c("darkslategray","grey80","bisque3","bisque4","lightsteelblue1","thistle3","coral2","cadetblue4","salmon4"))

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
                            ,"Minimum"    = c(-100,-100, -600,-100,  -1000,  -1000,  -600,-100,-300)
                            ,"Maximum"    = c(-600,-700,-1800,-500,-10000,-4000,-10000,-800,-1000)
)# end data frame
MEASOareas<-as.data.frame(matrix(c(
 "01","AOA","Atlantic",      "Antarctic",            "48",     "black","dashed"          
,"02","AOS","Atlantic",      "Subantarctic",         "48",     "black","solid" 
,"03","AON","Atlantic",      "Northern",             "48",     "black","longdash"
,"04","CIA","Central Indian","Antarctic",            "58",   "sienna2","dashed"
,"05","CIS","Central Indian","Subantarctic",         "58",   "sienna2","solid" 
,"06","CIN","Central Indian","Northern",             "58",   "sienna2","longdash"
,"07","EIA","East Indian",   "Antarctic",            "58",    "green4","dashed"
,"08","EIS","East Indian",   "Subantarctic",    "Outside",    "green4","solid"
,"09","EIN","East Indian",   "Northern",        "Outside",    "green4","longdash"
,"10","WPA","West Pacific",  "Antarctic",            "88",     "blue2","dashed"
,"11","WPS","West Pacific",  "Subantarctic",    "Outside",     "blue2","solid"
,"12","WPN","West Pacific",  "Northern",        "Outside",     "blue2","longdash"
,"13","EPA","East Pacific",  "Antarctic",            "48",      "red3","dashed"
,"14","EPS","East Pacific",  "Subantarctic",         "48",      "red3","solid"
,"15","EPN","East Pacific",  "Northern",        "Outside",      "red3","longdash"
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

#### Map grid and projection ####
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


