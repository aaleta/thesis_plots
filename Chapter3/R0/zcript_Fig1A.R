library(ggplot2)
library(ggthemes)
library(gridExtra)
library(grid)
library(ggsci)
source("../../theme.R")

figRt = function(df, df_mean, ylab, title, ylim, titleSize = 1.2)
{
	p = ggplot() +
		theme_thesis() +
		scale_fill_gradientn(colors = c("#ffffcb","#fecf69","#fd6533","#c00225","#850025")) +
		geom_bin2d(data = df,aes(x = t, y = y, fill = log(..density..)), binwidth = c(1,0.02)) +
		geom_line(data = df_mean, aes(x = t, y = y, color = type, linetype = type), size = 3, alpha = 1.0) +
		scale_color_manual(name = "", values = c("DDH" = "#1d3949", "Homo" = "#6699ff")) +
		xlab("Time") +
		ylab(ylab) +
		ggtitle(title) +
		theme(legend.position = "none",
			panel.background = element_rect(fill = "#ffffcb"),
			plot.background = element_rect(colour = NA),
			panel.border = element_rect(colour = "black", fill = NA, size = 2),
			axis.line = element_line(colour = NA),
			plot.margin = unit(x = c(0.75,0.75,0.75,0.75), units = "cm"),
			plot.title = element_text(face = "bold",size = rel(titleSize), hjust = 0.5)
			) +
		scale_x_continuous(expand=c(0,0),limits=c(-40,40)) +
		scale_y_continuous(expand=c(0,0),limits=ylim)

	return(p)
}

figRt_all = function(print.plot = F)
{
	df = read.table("Data/Rt_DDH.txt", header = T)
	df_mean = read.table("Data/Rt_mean_DDH.txt", header = T)
	df_mean$type = "DDH"

	a = read.table("Data/Rt_mean_homogeneous.txt", header = T)
	df_mean = rbind(df_mean,cbind(a,type = "Homo"))

	p1 = figRt(df = data.frame(t = df$t, y = df$tot, id = df$id),
			df_mean = data.frame(t = df_mean$t, y = df_mean$tot, type = df_mean$type),
			ylab = expression(bold(R(t))), title = "Reproduction number", ylim = c(0,3), titleSize = 1.8)

	p2 = figRt(df = data.frame(t = df$t, y = df$h, id = df$id),
			df_mean = data.frame(t = df_mean$t[df_mean$type=="DDH"], y = df_mean$h[df_mean$type=="DDH"], type = "DDH"),
			ylab = expression(paste(bold(R[H]),bold((t)))), title = "Household", ylim = c(0,1.5))

	p3 = figRt(df = data.frame(t = df$t, y = df$s, id = df$id),
			df_mean = data.frame(t = df_mean$t[df_mean$type=="DDH"], y = df_mean$s[df_mean$type=="DDH"], type = "DDH"),
			ylab = expression(paste(bold(R[S]),bold((t)))), title = "School", ylim = c(0,1.5))

	p4 = figRt(df = data.frame(t = df$t, y = df$w, id = df$id),
			df_mean = data.frame(t = df_mean$t[df_mean$type=="DDH"], y = df_mean$w[df_mean$type=="DDH"], type = "DDH"),
			ylab = expression(paste(bold(R[W]),bold((t)))), title = "Workplace", ylim = c(0,1.5))

	p5 = figRt(df = data.frame(t = df$t, y = df$r, id = df$id),
			df_mean = data.frame(t = df_mean$t[df_mean$type=="DDH"], y = df_mean$r[df_mean$type=="DDH"], type = "DDH"),
			ylab = expression(paste(bold(R[C]),bold((t)))), title = "Community", ylim = c(0,1.5))

	lay = rbind(c(1,1),c(2,3),c(4,5))
	p = grid.arrange(grobs = list(p1,p2,p3,p4,p5), heights = c(1.5,1,1), layout_matrix = lay)

	if(print.plot){
		name = sprintf("Plots/Fig1A.pdf")
		pdf(name,width=12,height=16,onefile=F)
		plot(p)
		dev.off()
	}

	return(p)
}

