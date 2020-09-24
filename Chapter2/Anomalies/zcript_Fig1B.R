library(ggplot2)
library(scales)
library(ggsci)
library(ggrepel)
library(stringr)
source("../../theme.R")

plotBW = function(print.plot = F){
	random = read.table("Data/AIR_agg_bw_vs_k_random.txt",header=T)
	network = read.table("Data/AIR_agg_bw_vs_k.txt",header=T)
	labels = read.table("Data/AIR_agg_bw_vs_k_label.txt",header=T)
	
	p = ggplot() +
		theme_thesis() +
		geom_ribbon(data = random, aes(x = k, ymin = Lower, ymax = Upper), fill = "gray", alpha = 0.4) +
		geom_point(data = network, aes(x = k, y = b, color = str_wrap(Continent, 10)))+
		geom_text_repel(data = labels, aes(x = k, y = b, label = Country), size = 3, box.padding = unit(0.15,"lines")) +
		scale_color_jama(name="") +
		guides(color = guide_legend(override.aes = list(size = 4))) +
		theme(legend.position="top") +
		scale_x_log10(expand = c(0,0), limits = c(1.95,202), breaks = c(2,5,10,20,50,100,200)) +
		scale_y_log10(expand=c(0,0), limits = c(10^(-7),0.4), breaks = 10^c(-6:-1),labels = trans_format("log10", math_format(10^.x))) +
		xlab("Degree") +
		ylab("Betweenness") +
		annotation_logticks(short = unit(.01, "npc"), mid = unit(.01, "npc"), long = unit(.02, "npc"))

	if(print.plot){
		pdf("Plots/Fig1B.pdf")
		plot(p)
		dev.off()
	}

	return(p)
}

