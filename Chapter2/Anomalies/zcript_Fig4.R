source("zcript_Fig4A.R")
library(cowplot)

p1 = ggplotGrob(plotHist("ES","ES_weight","Bus, Spain",print.plot=F))
p2 = ggplotGrob(plotHist("UK","UK_weight","Bus, Great Britain",print.plot=F))
p3 = ggplotGrob(plotHist("BR","BR_weight","Bus, Brazil",print.plot=F))
p4 = ggplotGrob(plotHist("AIR","AIR_weight_weight","Air, cities",print.plot=F))

pdf("Plots/Fig4.pdf",width=16,height=14)
print(plot_grid(p1, p2, p3, p4, ncol = 2, labels = c("A","B","C","D"), 
			label_size = 40, label_fontfamily = GlobalFont))
dev.off()

