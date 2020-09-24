library(ggplot2)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotB = function(print.plot=F)
{
	data = read.csv("Data/dailiy_activity_TW.csv")
	data$x = c(1:nrow(data))

	p = ggplot() +
		theme_thesis() +
		geom_point(data=data,aes(x=x,y=Tweets,color="Mean"),size=3)+
		geom_line(data=data,aes(x=x,y=Tweets,color="Mean"),size=1.5)+
		scale_color_jama() +
		ggtitle("Twitter") +
		theme(legend.position = "none",
			plot.margin = unit(c(1,1,-1,2), "cm"),
			axis.text.x = element_text(angle = 45, hjust = 1, size = 20)
		) +
		scale_x_continuous(expand=c(0,0),breaks=seq(1,nrow(data),by=12),labels=data$Date[seq(1,nrow(data),by=12)])+
		xlab("") +
		ylab("Number of tweets")

	if(print.plot){
		cairo_pdf(paste0("Plots/Fig2B.pdf"),width=8,height=8)
		plot(p)
		dev.off()
	}

	return(p)
}
