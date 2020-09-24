library(ggplot2)
library(ggdendro)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotB = function(print.plot=F)
{
	load("Data/data_d6.RData")
	load("Data/rectangles2_d6.RData")
	load("Data/votes_d6.RData")

	xpos = c(1,seq(20000,80000,by=20000))

	p = ggplot() + theme_thesis()

	for(i in 1:nrow(rectangles))
	{
		p = p + geom_rect(data=rectangles[i,],
					aes(xmin=xmin,xmax=xmax,ymin=ymin,ymax=ymax,fill=factor(color)),
					alpha=1,linetype=1)
	}
	p = p +	geom_hline(yintercept=0.75,linetype=2) +
		geom_hline(yintercept=0.5,linetype=2) +
		geom_hline(yintercept=0.25,linetype=2) +
		geom_line(data = data_orig, aes(x = x, y = pos, linetype="Meter position"), color="#374E55", size=1) +
		geom_line(data=a,aes(x=x,y=tot,color="Normalized number of votes"),size=0.6) +
    		scale_linetype_manual(name = "", label = "Meter position", values = 1) +
		scale_fill_manual(name="",values=c("#dcdfdb","#79AF97"),labels=c("Anarchy","Democracy")) +
		scale_color_manual(name="",values=c("#DF8F44"),labels=c("Normalized number of votes")) +
 		guides(linetype = guide_legend(override.aes = list(size=2)),colour = guide_legend(override.aes = list(size=2))) +
		theme(legend.position="top",
			panel.border = element_rect(colour = "black", fill=NA, size=2),
			plot.margin = unit(x=c(0,1.5,0,1),units="cm"),
			legend.key.width = unit(1,"cm"),
			legend.spacing.x = unit(0.1,"mm"),
			legend.box.margin=margin(-10,-10,-30,-10)
			) +
		scale_y_continuous(limits=c(0,1),expand=c(0,0),breaks=c(0,0.25,0.50,0.75,1)) +
		scale_x_continuous(limits=c(1,max(data_orig$x)),expand=c(0,0),
					breaks=xpos,
					labels=data_orig$time[xpos]) +
		xlab("") +
		ylab("Tug of War")



	if(print.plot){
		cairo_pdf(paste0("Plots/Fig4B.pdf"),width=14,height=6)
		plot(p)
		dev.off()
	}

	return(p)
}


