source("zcript_Fig2A.R")
source("zcript_Fig2B.R")
library(cowplot)

p1 = ggplotGrob(plotBW(print.plot=F))
p2 = ggplotGrob(plotHist(print.plot=F))

pdf("Plots/Fig2.pdf",width=18,height=8)
print(plot_grid(p1,p2,align="h",nrow=1,labels=c("A","B"),rel_widths=c(1,1),
			label_size=40,label_fontfamily=GlobalFont))
dev.off()

