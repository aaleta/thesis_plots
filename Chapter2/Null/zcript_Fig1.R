library(cowplot)

source("zcript_Fig1A.R")
p1 = plotN(print.plot=F)
source("zcript_Fig1B.R")
p2 = plotL(print.plot=F)

pdf("Plots/Fig1.pdf",width=18,height=8)
print(plot_grid(p1,p2,ncol=2,labels=c("A","B"),
			label_size=40,label_fontfamily=GlobalFont))
dev.off()

