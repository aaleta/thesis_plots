source("zcript_Fig6A.R")
source("zcript_Fig6B.R")
source("zcript_Fig6C.R")
library(cowplot)

p1 = ggplotGrob(plotA(F))
p2 = ggplotGrob(plotB(F))
p3 = ggplotGrob(plotC(F))

cairo_pdf("Plots/Fig6.pdf",width=30,height=7)
print(plot_grid(p1,p2,p3, align = "h", nrow = 1,
		labels = c("A","B","C"),label_size=40,label_fontfamily=GlobalFont))
dev.off()





