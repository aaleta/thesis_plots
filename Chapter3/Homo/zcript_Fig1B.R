library(ggplot2)
library(ggsci)
library(stringr)
source("../../theme.R")

plotTH = function(print.plot = F){
	data = read.table("Data/threshold_homo.txt",header=T)
	
	p = ggplot() +
		theme_thesis() +
		geom_line(data = data, aes(x = beta, y = r, color = "s"), size = 3) +
		scale_color_jama() +
		theme(legend.position = "none") +
		scale_x_continuous(expand = c(0,0), limits = c(0,4.05)) +
		scale_y_continuous(expand = c(0,0), limits = c(0,1.05)) +
		xlab(expression(bold("\u03b2"/"\u03bc"))) +
		ylab(expression(bold(r(infinity))))

	if(print.plot){
		pdf("Plots/Fig1B.pdf")
		plot(p)
		dev.off()
	}

	return(p)
}
