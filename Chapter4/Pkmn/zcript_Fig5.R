source("zcript_Fig5A.R")
source("zcript_Fig5B.R")
library(cowplot)

p1 = ggplotGrob(plotA(F))
p2 = ggplotGrob(plotB(F))

cairo_pdf("Plots/Fig5.pdf",width=24,height=6)
print(plot_grid(p1,p2, align = "h", nrow = 1, rel_widths = c(2.5,1), 
		labels = c("A","B"),label_size=40,label_fontfamily=GlobalFont))
dev.off()





