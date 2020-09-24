library(ggplot2)
library(gridExtra)
library(grid)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotC1 = function(print.plot=F)
{
	data = read.table("Data/mean_time.txt",header=T)

	p = ggplot() +
		theme_thesis() +
		geom_line(data=data,aes(x=e,y=meanT/60,group=t,color=factor(t)),size=1) +
		geom_point(data=data,aes(x=e,y=meanT/60,group=t,color=factor(t)),size=1,stroke=1.5)+
		scale_color_manual(name="Griefers (%)",values=c("#374E55","#DF8F44","#00A1D5","#B24745",
					 			"#79AF97","#6A6599","#80796B","#800000",
					 			"#767676","#FFA319", "#8A9045")
		) +
		theme(legend.position="none",
			panel.border = element_rect(colour = "black", fill=NA, size=2),
			panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
			plot.margin=grid::unit(c(2.5,0.5,0.5,0.5), "cm"),
			axis.line = element_blank(),
			text = element_text(size=18,family=GlobalFont)
			) +
		scale_y_log10(expand=c(0,0),limits=c(3,3000),breaks=c(4,10,100,1000,3000)) +
		scale_x_continuous(limits=c(1,80),expand=c(0,0),breaks=c(1,seq(10,80,by=10)))+
		xlab("Random noise (%)") +
		ylab("Mean time [hours]") 


	if(print.plot){
		cairo_pdf(paste0("Plots/Fig3C1.pdf"),width=10,height=10)
		plot(p)
		dev.off()
	}

	return(p)
}


