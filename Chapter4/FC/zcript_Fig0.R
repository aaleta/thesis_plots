source("zcript_Fig0A.R")
source("zcript_Fig0B.R")
library(cowplot)

p1 = ggplotGrob(plotA(F))
p2 = ggplotGrob(plotB(F))

cairo_pdf("Plots/Fig0.pdf",width=18,height=8)
print(plot_grid(p1,p2, align = "h", nrow = 1,
		labels = c("A","B"),label_size=40,label_fontfamily=GlobalFont))
dev.off()





