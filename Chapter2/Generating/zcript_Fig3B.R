library(ggplot2)
library(ggsci)
source("../../theme.R")

plotK = function(print.plot=F)
{
	data = read.table("Data/degree_fig3b.txt",header=T)
	line = data.frame(x=data$x,y=data$y)

	p = ggplot() +
		theme_thesis() +
                geom_point(data = data, aes(x = x, y = y, color = "a"), size=3) +
                geom_ribbon(data = data, aes(x=x,ymin=yl,ymax=yu), color="gray",alpha=0.2) +
                geom_line(data = line, aes(x = x, y = y), color="black", size=1, linetype="dashed") +
		scale_color_jama() +
		theme(legend.position = "none") +
		scale_y_continuous(expand=c(0,0),limits=c(0,120))  +
		scale_x_continuous(expand=c(0,0),limits=c(0,120)) +
		coord_fixed() +
                ylab(expression(bold("<"~k[i*"\u03b1"]^{"\u03b2"}~">"))) +
                xlab(expression(bold(k[i*"\u03b1"]^"\u03b2"~"data")))


	if(print.plot){
		cairo_pdf("Plots/Fig3B.pdf",width=6,height=6)
		plot(p)
		dev.off()
	}
}

plotK(T)
