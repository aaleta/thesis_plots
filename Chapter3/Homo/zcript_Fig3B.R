library(ggplot2)
library(cowplot)
library(ggsci)
library(data.table)
library(shadowtext)
source("../../theme.R")

plotr = function(print.plot = F)
{
	data = read.table("Data/assortativity.txt",header=T,stringsAsFactors=F)

	p = ggplot() +
		theme_thesis() +
		geom_point(data = data, aes(x = r, y = y, color = type), size = 26)+
		geom_shadowtext(data = data, aes(x = r, y = y, label = abv), color = "white", size = 12, 
					nudge_x = .001, nudge_y = -.001) +
		scale_color_manual(name="", values = c("pol" = pal_material("purple", reverse = T)(1), 
							"npol" = pal_material("red", reverse = T)(1), 
							"asia" = pal_material("green", reverse = T)(1), 
							"afr" = pal_material("lime", reverse = T)(1)),
						labels = c("afr" = "Africa",
								"asia" = "Asia",
								"pol" = "Europe (Polymod)",
								"npol" = "Europe (non Polymod)"),
						breaks = c("pol","npol","asia","afr")) +
		theme(legend.position = c(0.35, 0.85),
			legend.direction = "vertical",
			text = element_text(size = 50),
			legend.text = element_text(size = 50)) +
		scale_x_continuous(expand = c(0,0), limits = c(0,0.6), breaks = seq(0,0.6,by=.1)) +
		scale_y_continuous(expand=c(0,0), limits = c(0.15,0.55), breaks = seq(0.15,0.55,by=0.1)) +
		xlab("Assortativity") +
		ylab("Young connectivity")

	if(print.plot){
		pdf("Plots/Fig3B.pdf",width=12,height=12)
		print(p)
		dev.off()
	}
	return(p)
}
