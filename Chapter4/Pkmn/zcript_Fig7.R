source("zcript_Fig7A.R")
source("zcript_Fig7B.R")
library(cowplot)

p1 = ggplotGrob(plotA(F))
p2 = ggplotGrob(plotB(F))

cairo_pdf("Plots/Fig7.pdf",width=14,height=12)
print(plot_grid(p1,p2, align = "h", nrow = 2,
		labels = c("A","B"),label_size=40,label_fontfamily=GlobalFont))
dev.off()





