library(ggplot2)
library(cowplot)
library(ggsci)
library(fitdistrplus)
library(data.table)
source("../../theme.R")

plotMatrix = function(country = NULL, short = NULL, color = "lime", print.plot = F)
{
	m = read.table(paste0("Data/",country,"/Center/pi_matrix.txt"))
	data = data.frame(x = c(1:15)[row(m)], y = c(1:15)[col(m)], values = c(as.matrix(m)))

	p = ggplot(data, aes(x = x, y = y)) +
		theme_thesis() +
		geom_tile(aes(fill = values)) +
		scale_fill_material(name = "", color)+
		ggtitle(paste0(country,"(",short,")")) +
		guides(fill = guide_colourbar(ticks.colour = "black",
				                ticks.linewidth = 2,
				                frame.colour = "black",
				                frame.linewidth = 2,
						barheight = unit(.333,"npc"),
						barwidth = unit(.045,"npc")))+
		theme(legend.direction = "vertical",
			legend.position = "right",
			legend.margin = margin(l = -.06, t = -.085, unit = 'npc'),
			axis.line = element_blank(),
			axis.title = element_blank(),
			panel.border = element_rect(colour = "black"),
			plot.margin=unit(c(0,0,0,0),"mm")) +
		scale_x_continuous(expand = c(0,0), limits = c(.5,15.5), breaks = c(1,8,15),
					labels = c("0-4","35-39","+70")) +
		scale_y_continuous(expand = c(0,0), limits = c(.5,15.5), breaks = c(1,8,15),
					labels = c("0-4","35-39","+70")) +
		coord_fixed()

	if(print.plot){
		pdf("Plots/Fig3A.pdf",width=6,height=6)
		print(p)
		dev.off()
	}
	return(p)
}

