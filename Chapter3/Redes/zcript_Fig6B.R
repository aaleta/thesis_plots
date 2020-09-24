library(ggplot2)
library(gridExtra)
library(grid)
library(ggthemes)
library(ggsci)
library(cowplot)
source("../../theme.R")

df = NULL
df = read.table("Data/FFTW/UUU/diagramC.txt",header=T)
df[,3] = "UUU"
a = read.table("Data/FFTW/DUD/diagramC.txt",header=T)
a[,3] = "DUD"
df = rbind(df,a)
a = read.table("Data/FFTW/DDD/diagramC_0.5.txt",header=T)
a[,3] = "DDD"
df = rbind(df,a)
a = read.table("Data/FFTW/UDU/diagramC_0.5.txt",header=T)
a[,3] = "UDU"
df = rbind(df,a)
colnames(df) = c("gamma","beta","id")

p = ggplot() +
        theme_thesis() +
        geom_line(data = df, aes(x = gamma, y = beta, color = id, linetype = id), size=2) +
	scale_linetype_manual(values=c("UUU"="solid","DUD"="dashed","DDD"="dotted","UDU"="dotdash"),guide=FALSE) +
  	scale_colour_manual(breaks = c("UUU","DUD","DDD","UDU"),
				values = c("UUU"="#374E55",
						"DUD"="#DF8F44",
						"DDD"="#00A1D5",
						"UDU"="#B24745"),
				guide = guide_legend(override.aes = list(
								linetype = c("solid","dashed","dotted","dotdash")))
	) +
	labs(title="") +
		ylab(expression(bold("\u03b2"[c]))) +
		xlab(expression(bold("\u03b3"))) +
	theme(legend.position = c(0.75,0.9),
		plot.title = element_text(size=30,hjust = 0.5),
		legend.direction = "vertical",
		legend.title = element_blank(),
		legend.key.size = unit(0.8,"cm"),
		legend.key.width = unit(2,"cm")
		) +
        scale_x_continuous(limits=c(0.,1),expand=c(0,0)) +
        scale_y_continuous(expand=c(0,0),limits=c(0.00,.005)) 

cairo_pdf("Plots/Fig6B.pdf",width=8,height=6)
print(plot_grid(p,align="h",nrow=1,labels=c("B)"),
			label_size=40,label_fontfamily=GlobalFont))
dev.off()

