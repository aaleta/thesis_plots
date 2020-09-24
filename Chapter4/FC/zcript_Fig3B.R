library(ggplot2)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotB = function(print.plot=F)
{
	data = read.table("Data/din.txt",header=T)
	data$x = c(1:nrow(data))

	p = ggplot() +
		theme_thesis() +
		geom_point(data=data,aes(x=x,y=Count,color="a"),size=3) +
		geom_line(data=data,aes(x=x,y=Count,color="a"),size=1.5,alpha=0.5)+
		scale_color_jama() +
		ggtitle("din") +
		theme(legend.position = "none",
			plot.margin = unit(c(1,1,-1,2), "cm"),
			axis.text.x = element_text(angle = 45, hjust = 1)
		) +
		scale_x_continuous(expand=c(0,0),breaks=seq(1,nrow(data),by=12),labels=data$date[seq(1,nrow(data),by=12)])+
		xlab("") +
		ylab("Number of posts")

	if(print.plot){
		cairo_pdf(paste0("Plots/Fig3B.pdf"),width=12,height=6)
		plot(p)
		dev.off()
	}

	return(p)
}

plotB(T)
