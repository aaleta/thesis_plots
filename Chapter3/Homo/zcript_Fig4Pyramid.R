library(ggplot2)
library(cowplot)
library(ggsci)
library(fitdistrplus)
library(data.table)
source("../../theme.R")

plotPyramid = function(country = NULL, year1 = NULL, year2 = NULL, color = NULL, factor = 1, print.plot = F)
{
	data = read.table(paste0("Data/",country,"_",year1,"_",year2,".txt"), header = T)

	offset = 600*factor

	p = ggplot(data, aes(x = Age)) +
		theme_thesis() +
		geom_linerange(data = data[data$Year==year1,], aes(ymin = -offset, ymax = -offset+Population), 
					size = 7, alpha = .8, color = pal_material(color, reverse = T)(1)) +
		geom_linerange(data = data[data$Year==year2,], aes(ymin = offset, ymax = offset+Population),
					size = 7, alpha = .8, color = pal_material(color, reverse = T)(1)) +
		geom_label(aes(x = Age, y = 0, label = label),
			 inherit.aes = F,
			 size = 5, label.padding = unit(0.0, "lines"), label.size = 0,
			 label.r = unit(0.0, "lines"), alpha = 0.9, color = "black") +
		labs(title = paste0(year1,"   vs   ",year2)) +
		theme(panel.grid.major.x = element_line(linetype = "dotted", size = 0.3, color = "#3A3F4A"),
	    		axis.title = element_blank(),
	    		axis.text.x = element_text(size = 18, color = "black"),
	    		axis.text.y = element_blank(),
			axis.line.x = element_blank(),
			axis.line.y = element_blank(),
			axis.ticks = element_blank(),
			plot.title = element_text(size = 30, color = "black")
			) +
		scale_y_continuous(expand=c(0,0),limits=c(-4000*factor-offset,4000*factor+offset),
					labels = c(paste0(c(4:1)*factor,"M"),0,0,paste0(c(1:4)*factor,"M")),
					breaks = c(-offset+factor*c(-4000,-3000,-2000,-1000,0),offset+factor*c(0,1000,2000,3000,4000))) +
	 	scale_x_continuous() +
	  	coord_flip()


	if(print.plot){
		pdf("Plots/Fig4Pyramid.pdf",width=6,height=6)
		print(p)
		dev.off()
	}
	return(p)
}

