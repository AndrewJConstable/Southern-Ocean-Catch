######### codePlotCatchTimeSeries #################

plotMareas<-as.data.frame(MEASOareas[MEASOareas[,"Code"]!="Outside",c("chOrder","Code","Col","LTY")])
plotMareas<-bind_cols(data.frame(Order = seq(1,nrow(plotMareas),1)),plotMareas)

pdf<-bind_rows(lapply(plotMareas[,"Code"],fnCalcMEASO_TimeSeries,Res,CatchTaxa))
pdf<-bind_cols(pdf,data.frame(
  chOrder  = MEASOareas[match(pdf[,"MEASO"],MEASOareas[,"Code"]),"chOrder"]
  ,Sector = MEASOareas[match(pdf[,"MEASO"],MEASOareas[,"Code"]),"Sector"]
  ,Zone   = MEASOareas[match(pdf[,"MEASO"],MEASOareas[,"Code"]),"Zone"]
  ,Colour   = MEASOareas[match(pdf[,"MEASO"],MEASOareas[,"Code"]),"Col"]
))

pdf<-pdf[order(pdf[,"chOrder"]),]
pMareas<-MEASOareas[match(unique(pdf[,"chOrder"]),MEASOareas[,"chOrder"]),]

if(plotYlog | !includeZeroCatch) pdf[pdf[,"Catch"]<1,"Catch"]<-NA   

if(removeLastYear) pdf<-pdf[pdf[,"Split_Year"]<max(pdf[,"Split_Year"]),]

maxCatch<-max(pdf[!is.na(pdf[,"Catch"]),"Catch"])
minCatch<-min(pdf[!is.na(pdf[,"Catch"]),"Catch"])
if(plotYlog){
  Ylimits<-c(10^floor(log10(minCatch)),10^ceiling(log10(maxCatch)))
} else {
  Ylimits<-c(0,(ceiling(maxCatch/YtickMajor)*YtickMajor))
  
}
pdf$MEASO<-factor(pdf$MEASO,levels = pMareas[,"Code"]) 
Area<-pdf$MEASO

Xlimits<-c(floor(min(pdf[,"Split_Year"])/10)*10,ceiling(max(pdf[,"Split_Year"])/10)*10)


p<-ggplot() 
p<-p +scale_x_continuous(minor_breaks = seq(Xlimits[1],Xlimits[2],by=XtickMinor), breaks = seq(Xlimits[1],Xlimits[2],by=XtickMajor), limits = Xlimits)
if (plotYlog) {
  p <- p + scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),labels = trans_format("log10", math_format(10^.x)), limits = Ylimits) + annotation_logticks(sides="l")
} else {
  p<-p +scale_y_continuous(breaks = seq(Ylimits[1],Ylimits[2],by=YtickMajor), minor_breaks = seq(Ylimits[1],Ylimits[2],by=YtickMinor), limits = Ylimits, labels = scales::comma)
  
}

p <- p + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()
               ,panel.background = element_blank()
               , axis.line = element_line(colour = "black",size=1, linetype="solid")
               ,axis.ticks.length=unit(0.25,"cm")
)#end theme
#p<- p+ geom_line(pdf, mapping = (aes(x = pdf[,"Split_Year"], y = pdf[,"Catch"], col = pdf[,"MEASO"], lty = pdf[,"MEASO"])), show.legend=TRUE, name="Area")
p<- p+ geom_line(pdf, mapping = (aes(x = pdf[,"Split_Year"], y = pdf[,"Catch"], col = Area, lty = Area)), show.legend=TRUE)

p <- p + labs(x = "Year", y ="Catch (tonnes)", title="Catch for toothfish (all gears)")

p<-p + scale_colour_manual(values=MEASOareas[match(unique(pdf[,"MEASO"]),MEASOareas[,"Code"]),"Col"])

p<-p + scale_linetype_manual(values=MEASOareas[match(unique(pdf[,"MEASO"]),MEASOareas[,"Code"]),"LTY"])
p

