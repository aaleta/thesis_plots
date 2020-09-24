library(ggplot2)
library(ggdendro)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotC = function(print.plot=F)
{
	data = read.table("Data/frustration_2.txt",header=T)


	breaks = seq(1,361,by=50)
	labels = c("1d8h","3d10h","5d12h","7d14h","9d16h","11d18h","13d20h","15d22h")

	p = ggplot() +
		theme_thesis() +
		geom_point(data=data,aes(x=time,y=Count),color="black",pch=21,fill="#374E55",size=3) +
		geom_line(data=data,aes(x=time,y=avg),color="#DF8F44",size=2) +
		theme(axis.text.x = element_text(size=20),
			plot.margin = unit(x=c(1,0,1,3),units="cm")) +
		scale_x_continuous(expand=c(0.01,0),breaks=breaks,labels=labels) +
		scale_y_continuous(expand=c(0.01,0),limits=c(1,335),breaks=c(1,seq(30,330,by=30)),labels=c(1,seq(30,330,by=30)))+
		xlab("Time") +
		ylab("Number of 'why' per hour")


	if(print.plot){
		cairo_pdf(paste0("Plots/Fig6C.pdf"),width=10,height=10)
		plot(p)
		dev.off()
	}

	return(p)
}
