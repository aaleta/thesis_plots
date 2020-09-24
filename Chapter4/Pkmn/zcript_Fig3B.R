library(ggplot2)
library(ggdendro)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotB = function(print.plot=F)
{
	load("Data/dendogram.RData")

	p = ggplot(segment(hcd)) +
		geom_segment(aes(x=x, y=y, xend=xend, yend=yend, color=factor(color)),size=1.2) +
		coord_flip() +
		scale_y_reverse(expand=c(0.2, 0)) +
		theme_dendro() +
		scale_color_manual(values=c("a"="#79AF97","left"="#374E55","right"="#DF8F44","up"="#00A1D5","down"="#B24745","b"="#6A6599","start"="#80796B","black"="black")) +
		geom_text(data=label(hcd),aes(label=label,x=x,y=0,color=color),hjust=0,size=6) +
		theme(legend.position="none",
			text = element_text(family=GlobalFont),
			plot.margin = unit(c(0,0,0,0), "cm"))

	if(print.plot){
		cairo_pdf(paste0("Plots/Fig3B.pdf"),width=6,height=6)
		plot(p)
		dev.off()
	}

	return(p)
}




