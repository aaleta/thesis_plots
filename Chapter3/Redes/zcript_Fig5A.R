library(ggplot2)
library(gridExtra)
library(grid)
library(ggthemes)
library(ggsci)
source("../../theme.R")

plotUER2 = function(print.plot=F)
{
	#UUU
	a = read.table("Data/UUU/diagramC_k12_mu0.10_ER.txt",header=T)
	data = data.frame(gamma=a$gamma,beta=a$beta,id="sU12")

	#DUD
	a = read.table("Data/DUD/diagramC_k12_mu0.10_ER.txt",header=T)
	data = rbind(data,data.frame(gamma=a$gamma,beta=a$beta,id="sD12"))

	#DDD
	a = read.table("Data/DDD/diagramC_k12_mu0.10_p0.5_ER.txt",header=T)
	data = rbind(data,data.frame(gamma=a$gamma,beta=a$beta,id="DDD"))

	#UDU
	a = read.table("Data/UDU/diagramC_k12_mu0.10_p0.5_ER.txt",header=T)
	data = rbind(data,data.frame(gamma=a$gamma,beta=a$beta,id="UDU"))

	UUU = function(gamma,d){
		mu = 0.1
		Tu = 1-(mu/(gamma+mu))
		A = (1-Tu)/(d+1)
		return(mu*A/(1-A))
	}
	df = data.frame(gamma=seq(0.0,1,by=0.01),beta=UUU(seq(0.0,1,by=0.01),12),id="sU12")

	DUD = function(gamma,d){
		mu = 0.1
		Tu = 1-(mu/(gamma+mu))
		A = (1-Tu)/(d)
		return(mu*A/(1-A))
	}
	df = rbind(df,data.frame(gamma=seq(0.0,1,by=0.01),beta=DUD(seq(0.0,1,by=0.01),12),id="sD12"))

	DDD = function(gamma,d,p)
	{
		mu = 0.1
		Tu = 1-(mu/(gamma+mu))
		m = p*(1-p)*Tu*Tu
		A = 2/(d*(2+m+sqrt(m*(m+8))))
		return(mu*A/(1-A))
	}
	df = rbind(df,data.frame(gamma=seq(0.0,1,by=0.01),beta=DDD(seq(0.0,1,by=0.01),12,0.5),id="DDD"))

	UDU = function(gamma,d,p)
	{
		mu = 0.1
		Tu = 1-(mu/(gamma+mu))
		m = p*(1-p)*Tu^2
		A = (2*(1+d)+d*m-sqrt(d*m*(4+8*d+d*m)))/(2*((1+d)^2-d^2*m))
		return(mu*A/(1-A))
	}
	df = rbind(df,data.frame(gamma=seq(0.0,1,by=0.01),beta=UDU(seq(0.0,1,by=0.01),12,0.5),id="UDU"))

	data = data[data$gamma<0.20,]

	p = ggplot() +
		theme_thesis() +
        	geom_point(data = data, aes(x = gamma, y = beta, color = id, shape = id), size=4, stroke=2) +	
		geom_line(data = df, aes(x = gamma, y = beta, color = id, linetype = id), size=2) +
		scale_shape_manual(values=c("DDD" = 0, "sU12" = 2, "UDU" = 23, "sD12" = 25),guide=FALSE) +
		scale_linetype_manual(values=c("sU12"="dashed","sD12"="dashed","DDD"="dashed","UDU"="dashed"),guide=FALSE) +
		scale_color_jama(breaks = c("sU12","sD12","DDD","UDU"),
					labels = c("sU12" = "UUU", 
							"sD12" = "DUD",
							"DDD" = "DDD",
							"UDU" = "UDU"),
					guide = guide_legend(override.aes = list(
									shape = c(0,2,23,25),
									linetype = c(NA,NA,NA,NA)))
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
        	scale_y_continuous(limits=c(0.000,0.012),expand=c(0,0),breaks=seq(.00,.02,by=.002)) 

	if(print.plot){
		pdf(paste0("Plots/Fig5A.pdf"),width=8,height=6)
		plot(p)
		dev.off()
	}

	return(p)
}


