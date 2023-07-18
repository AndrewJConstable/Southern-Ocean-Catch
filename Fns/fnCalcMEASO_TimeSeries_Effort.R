fnCalcMEASO_TimeSeries_Effort<-function(m          # MEASO threee-letter area code eg. "AOA"
                                       ,mData      # dataset to be summarised
                                       ,DepVar     # the name of the dependent variable aggregated in the variable, m
                                       ,CheckCatch # if CheckCatch then summarise Catch in total and for records not NA
                                       ){         

    mD<-mData[which(mData[,"MEASO"] %in% m),]  # subset data for MEASO area
  res<-NULL
  if(nrow(mD)>0){
    if(nrow(mD[!is.na(mD[,DepVar]),])>0){
    res<-aggregate(mD[,DepVar],by=list(mD[,"Split_Year"]),sum,na.rm=TRUE)  # remove missing values.  return zero if all missing
    } else {
      Yrs<-unique(mD[,"Split_Year"])
     res<-data.frame(Yrs, rep(NA,length(Yrs)))
    } # end if all is.na
    dimnames(res)[[2]]<-c("Split_Year",DepVar)
     if(CheckCatch) {

      res_catchTotal<-aggregate(mD[,"CatchTotal"],by=list(mD[,"Split_Year"]),sum,na.rm=TRUE)
      dimnames(res_catchTotal)[[2]]<-c("Split_Year","CatchTotal")
      res_catchNotNAeffort <-aggregate(mD[,"CatchNotNAdv"],by=list(mD[,"Split_Year"]),sum,na.rm=TRUE)
      dimnames(res_catchNotNAeffort)[[2]]<-c("Split_Year","CatchNotNAdv")
      res_Catch<-merge(res_catchTotal,res_catchNotNAeffort,by="Split_Year",all=TRUE)
      res_Catch[is.na(res_Catch[,"CatchNotNAdv"]),"CatchNotNAdv"]<-0
      res_Catch<-cbind(res_Catch,res_Catch[,"CatchNotNAdv"]/res_Catch[,"CatchTotal"])
         dimnames(res_Catch)[[2]][ncol(res_Catch)]<-"PropCatchNotNA"
        res<-merge(res,res_Catch,by="Split_Year",all=TRUE) 
        }
    res<-bind_cols(data.frame(MEASO = rep(m,nrow(res))),res[order(res[,"Split_Year"]),])
    if(sum(res[!is.na(res[,DepVar]),DepVar])==0) res<-NULL
      } # end if nrow>0
  
  return(res)
  
  
}  #end fnCalcMEASO_TimeSeries
