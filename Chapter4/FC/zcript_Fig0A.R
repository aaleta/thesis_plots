library(ggplot2)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotA = function(print.plot=F)
{
	data = read.table("Data/monthly_posts.txt",header=T)
	data$x = c(1:nrow(data))

	p = ggplot() +
		theme_thesis() +
		geom_point(data=data,aes(x=x,y=Count,color="a"),size=3) +
		geom_line(data=data,aes(x=x,y=Count,color="a"),size=1.5,alpha=0.5)+
		scale_color_jama() +
		theme(legend.position = "none",
			plot.margin = unit(c(1,1,1,2), "cm"),
			axis.text.x = element_text(angle = 45, hjust = 1)
		) +
		scale_y_continuous(expand=c(0,0),limits=c(0,1520000),
			labels=c(0,expression(5%.%10^5),expression(10^6),expression(1.5%.%10^6))) +
		scale_x_continuous(expand=c(0,0),limits=c(1,168),breaks=seq(1,nrow(data),by=12),
					labels=data$date[seq(1,nrow(data),by=12)])+
		xlab("Date") +
		ylab("Number of new posts")

	if(print.plot){
		cairo_pdf(paste0("Plots/Fig0A.pdf"),width=10,height=10)
		plot(p)
		dev.off()
	}

	return(p)
}

plotA(T)
