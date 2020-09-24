library(ggplot2)
library(ggthemes)
library(ggsci)
library(lubridate)
source("../../theme.R")

plotA = function(print.plot=F)
{
	data = read.table("Data/validity_n.txt",header=T)
	data = data[complete.cases(data),]

	p = ggplot(data, aes(x, fill=as.factor(y))) +
		theme_thesis() +
		geom_histogram(alpha = 0.5, position = 'identity') +
		scale_fill_manual(values=c("#DF8F44","#00A1D5","#374E55","#B24745","#79AF97")) +
		guides(fill=guide_legend(nrow=1,byrow=TRUE)) +
		theme(legend.key = element_rect(colour = NA),
			legend.position = "bottom",
			legend.direction = "horizontal",
			legend.key.size= unit(1, "cm"),
			legend.title = element_blank(),
			legend.spacing.x = unit(0.5, 'cm'),
		  	plot.margin=unit(c(1,1,1,2),"cm"),
		) +
		xlab("Number of posts") +
		ylab("Number of threads") +
		coord_cartesian(clip = 'off') +
		scale_x_log10(expand=c(0,0)) +
		scale_y_continuous(expand=c(0,0))


	if(print.plot){
		cairo_pdf(paste0("Plots/Fig6A.pdf"),width=8,height=8)
		plot(p)
		dev.off()
	}

	return(p)
}
