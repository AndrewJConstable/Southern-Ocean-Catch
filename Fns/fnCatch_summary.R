######################## for summarising catch given factors ####################
fnCatch_summary<-function(fLevel,dCSB,f,BFTaxa,Threshold){
  
  fn<-length(f)
  rInclude<-apply(dCSB[,f],1,function(f,fn,fLevel){res<-f %in% fLevel;if      (sum(res)<fn) return(FALSE) else return(TRUE)},fn,fLevel)
  
  df1<-dCSB[rInclude,c("Calendar_Year","Catch_TXN_Code","Green_Weight")]
  ByList<-lapply(c("Calendar_Year","Catch_TXN_Code"),function(f,df){return     (df[,f])},df1)
  
  df2<-aggregate(df1[,"Green_Weight"],by=ByList,sum)
  dimnames(df2)[[2]]<-c("Year","Taxon","Tonnes")
  
  df3<-df2[df2[,"Tonnes"]>Threshold,]
  if(nrow(df3)>0){
    df4<-aggregate(df3[,"Tonnes"],by=list(df3[,"Taxon"]),sum)
    dimnames(df4)[[2]]<-c("Taxon","Tonnes")
    
    df5<-data.frame(TaxaGroup =
                      BFTaxa[match(df4[,"Taxon"],BFTaxa[,"Code"]),"Catch_Group"]
                    ,Tonnes = df4[,"Tonnes"])
    df6<-aggregate(df5[,"Tonnes"],list(df5[,"TaxaGroup"]),sum)  
    dimnames(df6)[[2]]<-c("TaxaGroup","Tonnes")  
    df7<-df6[order(df6[,"Tonnes"], decreasing=TRUE),]
    df7[,"Taxon"]<-BFTaxa[match(df7[,"TaxaGroup"],BFTaxa[,"Catch_Group"])
                          ,"Taxon_Name"]
    
  } else df7<-NULL # end if nrow(df3)>0
  
  cat("Catch summary for factors (",paste(f,collapse=", "),") with combined levels: ",paste(fLevel,collapse=", "),"\n\n",sep="")   
  
  if (!is.null(df7)) print.data.frame(df7[,c(3,2)]) else 
    print("Catches lower than threshold")
  cat("\n",sep="") 
  
} # end catch_summary
