source("zcript_Fig3A.R")
source("zcript_Fig3B.R")
library(cowplot)

p1 = ggplotGrob(plotA(F))
p1$layout$clip = "off"
p2 = ggplotGrob(plotB(F))
p2$layout$clip = "off"

cairo_pdf("Plots/Fig3.pdf",width=16,height=11)
print(plot_grid(p1,p2, align = "h", nrow = 2,
		labels = c("A","B"),label_size=40,label_fontfamily=GlobalFont))
dev.off()





