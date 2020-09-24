library(ggplot2)
library(ggdendro)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotA = function(print.plot=F)
{
	load("Data/rectangles_start9.RData")
	load("Data/start9_1.RData")

	p = ggplot() + theme_thesis()

	for(i in 1:nrow(rectangles))
	{
		p = p + geom_rect(data=rectangles[i,],
					aes(xmin=xmin,xmax=xmax,ymin=ymin,ymax=ymax,fill=factor(color)),
					alpha=1,linetype=1)
	}


	p = p +	geom_line(data = a, aes(x = x, y = Count, linetype="start9"), color="#374E55", size=0.5) +
		scale_fill_manual(name="",values=c("#dcdfdb","#79AF97"),labels=c("Anarchy","Democracy")) +
	    	scale_linetype_manual(name = "", label = "start9", values = 1) +
 		guides(linetype = guide_legend(override.aes = list(size=3))) +
		theme(legend.position="top",
			panel.border = element_rect(colour = "black", fill=NA, size=2),
			plot.margin = unit(x=c(0,0,0.5,1),units="cm"),
			legend.box.margin=margin(-10,-10,-30,-10),
			legend.key.width = unit(1,"cm"),
		) +
		scale_y_continuous(limits=c(0,0.4),expand=c(0,0),breaks=seq(0,0.4,by=0.1),labels=seq(0,0.4,by=0.1)) +
		scale_x_continuous(limits=c(52,904647),expand=c(0,0),
					breaks=c(52,42401,126747,206820,287237,366237,452658,539064,623168,711389,797772,880199),
					labels=c("5.5d","6d","7d","8d","9d","10d","11d","12d","13d","14d","15d","16d")) +
		xlab("Time") +
		ylab("Fraction of input")



	if(print.plot){
		cairo_pdf(paste0("Plots/Fig5A.pdf"),width=16,height=6)
		plot(p)
		dev.off()
	}

	return(p)
}
