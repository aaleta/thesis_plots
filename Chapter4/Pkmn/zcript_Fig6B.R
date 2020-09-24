library(ggplot2)
library(ggdendro)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotB = function(print.plot=F)
{
	data = read.table("Data/frustration_1.txt",header=T)


	breaks = seq(1,361,by=50)
	labels = c("1d8h","3d10h","5d12h","7d14h","9d16h","11d18h","13d20h","15d22h")

	p = ggplot() +
		theme_thesis() +
        	geom_point(data=data,aes(x=n,y=Count),color="black",fill="#374E55",size=4,pch=21) +
		theme(axis.text.x = element_text(size=20),
			plot.margin = unit(x=c(1,0,1,3),units="cm")) +
		scale_x_continuous(expand=c(0,0),limits=c(0.3,60.7),breaks=c(1,seq(5,60,by=5)),labels=c(1,seq(5,55,by=5),">60")) +
		scale_y_log10(expand=c(0,0),limits=c(10,10000))+
		xlab("Number of 'o' in 'no'") +
		ylab("Number of messages")


	if(print.plot){
		cairo_pdf(paste0("Plots/Fig6B.pdf"),width=10,height=10)
		plot(p)
		dev.off()
	}

	return(p)
}
