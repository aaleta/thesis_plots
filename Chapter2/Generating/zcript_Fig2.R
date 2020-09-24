library(cowplot)

source("zcript_Fig2A.R")
p1 = allPlots(print.plot=F)
source("zcript_Fig2B.R")
p2 = bothPlots(print.plot=F)

pdf("Plots/Fig2.pdf",width=28,height=12)
print(plot_grid(p1,plot_grid(NULL,p2,NULL,nrow=3,rel_heights=c(1,3,1)),nrow=1,labels=c("A","B"),rel_widths=c(1.3,1),
			label_size=50,label_fontfamily=GlobalFont))
dev.off()

