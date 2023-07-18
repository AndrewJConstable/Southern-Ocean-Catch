fnBaseRules<-function(CSBdata
                      ,Cbed_rules
){ # start function
  ########################### begin Rules setup #################################
  BaseRules<-NULL
  
  ############################
  # 48.3
  ############################
  
  BaseRules<-c(BaseRules,list(list( # start adding rule
    
    ##############################################################################################
    Rule              = "48B2T_1"
    ,Description       = "Subarea 48.2- groundfish"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"] == "482"  
                            & CSBdata[,"TFN"]==1 
    )
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="48.2" 
                          & Cbed_rules[,"MEASO"]=="AOA"
    ) # end subset
  ))) # end adding rule
  
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48M2T_2"
    ,Description       = "Subarea 48.2- krill - Atlantic Antarctic area"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 2
    ,Subset            = (  CSBdata[,"GAR_Code"] == "482"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==2 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (Cbed_rules[,"ASD"]=="48.2" 
                           & Cbed_rules[,"MEASO"]=="AOA"
    ) # end subset
  ))) # end adding rule
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48L2_3"
    ,Description       = "Subarea 48.2- krill - Atlantic Antarctic area"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"] == "482"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==3 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset   
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="48.2" 
                          & Cbed_rules[,"MEASO"]=="AOA"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48M2T_k"
    ,Description       = "Subarea 48.2- krill - Atlantic Antarctic area"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"] == "482"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==7 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (Cbed_rules[,"ASD"]=="48.2" 
                           & Cbed_rules[,"MEASO"]=="AOA"
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48L2_c"
    ,Description       = "Subarea 48.2- crabs - Atlantic Antarctic area"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 8
    ,Subset            = (  CSBdata[,"GAR_Code"] == "482"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==9 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset   
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="48.2" 
                          & Cbed_rules[,"MEASO"]=="AOA"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48L4"
    ,Description       = "Subarea 48.4- toothfish"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"] == "484"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==3 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="48.4" 
                          & Cbed_rules[,"MEASO"]=="AOA"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48M4"
    ,Description       = "Subarea 48.4- krill"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"] == "484"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==7 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (Cbed_rules[,"ASD"]=="48.4" 
                           & Cbed_rules[,"MEASO"]=="AOA"
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48M5"
    ,Description       = "Subarea 48.5- krill"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"] == "485"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==7 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (Cbed_rules[,"ASD"]=="48.5" 
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48L5"
    ,Description       = "Subarea 48.5- toothfish"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"] == "485"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==3 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (Cbed_rules[,"ASD"]=="48.5" 
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48L6"
    ,Description       = "Subarea 48.6- toothfish"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"] == "486"
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==3 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="48.6" 
                          & Cbed_rules[,"MEASO"]=="AOA"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48M6"
    ,Description       = "Subarea 48.6- krill"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"] == "486"
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==7 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (Cbed_rules[,"ASD"]=="48.6"
                           & Cbed_rules[,"MEASO"]=="AOA"
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48M6_S"
    ,Description       = "Subarea 48.6- silverfish"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 4    #???
    ,Subset            = (  CSBdata[,"GAR_Code"] == "486"
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==5 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="48.6"
                          & Cbed_rules[,"MEASO"]=="AOA"
                          & Cbed_rules[,"Lat"] < -60
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48B3T"
    ,Description       = "Subarea 48.3- groundfish"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "483"
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"] == 1 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (Cbed_rules[,"ASD"]=="48.3" 
                           & Cbed_rules[,"MEASO"]=="AOS"
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48M3T_k"
    ,Description       = "Subarea 48.3- krill"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "483"
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==7 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (Cbed_rules[,"ASD"]=="48.3" 
                           & (Cbed_rules[,"SSMU"]=="SGE" | Cbed_rules[,"SSMU"]=="SGW" )
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48M3T_m"
    ,Description       = "Subarea 48.3- myctophids"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 5
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "483"
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==6 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="48.3" 
                          & Cbed_rules[,"MEASO"]=="AOS"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48B3T_i"
    ,Description       = "Subarea 48.3- icefish"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 2
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "483"
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==2 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="48.3" 
                          & Cbed_rules[,"MEASO"]=="AOS"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48M3T_sq"
    ,Description       = "Subarea 48.3- squid"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 7
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "483"
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==8 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="48.3" 
                          & Cbed_rules[,"MEASO"]=="AOS"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48L3C"
    ,Description       = "Subarea 48.3- crabs"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 8
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "483"
                            & CSBdata[,"TFN"]==9 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="48.3" 
                          & Cbed_rules[,"MEASO"]=="AOS"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48L3T"
    ,Description       = "Subarea 48.3- toothfish"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "483"
                            & CSBdata[,"TFN"]==3 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="48.3" 
                          & Cbed_rules[,"MEASO"]=="AOS"
                          & Cbed_rules[,"Lat"] < -52    # avoid Morris-Ewing Bank
    ) # end subset 
  ))) # end adding rule
  
  ################
  # Bottom fishing
  ################
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48B0T"
    ,Description       = "Area 48-trawl-SUN-all of Area 48"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 1 
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "48"
                            & CSBdata[,"GTY_rev"]      == "OTB"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN"
                            #            & CSBdata[,"TFN"]          == 1
                            #            & CSBdata[,"Split_Year"]   == 1986
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (((Cbed_rules[,"ASD"]=="48.1" & 
                               (     (    Cbed_rules[,"SSMU"]=="APBSE" 
                                          & Cbed_rules[,"Lon"]>-56 
                                          & Cbed_rules[,"Lat"]>-63.3)
                                     | (    Cbed_rules[,"SSMU"]=="APE"   
                                            & Cbed_rules[,"Lon"]>-56
                                            & Cbed_rules[,"Lat"]>-63.3) 
                               ) 
                             |  Cbed_rules[,"SSMU"]=="APDPW" 
                             |  Cbed_rules[,"SSMU"]=="APDPE" 
                             |  Cbed_rules[,"SSMU"]=="APEI"   )
                            | (Cbed_rules[,"ASD"]=="48.2" & 
                                 ( Cbed_rules[,"SSMU"]=="SOW" 
                                   |  Cbed_rules[,"SSMU"]=="SONE"))
                            | Cbed_rules[,"ASD"]=="48.3")
                           
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48B1L"
    ,Description       = "Subarea 48.1-longline-Chile - WG-FSA-98/20 - South Shetlands." # was really pots but sticking with the Bulletin here.
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "481"
                            & CSBdata[,"GTY_rev"]      == "LLS"
                            & CSBdata[,"Flag_CTY_Code"]== "CHL"
                            #            & CSBdata[,"TFN"]          == 3
                            #            & CSBdata[,"Split_Year"]   == 1998
    ) # end RuleSubset  
    ,CbedAreaSubset    =  ((Cbed_rules[,"ASD"]=="48.1" & 
                              (  Cbed_rules[,"SSMU"]=="APDPW" 
                                 |  Cbed_rules[,"SSMU"]=="APDPE" 
                                 |  Cbed_rules[,"SSMU"]=="APEI"   ))
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48B1T"
    ,Description       = "Subarea 48.1-trawl-spread around finfishing grounds according to Kock, 1992."
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "481"
                            & CSBdata[,"GTY_rev"]      == "OTB"
                            #            & CSBdata[,"Flag_CTY_Code"]
                            #            & CSBdata[,"TFN"]         
                            #            & CSBdata[,"Split_Year"]   
    ) # end RuleSubset  
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="48.1" & 
                             ( (Cbed_rules[,"SSMU"]=="APBSE" & Cbed_rules[,"Lon"]>-56 & Cbed_rules[,"Lat"]>-63.3) |
                                 (Cbed_rules[,"SSMU"]=="APE"   & Cbed_rules[,"Lon"]>-56 & Cbed_rules[,"Lat"]>-63.3) ) | 
                             Cbed_rules[,"SSMU"]=="APDPW" | 
                             Cbed_rules[,"SSMU"]=="APDPE" | 
                             Cbed_rules[,"SSMU"]=="APEI"   )
    ) # end subset
  ))) # end adding rule
  
  ##################
  # Midwater fishing
  ##################
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48M0T"
    ,Description       = "Area 48-trawl-SUN-all of Area 48 - based on B01"
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "48"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & ( CSBdata[,"Flag_CTY_Code"]== "SUN" | CSBdata[,"Flag_CTY_Code"]== "LVA")
                            #            & CSBdata[,"TFN"]          == 1 | CSBdata[,"TFN"] == 7)
                            #            & CSBdata[,"Split_Year"]   <= 1978  and Latvia in 1993
    ) # end RuleSubset  
    ,CbedAreaSubset    = (((Cbed_rules[,"ASD"]=="48.1" & 
                              (     (    Cbed_rules[,"SSMU"]=="APBSE" 
                                         & Cbed_rules[,"Lon"]>-56 
                                         & Cbed_rules[,"Lat"]>-63.3)
                                    | (    Cbed_rules[,"SSMU"]=="APE"   
                                           & Cbed_rules[,"Lon"]>-56
                                           & Cbed_rules[,"Lat"]>-63.3) 
                              ) 
                            |  Cbed_rules[,"SSMU"]=="APDPW" 
                            |  Cbed_rules[,"SSMU"]=="APDPE" 
                            |  Cbed_rules[,"SSMU"]=="APEI"   )
                           |   (Cbed_rules[,"ASD"]=="48.2" & 
                                  ( Cbed_rules[,"SSMU"]=="SOW" 
                                    |  Cbed_rules[,"SSMU"]=="SONE"))| 
                             Cbed_rules[,"ASD"]=="48.3")
                          
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "48M1T"
    ,Description       = "Subarea 48.1-trawl-  less eastern areas south of latitude of Joinville Island."
    ,ASDstatArea       = 48
    ,TypeDepthInterval = 9
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "481"
                            & ( CSBdata[,"GTY_rev"]      == "OTM" | CSBdata[,"GTY_rev"] == "TM" | CSBdata[,"GTY_rev"] == "TMB")
                            #            & CSBdata[,"Flag_CTY_Code"]
                            #            & CSBdata[,"TFN"]         
                            #            & CSBdata[,"Split_Year"]   
    ) # end RuleSubset  
    ,CbedAreaSubset    =  ((Cbed_rules[,"ASD"]=="48.1"  
                            
                            & !(    Cbed_rules[,"SSMU"]=="APE" # Antarctic Peninsula East 
                                    & Cbed_rules[,"Lat"] < -63.3)
                            
                            &!(    Cbed_rules[,"SSMU"]=="APPA" # Antarctic Peninsula Pelagic Area  
                                   & Cbed_rules[,"Lon"] > -57
                                   & Cbed_rules[,"Lat"] < -63.3) 
    ) 
    ) # end subset
  ))) # end adding rule
  
  ############################
  ############################
  # Area 58 
  ############################
  # General distribution rules
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B42T_G"
    ,Description       = "Division 58.4.2 - groundfish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"] == "5842"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==1 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="58.4.2" 
                          & Cbed_rules[,"MEASO"]=="CIA"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B42T_I"
    ,Description       = "Division 58.4.2 - icefish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 2
    ,Subset            = (  CSBdata[,"GAR_Code"] == "5842"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==2 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="58.4.2" 
                          & Cbed_rules[,"MEASO"]=="CIA"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58L42"
    ,Description       = "Division 58.4.2 - toothfish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"] == "5842"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==3 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (Cbed_rules[,"ASD"]=="58.4.2" 
                           & Cbed_rules[,"MEASO"]=="CIA"
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M42_S"
    ,Description       = "Division 58.4.2 - silverfish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 4
    ,Subset            = (  CSBdata[,"GAR_Code"] == "5842"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==5 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="58.4.2" 
                          & Cbed_rules[,"MEASO"]=="CIA"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M42_K"
    ,Description       = "Division 58.4.2 - krill"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"] == "5842"  
                            #          & CSBdata[,"GTY_rev"]      
                            #          & CSBdata[,"Flag_CTY_Code"]
                            & CSBdata[,"TFN"]==7 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="58.4.2" 
                          & Cbed_rules[,"MEASO"]=="CIA"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B5T_G"
    ,Description       = "Subareas 58.5 -groundfish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            = (  ( CSBdata[,"GAR_Code"] == "585"  
                              | CSBdata[,"GAR_Code"] == "5851"  
                              | CSBdata[,"GAR_Code"] == "5852"  
    )
    & CSBdata[,"TFN"] == 1
    ) # end RuleSubset  
    ,CbedAreaSubset    =  ((Cbed_rules[,"ASD"]=="58.5" | Cbed_rules[,"ASD"]=="58.5.1" | Cbed_rules[,"ASD"]=="58.5.2")
                           & Cbed_rules[,"MEASO"]=="CIS"
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B5T_I"
    ,Description       = "Subareas 58.5 -icefish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 2
    ,Subset            =(  ( CSBdata[,"GAR_Code"] == "585"  
                             | CSBdata[,"GAR_Code"] == "5851"  
                             | CSBdata[,"GAR_Code"] == "5852"  
    )
    & CSBdata[,"TFN"] == 2
    ) # end RuleSubset   
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="58.5" | Cbed_rules[,"ASD"]=="58.5.1" | Cbed_rules[,"ASD"]=="58.5.2")
                          & Cbed_rules[,"MEASO"]=="CIS"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58L5_T"
    ,Description       = "Subareas 58.5 -toothfish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 3
    ,Subset            = (  ( CSBdata[,"GAR_Code"] == "585"  
                              | CSBdata[,"GAR_Code"] == "5851"  
                              | CSBdata[,"GAR_Code"] == "5852"  
    )
    & CSBdata[,"TFN"] == 3
    ) # end RuleSubset  
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="58.5" | Cbed_rules[,"ASD"]=="58.5.1" | Cbed_rules[,"ASD"]=="58.5.2")
                          & Cbed_rules[,"MEASO"]=="CIS"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58L6"
    ,Description       = "Subareas 58.6 -toothfish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 3
    ,Subset            = (  ( CSBdata[,"GAR_Code"] == "586"
    )
    & CSBdata[,"TFN"] == 3
    ) # end RuleSubset  
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="58.6" )
                          & Cbed_rules[,"MEASO"]=="CIS"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B6T"
    ,Description       = "Subareas 58.6 -groundfish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            =  (  ( CSBdata[,"GAR_Code"] == "586"
    )
    & CSBdata[,"TFN"] == 1
    ) # end RuleSubset 
    ,CbedAreaSubset    =  ((Cbed_rules[,"ASD"]=="58.6" )
                           & Cbed_rules[,"MEASO"]=="CIS"
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58L43_T"
    ,Description       = "Subareas 58.4.3 -toothfish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 3
    ,Subset            =  (  ( CSBdata[,"GAR_Code"] == "5843a"
                               | CSBdata[,"GAR_Code"] == "5843b"
    )
    & CSBdata[,"TFN"] == 3
    ) # end RuleSubset 
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="58.4.3a" | Cbed_rules[,"ASD"]=="58.4.3b" )
                          & Cbed_rules[,"MEASO"]=="CIS"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B44T"
    ,Description       = "Subareas 58.4.4 -groundfish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            = (  (CSBdata[,"GAR_Code"] == "5844a"
                             | CSBdata[,"GAR_Code"] == "5844b"
    )
    & CSBdata[,"TFN"] == 1
    ) # end RuleSubset  
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="58.4.4")
                          & Cbed_rules[,"MEASO"]=="CIS"
    ) # end subset 
  ))) # end adding rule
  
  ######################## the problem #############################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M44T"
    ,Description       = "Subareas 58.4.4 -krill"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 6
    ,Subset            = (  (CSBdata[,"GAR_Code"] == "5844a"
                             | CSBdata[,"GAR_Code"] == "5844b"
    )
    & CSBdata[,"TFN"] == 7
    ) # end RuleSubset  
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="58.4.4")
                          & Cbed_rules[,"MEASO"]=="CIA"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58L44_T"
    ,Description       = "Subareas 58.4.4 -toothfish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 3
    ,Subset            =  (  (CSBdata[,"GAR_Code"] == "5844a"
                              | CSBdata[,"GAR_Code"] == "5844b"
    )
    & CSBdata[,"TFN"] == 3
    ) # end RuleSubset 
    ,CbedAreaSubset    =  ((Cbed_rules[,"ASD"]=="58.4.4")
                           & Cbed_rules[,"MEASO"]=="CIS"
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58L7_T"
    ,Description       = "Subareas 58.7 -toothfish"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 3
    ,Subset            = (  (CSBdata[,"GAR_Code"] == "587"
                             | CSBdata[,"GAR_Code"] == "587"
    )
    & CSBdata[,"TFN"] == 3
    ) # end RuleSubset  
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="58.7")
                          & Cbed_rules[,"MEASO"]=="CIN"
    ) # end subset 
  ))) # end adding rule
  
  ################
  # Bottom fishing
  ################
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B0T_S"
    ,Description       = "Area 58-trawl-SUN-finfish-concentrated in subantarctic areas. No record of 58.7"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "58"
                            & CSBdata[,"GTY_rev"]      == "OTB"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN"
                            & CSBdata[,"TFN"]          == 1
                            & CSBdata[,"Split_Year"]   < 1978
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (
      (  Cbed_rules[,"ASD"]=="58.4.1"
         | Cbed_rules[,"ASD"]=="58.4.2"
         | Cbed_rules[,"ASD"]=="58.4.3a"
         | Cbed_rules[,"ASD"]=="58.4.3b"
         | Cbed_rules[,"ASD"]=="58.4.4"
         | Cbed_rules[,"ASD"]=="58.5.1"
         | Cbed_rules[,"ASD"]=="58.5.2"
         | Cbed_rules[,"ASD"]=="58.6"
      )
      & Cbed_rules[,"MEASO"]=="CIS"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B0T_Sa"
    ,Description       = "Area 58-trawl-SUN-subantarctci finfish (inspected data) but with Antarctic krill in 1978 & 1979" # adjust effort
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "58"
                            & CSBdata[,"GTY_rev"]      == "OTB"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN"
                            & CSBdata[,"TFN"]          == 1
                            & ( CSBdata[,"Split_Year"]   == 1978 | CSBdata[,"Split_Year"]   == 1979 )
    ) # end RuleSubset  
    ,CbedAreaSubset    =   (
      (  Cbed_rules[,"ASD"]=="58.4.1"
         | Cbed_rules[,"ASD"]=="58.4.2"
         | Cbed_rules[,"ASD"]=="58.4.3a"
         | Cbed_rules[,"ASD"]=="58.4.3b"
         | Cbed_rules[,"ASD"]=="58.4.4"
         | Cbed_rules[,"ASD"]=="58.5.1"
         | Cbed_rules[,"ASD"]=="58.5.2"
         | Cbed_rules[,"ASD"]=="58.6"
      )
      & Cbed_rules[,"MEASO"]=="CIS"
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B41L"
    ,Description       = "Division 58.4.1-longline-sea ice made fishing variable in location across SSRUs" 
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "5841"
                            & CSBdata[,"GTY_rev"]      == "LLS"
                            & !(CSBdata[,"Flag_CTY_Code"]== "NZL")
                            #       & CSBdata[,"TFN"]          == 3
                            #       & CSBdata[,"Split_Year"]   == 1980
    ) # end RuleSubset  
    ,CbedAreaSubset    = ((  Cbed_rules[,"ASD"]=="58.4.1" 
                             & (  Cbed_rules[,"SSRU"]=="5841C" 
                                  | Cbed_rules[,"SSRU"]=="5841E"  
                                  | Cbed_rules[,"SSRU"]=="5841G"
                             )
    )
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B41L_EI"
    ,Description       = "Area 58.4.1-longline-NZ- work close to Ross Sea"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "5841"
                            & CSBdata[,"GTY_rev"]      == "LLS"
                            & CSBdata[,"Flag_CTY_Code"]== "NZL"
                            #       & CSBdata[,"TFN"]          == 3
                            #       & CSBdata[,"Split_Year"]   == 1980
    ) # end RuleSubset  
    ,CbedAreaSubset    = (  ( Cbed_rules[,"ASD"]=="58.4.1" 
                              &(  Cbed_rules[,"SSRU"]=="5841C" 
                                  | Cbed_rules[,"SSRU"]=="5841E"  
                                  | Cbed_rules[,"SSRU"]=="5841G"
                              )
    ) 
    & Cbed_rules[,"MEASO"]=="EIA"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B41T_CI"
    ,Description       = "Area 58.4.1-trawl-Aus- south of BANZARE Bank"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "5841"
                            & CSBdata[,"GTY_rev"]      == "OTB"
                            & CSBdata[,"Flag_CTY_Code"]== "AUS"
                            #       & CSBdata[,"TFN"]          == 1
                            #       & CSBdata[,"Split_Year"]   == 1980
    ) # end RuleSubset  
    ,CbedAreaSubset    = (((  Cbed_rules[,"ASD"]=="58.4.1" 
    ) & Cbed_rules[,"MEASO"]=="CIS")
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B43_S"
    ,Description       = "Division 58.4.3 - AUS trawl"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"] == "5843"  
                            & (CSBdata[,"GTY_rev"]  == "OTB" | CSBdata[,"GTY_rev"]  == "OTM" )     
                            & CSBdata[,"Flag_CTY_Code"] == "AUS"
                            #          & CSBdata[,"TFN"] 
                            #          & CSBdata[,"Split_Year"] 
    ) # end RuleSubset  
    ,CbedAreaSubset    = (((  Cbed_rules[,"ASD"]=="58.4.3a" | Cbed_rules[,"ASD"]=="58.4.3b"
    ) & Cbed_rules[,"MEASO"]=="CIS")
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B44_S"
    ,Description       = "Division 58.4.4 - Japan bottom trawling - Central Indian Subantarctic area"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"] == "5844"  
                            & CSBdata[,"GTY_Code"]  == "OTB"
                            & CSBdata[,"Flag_CTY_Code"] == "JPN"
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (((  Cbed_rules[,"ASD"]=="58.4.4"
    ) & Cbed_rules[,"MEASO"]=="CIS")
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58B4T_A"
    ,Description       = "Subarea 58.4-trawl-SUN-icefish from continental shelf"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "584"
                            & CSBdata[,"GTY_rev"]      == "OTB"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN"
                            & CSBdata[,"TFN"]          == 1
                            & ( CSBdata[,"Split_Year"]   == 1985 | CSBdata[,"Split_Year"]   == 1987 )
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (((  Cbed_rules[,"ASD"]=="58.4.4"
    ) & Cbed_rules[,"MEASO"]=="CIS")
    ) # end subset
  ))) # end adding rule
  
  ############################
  # Midwater fishing
  ############################
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M0T"
    ,Description       = "Area 58-trawl-SUN-early years were in subantarctic"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "58"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN"
                            & CSBdata[,"TFN"]          == 1
                            & CSBdata[,"Split_Year"]   == 1979
    ) # end RuleSubset  
    ,CbedAreaSubset    = (
      (  Cbed_rules[,"ASD"]=="58.4.1"
         | Cbed_rules[,"ASD"]=="58.4.2"
         | Cbed_rules[,"ASD"]=="58.4.3a"
         | Cbed_rules[,"ASD"]=="58.4.3b"
         | Cbed_rules[,"ASD"]=="58.4.4"
         | Cbed_rules[,"ASD"]=="58.5.1"
         | Cbed_rules[,"ASD"]=="58.5.2"
         | Cbed_rules[,"ASD"]=="58.6"
      )
      & Cbed_rules[,"MEASO"]=="CIS"
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M0T_CIA"
    ,Description       = "Area 58-trawl-SUN-subantarctci finfish (inspected data) but with Antarctic krill in 1978 & 1979"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "58"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN"
                            & CSBdata[,"TFN"]          == 7
                            & ( CSBdata[,"Split_Year"]   == 1978 | CSBdata[,"Split_Year"]   == 1979 )
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (
      (  Cbed_rules[,"ASD"]=="58.4.1"
         | Cbed_rules[,"ASD"]=="58.4.2"
         | Cbed_rules[,"ASD"]=="58.4.3a"
         | Cbed_rules[,"ASD"]=="58.4.3b"
         | Cbed_rules[,"ASD"]=="58.4.4"
         | Cbed_rules[,"ASD"]=="58.5.1"
         | Cbed_rules[,"ASD"]=="58.5.2"
         | Cbed_rules[,"ASD"]=="58.6"
      )
      & Cbed_rules[,"MEASO"]=="CIA"
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M41T"
    ,Description       = "Division 58.4.1-krill-relative areas-depth:1000-4000m" # Nicol et al 2000 @RN8348
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "5841"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & (CSBdata[,"Flag_CTY_Code"]== "JPN" | CSBdata[,"Flag_CTY_Code"]== "CHN")
                            & CSBdata[,"TFN"]          == 7
                            & !( CSBdata[,"Split_Year"]   == 1976 | CSBdata[,"Split_Year"]   == 1982 | CSBdata[,"Split_Year"]   == 1984 )
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="58.4.1"
                          & (Cbed_rules[,"MEASO"]=="CIA" |  Cbed_rules[,"MEASO"]=="EIA")  # need to not include northern banks and seamounts
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M41Ta"
    ,Description       = "Division 58.4.1-trawl-SUN likely near Prydz Bay"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 4
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "5841"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN" 
                            & (CSBdata[,"Split_Year"]==1983 | CSBdata[,"Split_Year"]==1984)
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="58.4.1"
                          & (Cbed_rules[,"MEASO"]=="CIA")  # need to not include northern banks and seamounts
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M41Tb"
    ,Description       = "Division 58.4.1-trawl-SUN likely near Prydz Bay"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "5841"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN" 
                            & CSBdata[,"Split_Year"]==1990
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="58.4.1"
                          & (Cbed_rules[,"MEASO"]=="CIA")  # need to not include northern banks and seamounts
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M41T_CI"
    ,Description       = "Division 58.4.1-krill-Japan-in CIA as activities in west of division."
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "5841"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "JPN" 
                            & CSBdata[,"Split_Year"]==1976
    ) # end RuleSubset  
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="58.4.1"
                          & (Cbed_rules[,"MEASO"]=="CIA")  # need to not include northern banks and seamounts
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M41T_EI"
    ,Description       = "Division 58.4.1-krill-Japan-in EIA as activities in East of division."
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "5841"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "JPN" 
                            & (CSBdata[,"Split_Year"]==1982 | CSBdata[,"Split_Year"]==1984)
    ) # end RuleSubset   
    ,CbedAreaSubset    = (Cbed_rules[,"ASD"]=="58.4.1"
                          & (Cbed_rules[,"MEASO"]=="EIA")  # need to not include northern banks and seamounts
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M43_A"
    ,Description       = "Division 58.4.3 - krill - Central Indian Antarctic area"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"] == "5843"  
                            & CSBdata[,"GTY_rev"]  == "OTM"
                            & CSBdata[,"Flag_CTY_Code"] == "JPN"
    ) # end RuleSubset  
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="58.4.3a" | Cbed_rules[,"ASD"]=="58.4.3b")
                          & (Cbed_rules[,"MEASO"]=="CIA")  # need to not include northern banks and seamounts
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M44_A"
    ,Description       = "Division 58.4.4 - krill fishing - Central Indian Antarctic area"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"] == "5844"  
                            & CSBdata[,"GTY_Code"]  == "OTM"
                            & CSBdata[,"Flag_CTY_Code"] == "JPN"
    ) # end RuleSubset  
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="58.4.4")
                          & (Cbed_rules[,"MEASO"]=="CIA")  # need to not include northern banks and seamounts
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M4T"
    ,Description       = "Subarea 58.4-krill-Korea-unknown so distributed throughout 58.4.1 and 58.4.2"  # as if a single voyage along the coast
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "584"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "KOR"
                            & CSBdata[,"TFN"]          == 7
                            #      & CSBdata[,"Split_Year"]   1979-1984
    ) # end RuleSubset  
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="58.4.1" | Cbed_rules[,"ASD"]=="58.4.2")
                          & (Cbed_rules[,"MEASO"]=="CIA" |  Cbed_rules[,"MEASO"]=="EIA")  # need to not include northern banks and seamounts
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M4T_A"
    ,Description       = "Subarea 58.4-trawl-France-krill catch"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "584"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "FRA"
                            & CSBdata[,"TFN"]          == 7
                            & CSBdata[,"Split_Year"]   == 1980
    ) # end RuleSubset  
    ,CbedAreaSubset    = ((Cbed_rules[,"ASD"]=="58.4.4")
                          & (Cbed_rules[,"MEASO"]=="CIS")  
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "58M4T_CI"
    ,Description       = "Subarea 58.4-krill-SUN-likely from Prydz Bay"
    ,ASDstatArea       = 58
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "584"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN"
    ) # end RuleSubset   
    ,CbedAreaSubset    = (
      (  Cbed_rules[,"ASD"]=="58.4.1"
         | Cbed_rules[,"ASD"]=="58.4.2"
         | Cbed_rules[,"ASD"]=="58.4.3a"
         | Cbed_rules[,"ASD"]=="58.4.3b"
         | Cbed_rules[,"ASD"]=="58.4.4"
      )
      & (Cbed_rules[,"MEASO"]=="CIA")  # need to not include northern banks and seamounts
    ) # end subset 
  ))) # end adding rule
  
  ############################
  ############################
  ### Area 88  
  
  ############################
  # Bottom Fishing
  ############################
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88B0T"
    ,ASDstatArea       = 88
    ,Description       = "Area 88-trawl-POL-likely in 88.3 as extension of 48.1 research"  # when scrutinised for taxa and monthly sequence
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "88"
                            & CSBdata[,"GTY_rev"]      == "OTB"
                            & CSBdata[,"Flag_CTY_Code"]== "POL"
                            & CSBdata[,"TFN"]          == 1
                            & CSBdata[,"Split_Year"]   == 1978
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (Cbed_rules[,"ASD"]=="88.3"
                           & (Cbed_rules[,"MEASO"]=="EPA")  # need to not include northern banks and seamounts
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88B1L_WP"
    ,Description       = "Subarea 88.1-longline-fishery concentrated south of 65oS and east of Cape Adare."
    ,ASDstatArea       = 88
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "881"
                            & ( CSBdata[,"GTY_rev"]    == "LLS" | CSBdata[,"GTY_rev"]=="FPO")
    ) # end RuleSubset  
    ,CbedAreaSubset    =  ( Cbed_rules[,"ASD"]=="88.1"
                            & (Cbed_rules[,"MEASO"]=="WPA")  # need to not include northern banks and seamounts
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88B1T"
    ,Description       = "Subarea 88.1-trawl-NZ-CAMLR research survey in Ross Sea"
    ,ASDstatArea       = 88
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "881"
                            & CSBdata[,"GTY_rev"]      == "OTB"
                            & CSBdata[,"Flag_CTY_Code"]== "NZL"
    ) # end RuleSubset  
    ,CbedAreaSubset    = ( Cbed_rules[,"ASD"]=="88.1"
                           & (Cbed_rules[,"MEASO"]=="WPA") 
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88B2L"
    ,Description       = "Subarea 8821-longline-sea ice made fishing variable in location across SSRUs" 
    ,ASDstatArea       = 88
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "882"
                            & CSBdata[,"GTY_rev"]      == "LLS"
    ) # end RuleSubset  
    ,CbedAreaSubset    =  (  Cbed_rules[,"ASD"]=="88.2" 
                             & (  Cbed_rules[,"SSRU"]=="882C" 
                                  | Cbed_rules[,"SSRU"]=="882D"  
                                  | Cbed_rules[,"SSRU"]=="882E"
                                  | Cbed_rules[,"SSRU"]=="882F"
                                  | Cbed_rules[,"SSRU"]=="882G"
                             )
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88B3_A"
    ,Description       = "Subarea 88.3 - all fishing - East Pacific Antarctic area"
    ,ASDstatArea       = 88
    ,TypeDepthInterval = 3
    ,Subset            =  (  CSBdata[,"GAR_Code"] == "883"  
                             & CSBdata[,"GTY_rev"]  == "LLS"      
                             & (CSBdata[,"Flag_CTY_Code"] == "NZL"  | CSBdata[,"Flag_CTY_Code"] == "RUS")
    ) # end RuleSubset 
    ,CbedAreaSubset    =  ( Cbed_rules[,"ASD"]=="88.3"
                            & (Cbed_rules[,"MEASO"]=="EPA") 
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88B3L"
    ,Description       = "Subarea 88.3-longline-Korea-Research fishing in research blocks- see SC-CAMLR (2015, 2016)"
    ,ASDstatArea       = 88
    ,TypeDepthInterval = 3
    ,Subset            =  (  CSBdata[,"GAR_Code"]     == "883"
                             & CSBdata[,"GTY_rev"]      == "LLS"
                             & CSBdata[,"Flag_CTY_Code"]== "KOR"
    ) # end RuleSubset 
    ,CbedAreaSubset    = ( Cbed_rules[,"ASD"]=="88.3"
                           & (Cbed_rules[,"MEASO"]=="EPA") 
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88B3La"
    ,Description       = "Subarea 88.3-longline-Chile - WG-FSA-98/20 - South Shetlands extension" # was really pots but sticking with the Bulletin here.
    ,ASDstatArea       = 88
    ,TypeDepthInterval = 3
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "883"
                            & CSBdata[,"GTY_rev"]      == "LLS"
                            & CSBdata[,"Flag_CTY_Code"]== "CHL"
    ) # end RuleSubset  
    ,CbedAreaSubset    =  ( Cbed_rules[,"ASD"]=="88.3"
                            & (Cbed_rules[,"MEASO"]=="EPA") 
    ) # end subset
  ))) # end adding rule
  
  ############################
  # Midwater Fishing
  ############################
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88M0T"
    ,Description       = "Area 88-trawl-SUN- assuming western margins of Ross Sea" # based on @RN13714  & @RN13715  
    ,ASDstatArea       = 88
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "88"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN"
    ) # end RuleSubset  
    ,CbedAreaSubset    =  ((Cbed_rules[,"ASD"]=="88.1" 
                            & ( Cbed_rules[,"SSRU"]=="881D" 
                                | Cbed_rules[,"SSRU"]=="881E"
                                | Cbed_rules[,"SSRU"]=="881F"
                                | Cbed_rules[,"SSRU"]=="881G"
                                | Cbed_rules[,"SSRU"]=="881H"
                                | Cbed_rules[,"SSRU"]=="881I"
                                | Cbed_rules[,"SSRU"]=="881J"))  # need to not include northern banks and seamounts
    )# end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88M1T_EI"
    ,Description       = "Subarea 88.1-Trawl-JPN-krill"  # based on SC-III/INF/09
    ,ASDstatArea       = 88
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "881"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "JPN"
    ) # end RuleSubset  
    ,CbedAreaSubset    = ( Cbed_rules[,"ASD"]=="88.1"
                           & (Cbed_rules[,"MEASO"]=="EIA") 
    ) # end subset 
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88M1T_WPa"
    ,Description       = "Subarea 88.1-trawl survey-NZL- Census of Antarctic Marine Life"
    ,ASDstatArea       = 88
    ,TypeDepthInterval = 1
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "881"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "NZL"
                            #        & CSBdata[,"TFN"]          ==  3
                            #        & CSBdata[,"Split_Year"]   
    ) # end RuleSubset  
    ,CbedAreaSubset    =  ( Cbed_rules[,"ASD"]=="88.1"
                            & (Cbed_rules[,"MEASO"]=="WPA") 
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88M1T_WPb"
    ,Description       = "Subarea 88.1-Trawl-SUN-Krill"
    ,ASDstatArea       = 88
    ,TypeDepthInterval = 6
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "881"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN"
    ) # end RuleSubset  
    ,CbedAreaSubset    =  ( Cbed_rules[,"ASD"]=="88.1"
                            & (Cbed_rules[,"MEASO"]=="WPA") 
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88M2T_WPa"
    ,Description       = "Subarea 88.2-Trawl-JPN-Krill-Ross Sea"
    ,TypeDepthInterval = 6
    ,ASDstatArea       = 88
    ,Subset            =  (  CSBdata[,"GAR_Code"]     == "882"
                             & CSBdata[,"GTY_rev"]      == "OTM"
                             & CSBdata[,"Flag_CTY_Code"]== "JPN"
                             #        & CSBdata[,"TFN"]          ==  7
                             #        & CSBdata[,"Split_Year"]   
    ) # end RuleSubset 
    ,CbedAreaSubset    =  ( Cbed_rules[,"ASD"]=="88.2"
                            & (Cbed_rules[,"MEASO"]=="WPA") 
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88M2T_WPb"
    ,Description       = "Subarea 88.2-Trawl-SUN-Krill-Ross Sea"
    ,TypeDepthInterval = 6
    ,ASDstatArea       = 88
    ,Subset            = (  CSBdata[,"GAR_Code"]     == "882"
                            & CSBdata[,"GTY_rev"]      == "OTM"
                            & CSBdata[,"Flag_CTY_Code"]== "SUN"
    ) # end RuleSubset  
    ,CbedAreaSubset    =  ( Cbed_rules[,"ASD"]=="88.2"
                            & (Cbed_rules[,"MEASO"]=="WPA") 
    ) # end subset
  ))) # end adding rule
  
  ##############################################################################################
  BaseRules<-c(BaseRules,list(list( # start adding rule
    Rule              = "88M3_A"
    ,Description       = "Subarea 88.3 - all fishing - East Pacific Antarctic area"
    ,TypeDepthInterval = 9
    ,ASDstatArea       = 88
    ,Subset            = (  CSBdata[,"GAR_Code"] == "883"  
                            & CSBdata[,"GTY_rev"]  == "OTM"      
    ) # end RuleSubset  
    ,CbedAreaSubset    =  ( Cbed_rules[,"ASD"]=="88.3"
                            & (Cbed_rules[,"MEASO"]=="EPA") 
    ) # end subset
  ))) # end adding rule
  return(BaseRules)  
} # end function fnBaseRules