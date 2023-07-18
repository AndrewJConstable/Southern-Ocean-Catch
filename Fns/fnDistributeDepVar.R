fnDistributeDepVar<-function(c        # integer for rule for distributing the dependent variable
                             ,CD        # DistRules - list of rules
                             ,dCSB      # dataset - dTrawl
                             ,tf        # target fishery
                             ,DepVar    # dependent variable
                             ,KeepVars   # variables to be kept and replicated for each MEASO area
){

  subCSB<-dCSB[CD[[c]]$Subset & dCSB[,"TFN"]==tf,]

#############################
  if(nrow(subCSB)>0){
    #distribute DepVar
    resDV<-bind_rows(lapply(subCSB[,DepVar],function(gw,subD){gw*subD},CD[[c]]$Distribution))
    # distribute Catch
    resCatch<-bind_rows(lapply(subCSB[,"Catch"],function(gw,subD){gw*subD},CD[[c]]$Distribution))

   #### begin lapply ############################################################################# 
   res<-bind_rows(lapply(seq(1,ncol(resDV),1),function(m,rDV,rC,sD,DepVar,KeepVars){
      sD<-matrix(sD,ncol=length(KeepVars))
      mDV<-rDV[,m]
      mC<-rC[,m]

     ######################################################
     if(sum(mDV[!is.na(mDV)])>0 | sum(mC[!is.na(mC)])>0) {
      
        ByVar<-lapply(seq(1,ncol(sD),1),function(s,sd){sd[,s]},sD)
        
        #####################################
        if(length(mDV[!is.na(mDV)])>0) {
          DV<-aggregate(mDV,by=ByVar,sum,na.rm=TRUE)
        } else {
          DV<-matrix(unique(sD),ncol=length(KeepVars))
          DV<-cbind(DV,rep(NA,nrow(DV)))
          }
        dimnames(DV)[[2]]<-c(KeepVars,DepVar)
        
        #####################################
        if(length(mC[!is.na(mC)])>0) {
          Ctotal<-aggregate(mC,by=ByVar,sum,na.rm=TRUE)
        } else {
          Ctotal<-matrix(unique(sD),ncol=length(KeepVars))
          Ctotal<-cbind(Ctotal,rep(0,nrow(Ctotal)))
        }
        dimnames(Ctotal)[[2]]<-c(KeepVars,"CatchTotal")
        
        #####################################
        if(length(mC[!is.na(mDV) & !is.na(mC)])>0) {
          ByVar<-lapply(seq(1,ncol(sD),1),function(s,sd){sd[,s]},
                        matrix(sD[!is.na(mDV),],ncol=length(KeepVars)))
          CnotNAdv<-aggregate(mC[!is.na(mDV)],by=ByVar,sum,na.rm=TRUE)
        } else {
          CnotNAdv<-matrix(unique(sD),ncol=length(KeepVars))
          CnotNAdv<-cbind(CnotNAdv,rep(0,nrow(CnotNAdv)))
        }
        dimnames(CnotNAdv)[[2]]<-c(KeepVars,"CatchNotNAdv")
        
        #####################################
        Catch<-merge(Ctotal,CnotNAdv,by=KeepVars,all=TRUE)
        Catch[is.na(Catch[,"CatchNotNAdv"]),"CatchNotNAdv"]<-0
        Catch<-bind_cols(Catch,Catch[,"CatchNotNAdv"]/Catch[,"CatchTotal"])
        dimnames(Catch)[[2]][ncol(Catch)]<-"Prop"
        res<-merge(DV,Catch,by=KeepVars,all=TRUE)
        res<-bind_cols(data.frame(MEASO = rep(names(DistRules[[c]]$Distribution)[m],nrow(res))),res)

        return(res)
        
      } else {
        return(NULL)}  # end if greater then zero
    },resDV,resCatch,subCSB[,KeepVars],DepVar,KeepVars))  
    #### end lapply ############################################################################# 
    
    res<-bind_cols(rep(c,nrow(res)),rep(tf,nrow(res)),res)
    dimnames(res)[[2]][c(1,2)]<-c("RuleN","TFN")
    
  } else res<-NULL
  
  return(res)
} # end function

