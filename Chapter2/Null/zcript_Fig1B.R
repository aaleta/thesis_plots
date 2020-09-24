library(ggplot2)
library(scales)
library(ggsci)
library(ggrepel)
library(stringr)
source("../../theme.R")

plotL = function(print.plot = F){
	data = read.table("Data/networks.txt",header=T)
	points = data.frame(x = 2*data$L, y = data$km)
	line = data.frame(x = sort(points$x))
	
	p = ggplot() +
		theme_thesis() +
		geom_point(data = points, aes(x = x, y = y, color = "a"))+
		geom_line(data = line, aes(x = x, y = sqrt(x), color = "b"), size = 2) +
		geom_text(aes(x = 2E8, y = 5E3), angle = 35, label = expression(k[max] == sqrt("2L")), family = GlobalFont, size = 10) +
		scale_color_jama(name="") +
		theme(legend.position="none") +
		scale_x_log10(expand = c(0,0), limits = c(10,1E10), breaks = c(10,10^seq(3,10,by=2)),labels = trans_format("log10", math_format(10^.x))) +
		scale_y_log10(expand=c(0,0), limits = c(10,3E7), breaks = 10^c(1:7),labels = trans_format("log10", math_format(10^.x))) +
		xlab("2L") +
		ylab(expression(bold(k[max]))) +
		annotation_logticks() 

	if(print.plot){
		pdf("Plots/Fig1B.pdf")
		plot(p)
		dev.off()
	}

	return(p)
}

