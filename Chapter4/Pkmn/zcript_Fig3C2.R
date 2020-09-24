library(ggplot2)
library(gridExtra)
library(grid)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotC2 = function(print.plot=F)
{
	data = read.table("Data/minimum_time.txt",header=T)

	p = ggplot() +
		theme_thesis() +
		geom_line(data=data,aes(x=e,y=quan,group=t,color=factor(t)),size=1) +
		geom_point(data=data,aes(x=e,y=quan,group=t,color=factor(t)),size=1,stroke=1.5)+
		scale_color_manual(name="Griefers (%)",values=c("#374E55","#DF8F44","#00A1D5","#B24745",
					 			"#79AF97","#6A6599","#80796B","#800000",
					 			"#767676","#FFA319", "#8A9045")
		) +
		guides(color = guide_legend(override.aes = list(size = 5))) +
		theme(legend.direction = "vertical",
			panel.border = element_rect(colour = "black", fill=NA, size=2),
			panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
			plot.margin=grid::unit(c(0.5,0.5,0.5,0.5), "cm"),
			legend.position = "right",
			legend.title.align = 0.5,
			legend.title = element_text(family=GlobalFont,face="bold"),
			legend.text = element_text(size=20,family=GlobalFont),
			text = element_text(size=18,family=GlobalFont),
			axis.line = element_blank()
			) +
		scale_y_log10(expand=c(0,0),limits=c(4,6000),breaks=c(4,10,100,1000,6000)) +
		scale_x_continuous(limits=c(1,70),expand=c(0,0),breaks=c(1,seq(10,70,by=10)))+
		xlab("Random noise (%)") +
		ylab("1st percentile [minutes]")


	if(print.plot){
		cairo_pdf(paste0("Plots/Fig3C2.pdf"),width=12,height=10)
		plot(p)
		dev.off()
	}

	return(p)
}
