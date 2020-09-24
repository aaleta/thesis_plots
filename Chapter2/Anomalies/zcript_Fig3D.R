library(sf)
library(ggplot2)
library(rnaturalearth)
library(rnaturalearthdata)
library(tidyverse)
library(ggsci)

plotAIR = function(print.plot = F){
	#Load Data
	world = ne_countries(scale = "medium", returnclass = "sf")
	nodes = read.table("Data/nodes_AIR.txt", header = T, stringsAsFactors = F)
	edges = read.table("Data/edges_AIR.txt", header = T)

	#Transform
	links = lapply(X=1:nrow(edges),FUN = function(x){
			st_linestring(as.matrix(rbind(nodes[nodes$id==edges$Source[x],c("Lon","Lat")],
						nodes[nodes$id==edges$Target[x],c("Lon","Lat")])))
			})
	links = st_sfc(links)
	links = st_sf('ID' = c(1:nrow(edges)), 'geometry' = links, crs = 4326)
	links = links %>%
			st_segmentize(units::set_units(100, km))

	nodes = nodes %>%
			st_as_sf(coords = c("Lon","Lat"), crs = 4326) 

	#Plot
	p = ggplot() +
		theme_bw() +
		theme(panel.border = element_rect(colour = NA),
			legend.position = "none",
			panel.background = element_rect(colour = NA),
			plot.margin = unit(c(15,0,0,0),"mm")) +
		geom_sf(data = world, fill= "gray", alpha=0.7) +
		geom_sf(data = links, color = alpha("#6894a1",0.1)) +
		geom_sf(data = nodes, aes(size = k), color = "#374E55") +
		scale_size_continuous(range = c(0.05,5)) +
		coord_sf(expand = F, label_axes = "----") 

	if(print.plot){
		pdf("Plots/Fig3D.pdf",width=15,height=7.5)
		plot(p)
		dev.off()
	}

	return(p)
}
