library(ggplot2)
library(cowplot)
library(ggsci)
library(fitdistrplus)
library(data.table)
source("../../theme.R")

plotCountry = function(method,title,print.plot = F)
{
	data = read.table("Data/data_diff_all_age2050.txt",header=T)
	data$country = gsub("_"," ",data$country)
	
	data = data[data$method==method,]
	data = data[order(data$ageS),]
	data$id = c(1:16)

	n = round(100*data$dif,0)
	data$number = paste0(ifelse(n>0,"+",""),n,"%")

	data2 = data.frame(age=c(-1,-1,-1,-1),dif=c(0,0,0,0),color=c(1,2,3,4))

	proportion = 80
	offset = 2.5

	p = ggplot() +
		theme_thesis() +
		geom_segment(data=data,aes(x=ageS,xend=ageS,y=id-0.5,yend=id+0.5)) +
		geom_segment(data=data,aes(x=ageS,xend=ageD,y=id+0.25,yend=id+0.25,group=factor(id))) +
		geom_point(data=data,aes(x=ageD,y=id+0.25,group=factor(id))) +
		geom_segment(data=data,aes(x=ageS,xend=ageS+proportion*dif,y=id-0.25,yend=id-0.25,group=factor(id),color=factor(color)),size=3) +
		geom_hline(yintercept=data$id,linetype=2,color="gray") +
		geom_text(data=data,aes(x=ageS+proportion*dif+sign(dif)*offset,y=id-0.25,label=number),size=7,show.legend=F) +
		scale_colour_manual(name="",values=c(pal_material("purple", reverse = T)(1),
							pal_material("red", reverse = T)(1),
							pal_material("green", reverse = T)(1), 
							pal_material("lime", reverse = T)(1)),
						labels=c("Europe, Polymod","Europe, not Polymod","Asia","Africa")) +
		labs(title = title) +
		theme(legend.position = "top",
			legend.text = element_text(size=25),
			plot.title = element_text(size=50),
			legend.key.width = unit(0.04,"npc"),
			panel.border = element_rect(colour = "black", fill=NA, size=2),
			legend.margin = margin(l = -.2, b = -.03, unit = 'npc'),
			axis.line = element_blank(),
			axis.ticks.length = unit(0.3,"cm"),
			axis.ticks = element_line(size=0.6)) +
		scale_y_continuous(expand=c(0.01,0.01),limits=c(0.5,16.5),breaks=c(1:16),labels=data$country) +
		scale_x_continuous(limits=c(10,60),breaks=seq(10,60,by=10)) +
		xlab("Median age") +
		ylab("") 


	if(print.plot){
		pdf("Plots/Fig5A.pdf",width=12,height=10)
		print(p)
		dev.off()
	}
	return(p)
}
