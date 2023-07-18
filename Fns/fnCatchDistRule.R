fnCatchDistRule<-function(BaseRule,DI,CBa,Agroups,MEASO,ASD){
  
  BaseRule<-c(BaseRule,list(Area_km2    = 0))
  BaseRule$CbedAreaSubset<-(BaseRule$CbedAreaSubset 
                            & (CBa[,"Depth"] <  DI[BaseRule$TypeDepthInterval,"Minimum"]
                               & CBa[,"Depth"] >= DI[BaseRule$TypeDepthInterval,"Maximum"]))
  
  dfAreas<-fnDepthArea(BaseRule$TypeDepthInterval
                       ,DI
                       ,CBa[BaseRule$CbedAreaSubset,c(Agroups,"Depth","Area")])
  
  BaseRule<-c(BaseRule,list(Distribution = fnPropInMareaForRule(dfAreas,Agroups,MEASO,ASD)))
  
  if(!is.null(dfAreas)) BaseRule$Area_km2 <- sum(dfAreas[,"Area"])
  
  return(BaseRule)
} # end function

