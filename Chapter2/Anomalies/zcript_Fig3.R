source("zcript_Fig3A.R")
source("zcript_Fig3B.R")
source("zcript_Fig3C.R")
source("zcript_Fig3D.R")
library(cowplot)
source("../../theme.R")

p1 = ggplotGrob(plotBR(print.plot=F))
p2 = ggplotGrob(plotUK(print.plot=F))
p3 = ggplotGrob(plotES(print.plot=F))
p4 = ggplotGrob(plotAIR(print.plot=F))

pdf("Plots/Fig3.pdf",width=16,height=14)
top_row = plot_grid(p1, p2, p3, ncol = 3, labels = c("Bus, Brazil", "Bus, Great Britain", "Bus, Spain"), 
			label_size = 30, label_fontfamily = GlobalFont, label_x = c(0.15,-0.15,0.15))
print(plot_grid(top_row, p4, nrow = 2,labels = c("","Worldwide air transportation network"), label_x = c(0,0.05),
			rel_heights = c(0.6,1), label_size = 30, label_fontfamily = GlobalFont))
dev.off()

