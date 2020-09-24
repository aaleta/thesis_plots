library(ggplot2)
library(ggsci)
library(stringr)
source("../../theme.R")


data = read.table("Data/measlesNY.txt",header=T)

p = ggplot() +
	theme_thesis() +
	geom_line(data = data, aes(x = x, y = y, color = "s"), size = 3) +
	scale_color_jama(name="") +
	theme(legend.position = "none") +
	scale_x_continuous(expand = c(0,0), limits = c(1,tail(data$x,1)), breaks = seq(1,tail(data$x,1),by=26*3), labels = seq(1906,1948,by=3)) +
	scale_y_continuous(expand = c(0,0), limits = c(0,15000), breaks = seq(0,15000,by=5000)) +
	xlab("Time") +
	ylab("Measles cases")


pdf("Plots/Fig2.pdf",width=18,height=8)
plot(p)
dev.off()
