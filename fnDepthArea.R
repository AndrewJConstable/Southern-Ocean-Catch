######################## for distributing catch amongst MEASO areas ####################
fnDepthArea<-function(dInt          # which depth interval
                      ,dfDepths      # data frame of depth intervals  
                      ,Cb_dat        # dataframe with "Depth", "Area" 
                      #  optional for none, one or both of "MEASO", "ASD"
){
  # find grouping variables (if any)
  Groups<-dimnames(Cb_dat)[[2]] 
  Groups<-Groups[which(Groups %in% c("MEASO","ASD"))]
  # subset data from depth range
  x<- Cb_dat[(Cb_dat[,"Depth"] <   dfDepths[dInt,"Minimum"] & 
                Cb_dat[,"Depth"] >=  dfDepths[dInt,"Maximum"]),]
  if(nrow(x)>0){
    if(length(Groups)>0) {
      GroupBy<-lapply(Groups,function(grp,x1){return(x1[,grp])},x)
      res <- aggregate(x[,"Area"],GroupBy,sum)
      
      names(res)<-c(Groups,"Area")
      res<-data.frame(res[,Groups],rep(dfDepths[dInt,"DepthRange"],nrow(res)),res[,"Area"])
      dimnames(res)[[2]]<-c(Groups,"DepthRange","Area")
      return(res)
    } else {
      sumx<-data.frame(DepthRange = dfDepths[dInt,"DepthRange"], Area = sum(x[,"Area"]))
      return(sumx) 
    } # end else
  } else {
    return(NULL)
  }
} # end fnDepthArea

