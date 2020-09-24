library(ggplot2)
library(gridExtra)
library(grid)
library(ggthemes)
source("../../theme.R")

plotAttack = function(print.plot=F)
{
	data = read.table("Data/sizeAttack_S.txt",header=T)
	data$attack = data$attack*100

	p1 = ggplot(data,aes(x=size,y=attack,fill="#99311B")) +
		theme_thesis() +
		geom_bar(stat="identity",color="#99311B",fill="#99311B")+
		xlab("School size") +
		ylab("Attack Rate (%)") +
		theme(legend.position = "none",
			text = element_text(size=24,family=GlobalFont),
			panel.grid.major.y = element_line(color="gray",linetype=2,size=1), 
			plot.margin = unit(x=c(0.75,0.75,0.75,3),units="cm")
			) +
		scale_y_continuous(expand=c(0,0),limits=c(0,100)) +
		scale_x_continuous(expand=c(0,0),breaks=floor(seq(min(data$size),max(data$size),length.out=6)))


	data = read.table("Data/sizeAttack_H.txt",header=T)
	data$attack = data$attack*100

	p2 = ggplot(data,aes(x=size,y=attack,fill="#99751B")) +
		theme_thesis() +
		geom_bar(stat="identity",color="#99751B",fill="#99751B")+
		xlab("Household size") +
		ylab("Attack Rate (%)") +
		theme(legend.position = "none",
			text = element_text(size=24,family=GlobalFont),
			panel.grid.major.y = element_line(color="gray",linetype=2,size=1), 
			plot.margin = unit(x=c(0.75,0.75,0.75,3),units="cm")
			) +
		scale_y_continuous(expand=c(0,0),limits=c(0,100))  +
		scale_x_continuous(expand=c(0,0),breaks=c(2:7))


	data = read.table("Data/sizeAttack_W.txt",header=T)
	data$attack = data$attack*100

	p3 = ggplot(data,aes(x=size,y=attack,fill="#566b83")) +
		theme_thesis() +
		geom_bar(stat="identity",color="#566b83",fill="#566b83")+
		xlab("Workplace size") +
		ylab("Attack Rate (%)") +
		theme(legend.position = "none",
			text = element_text(size=24,family=GlobalFont),
			panel.grid.major.y = element_line(color="gray",linetype=2,size=1), 
			plot.margin = unit(x=c(0.75,0.75,0.75,3),units="cm")
			) +
		scale_y_continuous(expand=c(0,0),limits=c(0,100))  +
		scale_x_continuous(expand=c(0,0),breaks=floor(seq(min(data$size),max(data$size),length.out=6)))


	p = grid.arrange(p1,p2,p3,ncol=1)

	if(print.plot){
		pdf(paste0("Plots/Fig2A.pdf"),width=6,height=16)
		plot(p)
		dev.off()
	}

	return(p)
}
