source("zcript_Fig1A.R")
source("zcript_Fig1B.R")
library(cowplot)

p1 = ggplotGrob(plotSIR(print.plot=F))
p2 = ggplotGrob(plotTH(print.plot=F))

cairo_pdf("Plots/Fig1.pdf",width=18,height=8)
print(plot_grid(p1,p2,align="h",nrow=1,labels=c("A","B"),rel_widths=c(1,1),
			label_size=40,label_fontfamily=GlobalFont))
dev.off()

