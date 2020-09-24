source("zcript_Fig2A.R")
source("zcript_Fig2B.R")
library(cowplot)

p1 = plotAttack(print.plot=F)
p2 = grid.arrange(grobs = list(textGrob(""),plotSizeNew(print.plot=F), textGrob("")), ncol = 1, heights = c(1,5,1))

pdf("Plots/Fig2.pdf",width=16,height=12)
print(plot_grid(p1,p2,align="v",nrow=1,labels=c("A","B"),rel_widths=c(1,1.2),
			label_size=40,label_fontfamily=GlobalFont))
dev.off()

