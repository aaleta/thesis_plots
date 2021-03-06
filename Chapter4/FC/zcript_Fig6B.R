library(ggplot2)
library(ggthemes)
library(ggsci)
library(scales)
source("../../theme.R")

plotB = function(print.plot=F)
{
	data = read.table("Data/validity_length.txt",header=T)

	p = ggplot(data, aes(x, fill=as.factor(y))) +
		theme_thesis() +
		geom_histogram(alpha = 0.5, position = 'identity', linetype="blank") +
		scale_fill_manual(values=c("#DF8F44","#00A1D5","#374E55","#B24745","#79AF97")) +
		guides(fill=guide_legend(nrow=2,byrow=TRUE)) +
		theme(plot.margin=unit(c(1,1,1,2),"cm"),
		) +
		xlab("Thread duration [minutes]") +
		ylab("Number of threads") +
		coord_cartesian(clip = 'off') +
		scale_x_log10(expand=c(0,0),labels = trans_format("log10", math_format(10^.x))) +
		scale_y_continuous(expand=c(0,0))


	if(print.plot){
		cairo_pdf(paste0("Plots/Fig6B.pdf"),width=8,height=8)
		plot(p)
		dev.off()
	}

	return(p)
}
