library(ggplot2)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotA = function(print.plot=F)
{
	data = read.table("Data/Poisson_intensity.txt",header=T)
	t = read.table("Data/Poisson_events.txt",header=T)
	t = data.frame(x=t,y=0.5)

	p = ggplot() +
		theme_thesis() +
		geom_point(data = t, aes(x = x, y = y), fill = "#DF8F44", pch = 21, size = 4) + 
		geom_line(data = data, aes(x = x, y = y, color = "Lambdat"), size = 2) +
		scale_color_jama() +
		theme(legend.position = "none"
		) +
	scale_x_continuous(expand=c(0,0),limits=c(0,20)) +
	scale_y_continuous(expand=c(0,0),limits=c(0,5)) +
	ylab(expression(bold("\u03bb"(t)))) +
	xlab("t")


	if(print.plot){
		cairo_pdf(paste0("Plots/Fig4.pdf"),width=12,height=6)
		plot(p)
		dev.off()
	}

	return(p)
}
