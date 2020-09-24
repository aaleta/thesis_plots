library(ggplot2)
library(scales)
library(ggsci)
library(ggrepel)
library(stringr)
source("../../theme.R")

plotHist = function(unw,w,title,print.plot = F){
	unw = read.table(paste0("Data/anomalous_",unw,".txt"))[,1]
	w = read.table(paste0("Data/anomalous_",w,".txt"))[,1]
	data = data.frame(x=c(1,2),y=100*c(unw,w))
	
	p = ggplot(data, aes(x = x, y = y, fill = as.factor(x))) +
		theme_thesis() +
		geom_bar(stat="identity",alpha=1,color="black",size=1.5) +
		geom_hline(aes(yintercept=5), linetype = "dashed", size = 2) +
		scale_fill_jama(name="") +
		ggtitle(title) +
		theme(legend.position="none") +
		scale_x_continuous(breaks = data$x, labels = c("Unweighted", "Weighted")) +
		scale_y_continuous(expand = c(0,0), limits = 100*c(0,0.2), breaks = 100*seq(0,0.2,by=0.05)) +
		ylab("Anomalous nodes (%)") +
		xlab("")

	if(print.plot){
		pdf("Plots/Fig4A.pdf")
		plot(p)
		dev.off()
	}

	return(p)
}

