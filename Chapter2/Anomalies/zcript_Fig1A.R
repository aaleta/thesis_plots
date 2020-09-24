library(sf)
library(ggplot2)
library(rnaturalearth)
library(rnaturalearthdata)
library(tidyverse)
library(ggsci)

plotMap = function(print.plot = F){
	#Load Data
	world = ne_countries(scale = "medium", returnclass = "sf")
	nodes = read.table("Data/nodes_AIR_agg_fixed.txt", header = T, stringsAsFactors = F)
	edges = read.table("Data/edges_AIR_agg.txt", header = T)
	labels = read.table("Data/AIR_agg_bw_vs_k_label.txt", header = T, stringsAsFactors = F)

	#Transform
	links = lapply(X=1:nrow(edges),FUN = function(x){
			st_linestring(as.matrix(rbind(nodes[nodes$ID==edges$Source[x],c("Lon","Lat")],
						nodes[nodes$ID==edges$Target[x],c("Lon","Lat")])))
			})
	links = st_sfc(links)
	links = st_sf('ID' = c(1:nrow(edges)), 'geometry' = links, crs = 4326)
	links = links %>%
			st_segmentize(units::set_units(20, km))

	nodes = nodes %>%
			st_as_sf(coords = c("Lon","Lat"), crs = 4326) 

	nodes$color = labels$type[match(nodes$Country,labels$Country)]
	nodes$color[is.na(nodes$color)] = "inside"

	#Plot
	p = ggplot() +
		theme_bw() +
		theme(panel.border = element_rect(colour = NA),
			legend.position = "none",
			panel.background = element_rect(colour = NA),
			plot.margin = unit(c(0,0,0,0),"mm")) +
		geom_sf(data = world, fill= "gray", alpha=0.7, expand=F) +
		geom_sf(data = links, color = alpha("#a6761d",0.2)) +
		geom_sf(data = nodes, aes(color = color)) +
		scale_color_manual(values = pal_jama("default")(7)[c(2,4,6)]) +
		coord_sf(crs = "+init=epsg:3035", expand=F) 

	if(print.plot){
		pdf("Plots/Fig1A.pdf")
		plot(p)
		dev.off()
	}

	return(p)
}
