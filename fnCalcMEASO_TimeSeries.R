fnCalcMEASO_TimeSeries<-function(m,mData,Taxa){
  mD<-mData[which(mData[,"Catch_TXN_Code"] %in% Taxa),c("Split_Year",m)]
  res<-NULL
  if(nrow(mD)!=0){
    res<-aggregate(mD[,m],by=list(mD[,"Split_Year"]),sum)
    dimnames(res)[[2]]<-c("Split_Year","Catch")
    res<-bind_cols(data.frame("MEASO" = rep(m,nrow(res))),res)
    if(sum(res[,"Catch"])==0) res<-NULL
  } # end if
  return(res)
}  #end fnCalcMEASO_TimeSeries

