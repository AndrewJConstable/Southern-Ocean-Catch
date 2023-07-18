fnSetupCatchDistRules<-function(cdata
                                ,Depth_intervals
                                ,Cbed_rules
                                ,AreaGroups
                                ,MEASO
                                ,ASD
){
  
  BaseRules<-fnBaseRules(cdata
                         ,Cbed_rules
  )# end fn call
  
  CatchDistRules <- lapply( BaseRules
                            ,fnCatchDistRule
                            ,Depth_intervals
                            ,Cbed_rules
                            ,AreaGroups
                            ,MEASO
                            ,ASD
  )# end lapply
  return(CatchDistRules)  
} # end fnSetupCatchDistRules
