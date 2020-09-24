library(ggplot2)
library(ggsci)
library(grid)
source("../../theme.R")

data = read.table("Data/data_new_users.txt",header=T)
a = read.table("Data/fit_new_users.txt",header=T)

p = ggplot() +
	theme_thesis() +
	geom_bar(data = data, aes(time, fill = "a", color = "a"), alpha = 1) +
	geom_line(data = a, aes(x = x, y = y, color = "b"), size = 2) +
	scale_color_jama() +
	scale_fill_jama() +
	theme(legend.position = "none",
		panel.border = element_rect(colour = "black", fill=NA, size=2.5),
		axis.line=element_blank()) +
	scale_x_continuous(expand=c(0,0),breaks=seq(1,nrow(data),by=2))+
	scale_y_continuous(expand=c(0,0),limits=c(0,100000)) +
	xlab("Day of the game") +
	ylab("Number of new users")

data = read.table("Data/data_users_hour.txt",header=T)

p1 = ggplot(data, aes(x = x, y = Count, color = "a")) +
	theme_thesis() +
	geom_line(size = 0.8) +
	scale_color_jama() +
	theme(legend.position="none",
		text=element_text(size=22,family=GlobalFont),
		panel.border = element_rect(colour = "black", fill=NA, size=2),
		plot.margin=grid::unit(c(0,0,0,0), "mm"),
		plot.background = element_blank(),
		axis.line=element_blank()
		) +
	scale_x_continuous(expand=c(0,0),breaks=seq(1,nrow(data),by=48),labels=seq(1,17,by=2))+	
	scale_y_continuous(expand=c(0,0),breaks=seq(0,20000,by=5000),limits=c(0,20000))+
	xlab("Day of the game") +
	ylab("Users playing")

vp <- viewport(width = 0.4, height = 0.3, x = 0.73, y = 0.78)

cairo_pdf("Plots/Fig0.pdf",width=14,height=8)
print(p)
print(p1, vp=vp)
dev.off()
