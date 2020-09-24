library(ggplot2)
library(ggsci)
library(stringr)
source("../../theme.R")

homo = read.table("Data/diagram_homo.txt",header=T)
age = read.table("Data/diagram_age.txt",header=T)
all = read.table("Data/diagram_Belgium_all.txt",header=T); 
degree = read.table("Data/diagram_Belgium_degree.txt",header=T); 

p = ggplot() +
	theme_thesis() +
	geom_line(data = homo, aes(x = beta, y = r, color = "homo"), size = 3) +
	geom_line(data = all, aes(x = beta, y = r, color = "all"), size = 3) +
	geom_line(data = degree, aes(x = beta, y = r, color = "degree"), size = 3) +
	geom_line(data = age, aes(x = beta, y = r, color = "age"), size = 3) +
	scale_color_jama(name="",labels=c("homo"="Homogeneous","all"="Network+Age","degree"="Network","age"="Age"),
					breaks = c("age","homo","degree","all")) +
	theme(legend.position = c(0.75,0.25),
		legend.direction = "vertical",
		legend.key.height = unit(1,"cm"),
		legend.key.width = unit(2,"cm"),
		legend.text = element_text(family=GlobalFont,size=24)) +
	scale_x_continuous(expand = c(0,0), limits = c(0,1.0),breaks=seq(0,1,by=0.1)) +
	scale_y_continuous(expand = c(0,0), limits = c(0,1.05)) +
	xlab(expression(bold("\u03b2"/"\u03bc"))) +
	ylab(expression(bold(r(infinity))))

cairo_pdf("Plots/Fig1.pdf",width=10)
plot(p)
dev.off()

