library(ggplot2)
library(ggsci)
library(stringr)
source("../../theme.R")

plotSIR = function(print.plot = F){
	data = read.table("Data/sir.txt",header=T)
	
	p = ggplot() +
		theme_thesis() +
		geom_line(data = data, aes(x = t, y = s, color = "s"), size = 3) +
		geom_line(data = data, aes(x = t, y = i, color = "i"), size = 3) +
		geom_line(data = data, aes(x = t, y = r, color = "r"), size = 3) +
		scale_color_jama(name="", breaks = c("s","i","r"), labels = c("Susceptible","Infected","Removed")) +
		theme(legend.position = c(0.8,0.9),
			legend.direction = "vertical",
			legend.key.width = unit(4, "line"),
			legend.text = element_text(size = 24)) +
		scale_x_continuous(expand = c(0,0), limits = c(0,600)) +
		scale_y_continuous(expand = c(0,0), limits = c(0,1.05)) +
		xlab("Time") +
		ylab("Fraction of individuals")

	if(print.plot){
		pdf("Plots/Fig1A.pdf")
		plot(p)
		dev.off()
	}

	return(p)
}

