library(ggplot2)
library(cowplot)
library(ggsci)
library(fitdistrplus)
library(data.table)
source("../../theme.R")

plotDiff = function(country = NULL, color = "lime", print.plot = F)
{
	data = read.table(paste0("Data/",country,"_E.txt"),header = T)
	p = ggplot() +
		theme_thesis() +
		geom_line(data = data, aes(x = year, y = E), color = pal_material(color, reverse = T)(1), size = 3) +
		theme(legend.position = "none") +
		scale_y_continuous(expand = c(0,0), limits = c(0,0.41), breaks = seq(0,0.4,by=.1),
					labels = paste0(seq(0,40,by=10),"%")) +
		xlab("Year") +
		ylab("Reciprocity error")

	if(print.plot){
		pdf("Plots/Fig4Diff.pdf",width=6,height=6)
		print(p)
		dev.off()
	}
	return(p)
}

plotDiff("Zimbabwe", color = "lime", print.plot = T)
