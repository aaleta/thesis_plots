library(ggplot2)
library(gridExtra)
library(grid)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotUSF = function(print.plot=F)
{
	#UUU
	a = read.table("Data/UUU/diagramC_g2.7_mu0.10_SF.txt",header=T)
	data = data.frame(gamma=a$gamma,beta=a$beta,id="sU6")
	a = read.table("Data/UUU/diagramC_g2.8_mu0.10_SF.txt",header=T)
	data = rbind(data,data.frame(gamma=a$gamma,beta=a$beta,id="sU12"))

	#DUD
	a = read.table("Data/DUD/diagramC_g2.7_mu0.10_SF.txt",header=T)
	data = rbind(data,data.frame(gamma=a$gamma,beta=a$beta,id="sD6"))
	a = read.table("Data/DUD/diagramC_g2.8_mu0.10_SF.txt",header=T)
	data = rbind(data,data.frame(gamma=a$gamma,beta=a$beta,id="sD12"))

	data = data[data$gamma<0.20,]

	p = ggplot() +
		theme_thesis() +
        	geom_point(data = data, aes(x = gamma, y = beta, color = id, shape = id), size=4, stroke=2) +	
		scale_shape_manual(values=c("sU6" = 0, "sU12" = 2, "sD6" = 23, "sD12" = 25),guide=FALSE) +
		scale_color_jama(breaks = c("sU6", "sU12", "sD6", "sD12"),
					labels = c("sU6" = "UUU <k>=7.85", 
							"sU12" = "UUU <k>=18.50", 
							"sD6" = "DUD <k>=7.85", 
							"sD12" = "DUD <k>=18.50"),
					guide = guide_legend(override.aes = list(
									shape = c(0,2,23,25)))
		) +
		labs(title="SF") +
		ylab(expression(bold("\u03b2"[c]))) +
		xlab(expression(bold("\u03b3"))) +
		theme(legend.position = c(0.75,0.9),
			plot.title = element_text(size=30,hjust = 0.5),
			legend.direction = "vertical",
			legend.title = element_blank(),
			legend.key.size = unit(0.8,"cm"),
			) +
		scale_x_continuous(limits=c(0.0,0.20),expand=c(0,0)) +
        	scale_y_continuous(limits=c(0.000,0.02),expand=c(0,0),breaks=seq(.00,.02,by=.004)) 

	if(print.plot){
		pdf(paste0("Plots/Fig3B.pdf"),width=8,height=6)
		plot(p)
		dev.off()
	}

	return(p)
}
