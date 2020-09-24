library(ggplot2)
library(scales)
library(ggsci)
library(ggrepel)
library(stringr)
source("../../theme.R")


data = read.table("Data/k_distrib.txt",header=T)

h = hist(log10(data$x[data$y=="h"]),breaks=log10(seq(0.5,6.5,by=1)))
h = data.frame(x = 10^(h$mids), counts = h$counts, type = "h"); h$x[1] = 1

w = hist(log10(data$x[data$y=="w"]), breaks = c(seq(0,2.6,by=.2),2.8,2.9,2.95,3.0,3.1))
w = data.frame(x = 10^(w$mids), counts = w$counts, type = "w")

s = hist(log10(data$x[data$y=="s"]), breaks = 20)
s = data.frame(x = 10^(s$mids), counts = s$counts, type = "s")

data = rbind(h,w,s)

p = ggplot(data, aes(x = x, y = counts/sum(counts), color = type, fill = type)) +
	geom_line(size = 3) +
	geom_area(alpha = 0.5, show.legend = F) +
	theme_thesis() +
	scale_color_manual(name = "", values = c("h" = "#45C289", "w" = "#CF4A00", "s" = "#CFA700"),
					label = c("h" = "Household", "s" = "School", "w" = "Workplace")) +
	scale_fill_manual(name = "", values = c("h" = "#45C289", "w" = "#CF4A00", "s" = "#CFA700"),
					label = c("h" = "Household", "s" = "School", "w" = "Workplace")) +
	theme(legend.position = c(0.7,0.8),
		legend.direction = "vertical",
		legend.key.width = unit(3,"cm"),
		legend.key.height = unit(1,"cm")) +
	scale_x_log10(expand = c(0,0), limits = c(1,2000), breaks = 10^c(0:3),labels = trans_format("log10", math_format(10^.x))) +
	scale_y_continuous(expand = c(0,0), limits = c(0,0.2), breaks = seq(0,0.2,by=0.05)) +
	xlab("k") +
	ylab("p(k)") +
	annotation_logticks(sides = "b") 

pdf("Plots/Fig0B.pdf", width = 10, height = 6)
plot(p)
dev.off()


