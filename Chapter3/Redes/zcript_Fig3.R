source("zcript_Fig3A.R")
source("zcript_Fig3B.R")
source("zcript_Fig3C.R")
source("zcript_Fig3D.R")
library(cowplot)

p1 = ggplotGrob(plotUER(print.plot=F))
p2 = ggplotGrob(plotUSF(print.plot=F))
p3 = ggplotGrob(plotDER(print.plot=F))
p4 = ggplotGrob(plotDSF(print.plot=F))

cairo_pdf("Plots/Fig3.pdf",width=16,height=12)
print(plot_grid(p1,p2,p3,p4,align="h",nrow=2,labels=c("A","B","C","D"),
			label_size=40,label_fontfamily=GlobalFont))
dev.off()

