library(ggplot2)
library(gridExtra)
library(grid)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotA = function(print.plot=F)
{
	tdata = read.table("Data/time_evolution.txt",header=T)

	p = ggplot() +
		theme_thesis() +
	  	geom_line(data = tdata, aes(x = x, y = cnt_a, colour = "a"), size = 1) +
	  	geom_line(data = tdata, aes(x = x, y = cnt_b, colour = "b"), size = 1) +
	  	geom_line(data = tdata, aes(x = x, y = cnt_up, colour = "up"), size = 1) +
	  	geom_line(data = tdata, aes(x = x, y = cnt_right, colour = "right"), size = 1) +
	  	geom_line(data = tdata, aes(x = x, y = cnt_down, colour = "down"), size = 1) +
	  	geom_line(data = tdata, aes(x = x, y = cnt_left, colour = "left"), size = 1) +
	  	geom_line(data = tdata, aes(x = x, y = cnt_start, colour = "start"), size = 1) +
		labs(colour="") +
		scale_color_manual(values=c("a"="#79AF97","left"="#374E55","right"="#DF8F44","up"="#00A1D5","down"="#B24745","b"="#6A6599","start"="#80796B"),
					labels=c("left"='\u2190',"right"='\u2192',"up"='\u2191',"down"='\u2193',"a"="a","b"="b","start"="start"),
					breaks=c("left","right","up","down","a","b","start")) +
		theme(text=element_text(size=18,family=GlobalFont),
			panel.border = element_rect(colour = "black", fill=NA, size=2),
			panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
			plot.margin=grid::unit(c(0,2,0,0.5), "cm"),
			legend.position = "top",
			legend.background = element_rect(fill=NA),
			legend.text = element_text(size=20),
			legend.box = "horizontal",
			axis.line = element_blank(),
			legend.key.width = unit(0.8,"cm"),
			legend.box.margin=margin(-10,-10,-30,-10)
			) +
		guides(colour = guide_legend(nrow = 1, override.aes = list(size=2))) +
		scale_y_continuous(expand=c(0,0),limits=c(0,0.35)) +
		scale_x_continuous(expand=c(0,0),limits=c(10,900),breaks = c(10,100,200,300,400,500,600,700,800,900),labels = c("2d17h10m","2d18h30m","2d20h10m","2d21h50m","2d23h30m","3d01h10m","3d02h50m","3d04h10m","3d05h50m","3d07h30m")) +
		ylab("Fraction of input") +
		xlab("Time") +
		annotate("segment", x = 120, xend = 120, y = 0.32, yend = 0.30, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed")) +
		annotate("segment", x = 500, xend = 500, y = 0.32, yend = 0.30, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed")) +
		annotate("segment", x = 530, xend = 530, y = 0.305, yend = 0.28, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed")) +
		annotate("segment", x = 855, xend = 855, y = 0.32, yend = 0.30, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed")) +
		annotate("text", label="Combat", x = 120, y = 0.325, size=4) +
		annotate("text", label="First arrival", x = 500, y = 0.325, size=4) +
		annotate("text", label="Combat", x = 530, y = 0.31, size=4) +
		annotate("text", label="Second arrival", x = 845, y = 0.325, size=4) 

	if(print.plot){
		cairo_pdf(paste0("Plots/Fig3A.pdf"),width=12,height=6)
		plot(p)
		dev.off()
	}

	return(p)
}




