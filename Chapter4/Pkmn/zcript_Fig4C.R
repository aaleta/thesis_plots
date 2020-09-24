library(ggplot2)
library(ggsci)
source("../../theme.R")

plotC = function(print.plot=F)
{
	load("Data/rectangles_d8.RData")
	load("Data/lines_d8.RData")
	load("Data/circle_d8.RData")

	M = 78018

	p = ggplot() + theme_thesis()

	for(i in 1:nrow(rectangles))
	{
		p = p + geom_rect(data=rectangles[i,],
					aes(xmin=xmin,xmax=xmax,ymin=ymin,ymax=ymax,fill=factor(color)),
					alpha=0.8,linetype=1)
	}

	p = p +	geom_line(data=circle,aes(x=x,y=y,group=factor(y)),color="black") +
		geom_line(data=a,aes(x=x,y=y,col=factor(c),group=factor(c)),size=1) +
		scale_color_jama() +
		scale_fill_manual(name="",values=c("0"="#dcdfdb","1"="#79AF97"),labels=c("Anarchy","Democracy")) +
		labs(color="") +
		geom_vline(xintercept=1,color="black") +
		geom_vline(xintercept=0.5*M,color="black",size=0.4) +
		geom_vline(xintercept=M,color="black") +
		geom_vline(xintercept=1.5*M,color="black",size=0.4) +
		geom_vline(xintercept=2*M,color="black") +
		geom_vline(xintercept=2.5*M,color="black",size=0.4) +
		geom_vline(xintercept=3*M,color="black") +
		geom_vline(xintercept=3.5*M,color="black") +
	 	guides(colour = guide_legend(override.aes = list(size=2))) +
		theme(text=element_text(size=16,family=GlobalFont),
			legend.position="top",
			legend.box = "vertical",
			legend.key.width = unit(1,"cm"),
			legend.text = element_text(size=20,family=GlobalFont),
			panel.border = element_blank(),
			panel.grid.major = element_blank(),
			panel.grid.minor = element_blank(),
			panel.grid.minor.x = c(),
			plot.margin = unit(x=c(0,0,0,0),units="cm"),
			axis.ticks.length = unit(0.3,"cm"),
			axis.ticks = element_line(size=0.6),
			axis.text.y=element_blank(),
			axis.ticks.y=element_blank(),
			axis.line = element_blank(),
			legend.box.margin=margin(-10,-10,-30,-10),
			legend.spacing.y = unit(0.1,"mm")
			) +
		coord_polar() +
		xlab("") +
		ylab("") +
		scale_y_continuous(limits=c(0,0.75)) +
		scale_x_continuous(expand=c(0,0),limits=c(1,4*M),breaks=c(1,M/2,M,1.5*M,2*M,2.5*M,3*M,3.5*M),labels=c("08d00h","08d12h","08d00h","08d12h","08d00h","08d12h","08d00h","08d12h")) +
		annotate("text",x=20000,y=0.13,label="0.10") +
		annotate("text",x=6000,y=0.32,label="0.30") +
		annotate("text",x=4000,y=0.52,label="0.50") +
		annotate("text",x=3000,y=0.75,label="0.75",vjust=-0.5)

	if(print.plot){
		cairo_pdf(paste0("Plots/Fig4C.pdf"),width=8,height=8)
		gt = ggplot_gtable(ggplot_build(p))
		gt$layout$clip[gt$layout$name == "panel"] <- "off"
		print(grid.draw(gt))
		dev.off()
	}

	return(p)
}

