source("zcript_Fig5A.R")
source("zcript_Fig5B.R")
library(cowplot)

p1 = ggplotGrob(plotUER2(print.plot=F))
p2 = ggplotGrob(plotUSF2(print.plot=F))

cairo_pdf("Plots/Fig5.pdf",width=16,height=6)
print(plot_grid(p1,p2,align="h",nrow=1,labels=c("A","B"),
			label_size=40,label_fontfamily=GlobalFont))
dev.off()

