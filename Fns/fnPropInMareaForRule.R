fnPropInMareaForRule<-function(cbed_a            # data frame - with Grouping variables,"Depth","Area".
                               # Grouping variables will be either or both "MEASO", "ASD"
                               
                               ,Groups           # which of MEASO and ASD to use
                               ,MEASO             # MEASO area names in order
                               ,ASD               # ASD names in order
){ # start function    
  
  if(!is.null(cbed_a)) cbed_a[,"Area"] <- cbed_a[,"Area"]/sum(cbed_a[,"Area"])
  
  if(length(Groups)==2){
    dASD<-unique(cbed_a[,"ASD"])
    res<-bind_rows(lapply(seq(1,length(dASD),1)
                          ,function(a,df,asd,measo){
                            r<-as.data.frame(matrix(0,ncol=length(measo),nrow=1
                                                    ,dimnames=list(asd[a],measo)))
                            if(!is.null(df)) {
                              r[,match(df[df[,"ASD"]==asd[a],"MEASO"],measo)]<-
                                round(df[df[,"ASD"]==asd[a],"Area"],3)
                            } # end if                       
                            return(r)
                          },cbed_a,dASD,MEASO))
    ASDzero<-ASD[-match(dimnames(res)[[1]],ASD)]
    resZero<-as.data.frame(matrix(0,ncol=length(MEASO),
                                  nrow=length(ASDzero),dimnames=list(ASDzero,MEASO)))
    res<-bind_rows(res,resZero)
    res<-res[order(dimnames(res)[[1]]),]
  } else {
    if(Groups[1]=="MEASO"){
      res<-as.data.frame(matrix(0,ncol=length(MEASO)
                                ,nrow=1,dimnames=list(NULL,MEASO)))
      if(!is.null(cbed_a)) {
        res[1,match(cbed_a[,"MEASO"],MEASO)]<-round(cbed_a[,"Area"],3)
      } # end if
    } else {
      if(Groups[1]=="ASD"){
        res<-as.data.frame(matrix(0,ncol=length(ASD),nrow=1,dimnames=list(NULL,ASD)))
        if(!is.null(cbed_a)) {
          res[1,match(cbed_a[,"ASD"],ASD)]<-round(cbed_a[,"Area"],3)
        } # end if
      } else stop("neither MEASO or ASD present in data") 
    } # end else MEASO
  } #end else groups==2
  
  return(res) # data frame with ASD rows and MEASO columns (eached named accordingly)
} # end fnPropInMarea
