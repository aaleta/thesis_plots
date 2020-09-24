library(ggplot2)
library(ggsci)
library(stringr)
source("../../theme.R")

plotB = function(print.plot=F)
{
	all = read.table("Data/result_incidence_all.txt")[,1]
	degree = read.table("Data/results_incidence_homoAge.txt")[,1]

	data = data.frame(x=c(1:15),y=(all-degree)*100/degree)

	p = ggplot() +
		theme_thesis() +
		geom_col(data = data, aes(x = x, y = y, fill = "a"), size = 3) +
		scale_fill_jama() +
		theme(legend.position = "none",
			axis.text.x = element_text(size=20),
			plot.margin = margin(1,1,1,3,"cm")
			) +
		scale_x_continuous(expand = c(0,0), limits = c(.5,15.5), breaks = c(1:15),
					labels = c(paste(seq(0,65,by=5),seq(4,69,by=5),sep="-"),"+70")) +
		scale_y_continuous(expand = c(0,0),  limits = c(-25,25), breaks=c(-25,-15,-5,0,5,15,25),
					labels = c(-25,-15,-5,"",5,15,25)) +
		xlab("Age Group") +
		ylab("Age+Net vs. Age (%)")

	if(print.plot){
		pdf("Plots/Fig2.pdf",width=16)
		plot(p)
		dev.off()
	}

	return(p)
}
