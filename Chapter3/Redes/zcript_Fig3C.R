library(ggplot2)
library(gridExtra)
library(grid)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotDER = function(print.plot=F)
{
	#DDD
	a = read.table("Data/UDU/diagramC_k6_mu0.10_p0.5_ER.txt",header=T)
	data = data.frame(gamma=a$gamma,beta=a$beta,id="sU6")
	a = read.table("Data/UDU/diagramC_k12_mu0.10_p0.5_ER.txt",header=T)
	data = rbind(data,data.frame(gamma=a$gamma,beta=a$beta,id="sU12"))

	#UDU
	a = read.table("Data/DDD/diagramC_k6_mu0.10_p0.5_ER.txt",header=T)
	data = rbind(data,data.frame(gamma=a$gamma,beta=a$beta,id="sD6"))
	a = read.table("Data/DDD/diagramC_k12_mu0.10_p0.5_ER.txt",header=T)
	data = rbind(data,data.frame(gamma=a$gamma,beta=a$beta,id="sD12"))

	data = data[data$gamma<0.20,]

	p = ggplot() +
		theme_thesis() +
        	geom_point(data = data, aes(x = gamma, y = beta, color = id, shape = id), size=4, stroke=2) +	
		scale_shape_manual(values=c("sU6" = 0, "sU12" = 2, "sD6" = 23, "sD12" = 25),guide=FALSE) +
		scale_color_jama(breaks = c("sU6", "sU12", "sD6", "sD12"),
					labels = c("sU6" = "UDU <k>=6", 
							"sU12" = "UDU <k>=12", 
							"sD6" = "DDD <k>=6", 
							"sD12" = "DDD <k>=12"),
					guide = guide_legend(override.aes = list(
									shape = c(0,2,23,25)))
		) +
		labs(title="ER") +
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
		pdf(paste0("Plots/Fig3C.pdf"),width=8,height=6)
		plot(p)
		dev.off()
	}

	return(p)
}

