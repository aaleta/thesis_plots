library(ggplot2)
library(ggsci)
library(stringr)
source("../../theme.R")

homo = read.table("Data/threshold_homo.txt",header=T)
ER = read.table("Data/results_ER.txt",header=T); 
SF = read.table("Data/results_SF.txt",header=T); 

p = ggplot() +
	theme_thesis() +
	geom_line(data = homo, aes(x = beta, y = r, color = "homo"), size = 3) +
	geom_line(data = ER, aes(x = beta, y = r, color = "er"), size = 3) +
	geom_line(data = SF, aes(x = beta, y = r, color = "sf"), size = 3) +
	scale_color_jama(name="",labels=c("homo"="Homogeneous","er"="Random graph","sf"="Scale free graph"),
					breaks = c("er","sf","homo")) +
	theme(legend.position = c(0.25,0.8),
		legend.direction = "vertical",
		legend.key.height = unit(1,"cm"),
		legend.key.width = unit(2,"cm"),
		legend.text = element_text(family=GlobalFont,size=24)) +
	scale_x_continuous(expand = c(0,0), limits = c(0,2.05)) +
	scale_y_continuous(expand = c(0,0), limits = c(0,1.05)) +
	xlab(expression(bold("\u03b2"/"\u03bc"))) +
	ylab(expression(bold(r(infinity))))

cairo_pdf("Plots/Fig1.pdf",width=10)
plot(p)
dev.off()

