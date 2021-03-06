library(sf)
library(ggplot2)
library(rnaturalearth)
library(rnaturalearthdata)
library(tidyverse)
library(ggsci)

plotUK = function(print.plot = F){
	#Load Data
	world = ne_countries(country = "United Kingdom", type = "map_units", scale = "large", returnclass = "sf")
	nodes = read.table("Data/nodes_UK.txt", header = T, stringsAsFactors = F)
	edges = read.table("Data/edges_UK_Pop.txt", header = T)

	#Transform
	polygon = list(matrix(c(-6.32, 49.235,
				0.997, 50.631,
				2.445, 52.27,
				0.4457, 59.5528,
				-10.456, 59.523,
				-7.107, 55.701,
				-5.849, 55.216,
				-4.978, 54.472,
				-3.954, 54.56,
				-3.895, 54.0286,
				-5.80, 53.50,
				-6.32, 49.235),
			ncol = 2,byrow = T))
	box = st_set_crs(st_geometry(st_polygon(polygon)), 4326)
	world = st_intersection(world, box)
	world = st_as_sf(world, crs = 4326)

	links = lapply(X=1:nrow(edges),FUN = function(x){
			st_linestring(as.matrix(rbind(nodes[nodes$Id==edges$Source[x],c("Lon","Lat")],
						nodes[nodes$Id==edges$Target[x],c("Lon","Lat")])))
			})
	links = st_sfc(links)
	links = st_sf('ID' = c(1:nrow(edges)), 'geometry' = links, crs = 4326)

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
		coord_sf(expand = F, label_axes = "----", datum = NA) 

	if(print.plot){
		pdf("Plots/Fig3B.pdf",width=15,height=7.5)
		plot(p)
		dev.off()
	}

	return(p)
}
