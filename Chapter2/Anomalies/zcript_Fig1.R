source("zcript_Fig1A.R")
source("zcript_Fig1B.R")
library(cowplot)

p1 = ggplotGrob(plotMap(print.plot=F))
p2 = ggplotGrob(plotBW(print.plot=F))

pdf("Plots/Fig1.pdf",width=18,height=8)
print(plot_grid(p2,p1,align="hv",ncol=2,labels=c("A","B"),rel_widths=c(1,1.1),label_x=c(0,0),
			label_size=40,label_fontfamily=GlobalFont))
dev.off()

