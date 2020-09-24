source("zcript_Fig1A.R")
source("zcript_Fig1B.R")
library(cowplot)

p1 = figRt_all(print.plot=F)
p2 = figTg_all(print.plot=F)

pdf("Plots/Fig1.pdf",width=24,height=16)
print(plot_grid(p1,p2,align="h",nrow=1,labels=c("A","B"),rel_widths=c(1,1),
			label_size=60,label_fontfamily=GlobalFont))
dev.off()

