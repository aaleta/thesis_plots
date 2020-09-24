source("zcript_Fig3A.R")
source("zcript_Fig3B.R")
source("zcript_Fig3C1.R")
source("zcript_Fig3C2.R")
library(cowplot)

pA = ggplotGrob(plotA(F))
pB = ggplotGrob(plotB(F))
pC1 = ggplotGrob(plotC1(F))
pC2 = ggplotGrob(plotC2(F))

cairo_pdf("Plots/Fig3.pdf",width=20,height=10)
print(plot_grid(plot_grid(pA,plot_grid(pC1,pC2,align="h",nrow=1,rel_widths=c(1,1.3)),nrow=2,labels=c("A","C"),label_size=40,label_fontfamily=GlobalFont),
		pB, align = "h", nrow = 1, rel_widths = c(3,2), labels = c("","B"),label_size=40,label_fontfamily=GlobalFont))
dev.off()

