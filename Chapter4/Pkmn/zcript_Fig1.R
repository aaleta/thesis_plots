library(ggplot2)
library(ggsci)
source("../../theme.R")

data = read.table("Data/start9.txt",header=T)

breaks =
labels = 
p = ggplot(data,aes(x=x,y=value)) +
	theme_thesis() +
	geom_area(aes(color=variable,fill=variable)) +
	labs(color="",fill="") +
	scale_color_manual(values=c("a"="#79AF97","left"="#374E55","right"="#DF8F44","up"="#00A1D5","down"="#B24745","b"="#6A6599","start"="#80796B","start9"="#FCBBCF"),
				labels=c("left"='\u2190',"right"='\u2192',"up"='\u2191',"down"='\u2193',"a"="a","b"="b","start"="start","start9"="start9"),
				breaks=c("left","right","up","down","a","b","start","start9")) +
	scale_fill_manual(values=c("a"="#79AF97","left"="#374E55","right"="#DF8F44","up"="#00A1D5","down"="#B24745","b"="#6A6599","start"="#80796B","start9"="#FCBBCF"),
				labels=c("left"='\u2190',"right"='\u2192',"up"='\u2191',"down"='\u2193',"a"="a","b"="b","start"="start","start9"="start9"),
				breaks=c("left","right","up","down","a","b","start","start9")) +
	theme(text=element_text(size=16,family=GlobalFont),
		panel.border = element_rect(colour = "black", fill=NA, size=2),
		panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
		plot.margin=grid::unit(c(0.5,2,0.5,0.5), "cm"),
		legend.position = "top",
		legend.background = element_rect(fill=NA),
		legend.text = element_text(size=18),
		legend.box = "horizontal",
		axis.line = element_blank(),
		legend.key.width = unit(0.6,"cm"),
		legend.box.margin=margin(-10,-10,-30,-10)
		) +
	guides(colour = guide_legend(nrow = 1, override.aes = list(size=2))) +
	scale_y_continuous(expand=c(0,0),limits=c(0,1200)) +
	scale_x_continuous(expand=c(0,0),limits=c(1,100),breaks=seq(1,100,by=10),labels=c("5d8h31m","5d8h41m","5d8h51m","5d9h01m","5d9h11m","5d9h21m","5d9h31m","5d9h41m","5d9h51m","5d10h01m")) +
	ylab("Number of commands") +
	xlab("Time") +
	annotate("segment", x = 1, xend = 7, y = 500, yend = 500, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed", ends="both")) +
	annotate("segment", x = 20, xend = 28, y = 500, yend = 500, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed", ends="both")) +
	annotate("segment", x = 60.5, xend = 66.5, y = 500, yend = 500, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed", ends="both")) +
	annotate("text", label="Off", x = 4, y = 550, size=4) +
	annotate("text", label="Off", x = 24, y = 550, size=4) +
	annotate("text", label="Off", x = 63, y = 550, size=4) +
	annotate("segment", x = 7, xend = 7, y = 1100, yend = 1000, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed")) +
	annotate("segment", x = 29, xend = 29, y = 1000, yend = 900, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed")) +
	annotate("text", label="Voting system introduced (10s)", x = 12, y = 1150, size=4) +
	annotate("text", label="Voting system modified (5s)", x = 29, y = 1050, size=4) +
	annotate("segment", x = 37, xend = 37, y = 900, yend = 800, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed")) +
	annotate("text", label="First start9", x = 37, y = 950, size=4) +
	annotate("segment", x = 46, xend = 46, y = 800, yend = 700, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed")) +
	annotate("text", label="Beggining of start9 protest", x = 47, y = 850, size=4) +
	annotate("segment", x = 67, xend = 67, y = 850, yend = 750, colour = "black", size=0.5, alpha=1, arrow=arrow(length=unit(0.20,"cm"), type = "closed")) +
	annotate("text", label="Voting system removed", x = 67, y = 900, size=4) 



cairo_pdf("Plots/Fig1.pdf",width=12,height=6)
plot(p)
dev.off()

