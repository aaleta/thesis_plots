library(ggnetwork)
library(network)
library(sna)
library(ggsci)
library(ggplot2)

net = read.table("Data/ledge_map.txt",header=T)

p = ggplot(net, aes(x = x, y = y, xend = xend, yend = yend)) +
		geom_edges(aes(linetype = type), color = "grey50",
			arrow = arrow(length = unit(4, "pt"), type = "closed"),
			curvature=0.2,
			data = function(x) {x[x$type=="b",]}) +
		geom_edges(aes(linetype = type), color = "grey50",
			arrow = arrow(length = unit(4, "pt"), type = "closed"),
			data = function(x) {x[x$type=="a",]}) +
		scale_color_jama() +
		geom_nodes(aes(color = factor(color), size = 1)) +
		geom_nodetext(aes(label = "L"),
				size = 3,
				data = function(x) { x[ x$color == "3", ]}) +
		theme_blank() +
		theme(legend.position="none",
		plot.margin=grid::unit(c(0,-2,0,-2), "cm"))


cairo_pdf("Plots/Fig2.pdf",width=20,height=4)
print(p)
dev.off()
