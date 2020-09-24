library(ggplot2)
library(ggdendro)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotB = function(print.plot=F)
{
	data = read.table("Data/start9_2.txt",header=T)


	p = ggplot() + 
		theme_thesis() +
		geom_line(data = data, aes(x = dia, y = frac), color="black", size=1) +
		geom_point(data = data, aes(x = dia, y = frac), color="#386cb0", size=5) +
		theme(legend.position="none",
			panel.border = element_rect(colour = "black", fill=NA, size=2),	
			axis.line = element_blank(),
			plot.margin = unit(x=c(0.5,1,0.5,2.5),units="cm"),
			axis.title.y = element_text(size=22)
		) +
		scale_y_continuous(limits=c(0,1.05),expand=c(0,0),breaks=seq(0,1,by=0.1),labels=seq(0,1,by=0.1)) +
		scale_x_continuous(limits=c(4.5,15.5),expand=c(0,0),
					breaks=seq(5,15,by=2),
					labels=paste0(seq(5,15,by=2),"d")) +
		xlab("Day") +
		ylab("Fraction of original protesters")

	p2 = ggplot() +
			theme_thesis() +
			geom_line(data = data, aes(x = dia, y = usuarios), color="black", size=1) +
			geom_point(data = data, aes(x = dia, y = usuarios), color="#386cb0", size=3) +
			theme(legend.position="none",
				panel.border = element_rect(colour = "black", fill=NA, size=2),
				panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
				plot.margin = unit(x=c(0,1,0,0),units="cm"),
				text = element_text(size=16),
				axis.line = element_blank(),
				axis.title.y = element_text(size=12)
			) +
			scale_y_continuous(limits=c(500,8800),expand=c(0,0),breaks=seq(1000,8500,by=1000),labels=seq(1000,8500,by=1000)) +
			scale_x_continuous(limits=c(4.5,15.5),expand=c(0,0),
						breaks=seq(5,15,by=2),
						labels=paste0(seq(5,15,by=2),"d")) +
			xlab("Day") +
			ylab("Number of protesters")

	p = p + annotation_custom(grob = ggplotGrob(p2),
					xmin = 6.5, xmax = 15.4,
					ymin = 0.4, ymax = 1)

	if(print.plot){
		cairo_pdf(paste0("Plots/Fig5B.pdf"),width=8,height=8)
		vp2 = viewport(width=0.65, height=0.4,  x=0.63, y=0.72)
		print(p)
		print(p2,vp=vp2)
		dev.off()
	}

	return(p)
}
