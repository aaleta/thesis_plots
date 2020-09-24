library(ggplot2)
library(ggthemes)
library(gridExtra)
library(grid)
source("../../theme.R")

plotSizeNew = function(print.plot=F)
{
	data_mean = read.table("Data/sizeNew_mean.txt",header=T)
	data_mean = data_mean[data_mean$layer!=3,]

	data_teo = data.frame(x=rep(c(-80:80),3),y=c(rep(605.64,161),rep(3.11,161),rep(22.53,161)), 
					layer = c(rep("0",161),rep("1",161),rep("2",161)))

	p = ggplot() +
		theme_thesis() +
		geom_line(data=data_mean,aes(x = t, y = size, color = as.character(layer)), size = 2.5) +
		geom_line(data=data_teo,aes(x = x, y = y, color = layer), linetype = 2, size = 1.5) +
		scale_color_manual(name="",
		                        values=c("0" = "#99311B", "1" = "#99751B", "2" = "#566b83"),
		                        breaks=c("0","1","2"),
		                        labels=c("0" = "School", "1" = "Household", "2" = "Workplace")
		                ) +
		xlab("Time") +
		ylab("Average size") +
		theme(legend.position = c(0.25,0.65),
			legend.direction = "vertical",
		        legend.key.width = unit(4,"line"),
		        legend.key.size = unit(0.9,"cm"),
		        legend.background = element_blank(),
		        legend.margin = unit(0, "cm"),
			panel.border = element_rect(colour = "black", fill=NA, size=1),
			plot.margin = unit(x=c(0.75,0.75,0.75,0.75),units="cm"),
			axis.line = element_blank()
			) +
		scale_x_continuous(expand=c(0,0),limits=c(-40,40)) +
		scale_y_log10(expand=c(0,0),limits = c(1,1100)) +
		annotation_logticks(sides = "l")  

	if(print.plot){
		pdf("Plots/Fig2B.pdf",width=8,height=8,onefile=F)
		plot(p)
		dev.off()
	}

	return(p)
}
