library(ggplot2)
library(ggthemes)
library(ggsci)
library(scales)
source("../../theme.R")

plotB = function(print.plot=F)
{
	data = read.table("Data/threadSize_2011_2014.txt",header=T)
	fit = data.frame(x=data$x,y=dlnorm(data$x,meanlog=2.79,sdlog=1.25))

	p = ggplot() +
		theme_thesis() +
		geom_point(data=data,aes(x=x,y=Count,color="data"),size=3) +
		geom_line(data=fit,aes(x=x,y=y,color="fit"),size=1.5,alpha=1)+
		scale_color_jama(name="") +
 		guides(colour = guide_legend(override.aes = list(size=6,shape=c(16,NA), linetype=c(NA,1)))) +
		theme(legend.position = c(0.25,0.25),
			legend.direction = "vertical",
			legend.text = element_text(size=24),
			legend.key.size = unit(1,"cm"),
			plot.margin = unit(c(1,1,1,2), "cm")
		) +
		scale_y_log10(expand=c(0,0),limits=c(0.0000008,0.1),breaks=c(10^{-c(1:6)}),labels = trans_format("log10", math_format(10^.x))) +
		scale_x_log10(expand=c(0,0),labels = trans_format("log10", math_format(10^.x)))+
		xlab("Thread popularity") +
		ylab("P(x)") +
		annotation_logticks() 

	if(print.plot){
		cairo_pdf(paste0("Plots/Fig0B.pdf"),width=8,height=8)
		plot(p)
		dev.off()
	}

	return(p)
}

plotB(T)
