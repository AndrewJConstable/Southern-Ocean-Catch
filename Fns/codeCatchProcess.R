### codeCatchProcess ######

CatchDistRules <- fnSetupCatchDistRules(
  CSBdata
  ,DI
  ,Cbed_rules
  ,AreaGroups
  ,MEASOareas[,"Code"]
  ,ASDareas[,"Code"]
) # end fn call

####################################################
# add allocation to CSBdata

Res<-bind_rows(lapply(seq(1,length(CatchDistRules),1),fnDistributeCatch,CatchDistRules,CSBdata))

####################################################
# check all records are accounted for

if(nrow(Res)!=nrow(CSBdata)) {cat("Only ",nrow(Res)/nrow(CSBdata)*100,"% Bulletin records selected by rules.\n\n",sep="")} else {
  cat("All records from Bulletin selected by application of the rules.\n\n")
}

####################################################
# determine total catch by rules

CatchByRules<-unlist(lapply(seq(1,length(CatchDistRules),1),function(c,CD,dCSB,Taxa){
  subCSB<-dCSB[CD[[c]]$Subset,]
  sum(subCSB[which(subCSB[,"Catch_TXN_Code"] %in% Taxa),"Green_Weight"])
},CatchDistRules,CSBdata,CatchTaxa))


####################################################
# distribute catches to pixels
Pixels    <- rep(0,nrow(Cbed_rules))     # generate vector of zeros for N pixels
RuleZeroArea<-NULL
for(c in seq(1,length(CatchDistRules),1)){ # too memory intensive to do lapply
  if(CatchDistRules[[c]]$Area_km2!=0){
    Density   <- CatchByRules[c]/CatchDistRules[[c]]$Area_km2        # density per km2
    # place value in each relevant pixel according to CbedAreaSubset multiplying by Cbed[,"Area"]
    Pixels[CatchDistRules[[c]]$CbedAreaSubset] <- 
      Pixels[CatchDistRules[[c]]$CbedAreaSubset] + 
      Density  
  } else {
    RuleZeroArea<-c(RuleZeroArea,c,CatchByRules[c])
  }
} # end loop c

cat(cat("Total catch in Bulletin for ("),cat(CatchTaxa,sep=", "),cat("): ", sum(CSBdata[which(CSBdata[,"Catch_TXN_Code"] %in% CatchTaxa),"Green_Weight"])),"\n",sep="")

Resolution<-4 # km2
cat("Catch allocated to pixels: ",sum(Pixels)*Resolution,"\n",sep="") 
cat("Rules with zero area and catch not allocated\n")
print.data.frame(matrix(RuleZeroArea,ncol=2,byrow=TRUE,dimnames = list(NULL,c("Rule","Catch"))))

#prepare catch/pixel for plotting
PixelsLog10<- Pixels
PixelsLog10[PixelsLog10==0]<-NA

#populate the cells indexed from the cell column in template 
r <- template
r[Cbed_rules$Cell] <- log10(PixelsLog10)

# reduce resolution for plotting if needed
r_small<-aggregate(r, fact=4)

rgg<-as.data.frame(r_small,xy=2)

# convert rgg$layer to colour
col_pal<-colorRampPalette(c("gold","greenyellow","green3","red")) # from brewer
Cmin <- floor(min(rgg[!is.nan(rgg$layer),"layer"]))
Cmax <- ceiling(max(rgg[!is.nan(rgg$layer),"layer"]))
Cn   <- 1000
rCols<-col_pal(Cn)
rColour<-rCols[ceiling((rgg$layer-Cmin)/(Cmax-Cmin)*Cn)]

