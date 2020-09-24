source("zcript_Fig4Pyramid.R")
source("zcript_Fig4Diff.R")
library(cowplot)

p1 = ggplotGrob(plotPyramid("Poland",1950,2005,"purple",1,F))
p2 = ggplotGrob(plotPyramid("Poland",2005,2050,"purple",2,F))
p3 = ggplotGrob(plotDiff("Poland","purple",F))

pA = plot_grid(NULL,plot_grid(p1,p2,ncol=2),p3,nrow=4,labels=c("Poland","",""),label_x=0.32,
		rel_heights=c(1,6,6),label_size=40,label_fontfamily=GlobalFont)


p1 = ggplotGrob(plotPyramid("Zimbabwe",1950,2013,"lime",1,F))
p2 = ggplotGrob(plotPyramid("Zimbabwe",2013,2050,"lime",1,F))
p3 = ggplotGrob(plotDiff("Zimbabwe","lime",F))

pB = plot_grid(NULL,plot_grid(p1,p2,ncol=2),p3,nrow=4,labels=c("Zimbabwe","",""),label_x=0.25,
		rel_heights=c(1,6,6),label_size=40,label_fontfamily=GlobalFont)


pdf("Plots/Fig4.pdf",width=20,height=10)
print(plot_grid(pA,pB,ncol=2,labels = c("A","B"),label_size=40,label_fontfamily=GlobalFont))
dev.off()

