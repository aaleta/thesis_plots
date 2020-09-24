source("zcript_Fig6A.R")
source("zcript_Fig6B.R")
library(cowplot)

p1 = plotA()
p2 = plotB()

prow = plot_grid(p1 + theme(legend.position="none"),p2 + theme(legend.position="none"),labels=c('A','B'),label_size=40)
legend = get_legend(p1 + theme(legend.direction = "horizontal",legend.justification="center" ,legend.box.just = "bottom"))

cairo_pdf("Plots/Fig6.pdf",width=16,height=8)
plot_grid(legend,prow,ncol=1,rel_heights=c(.2,1))
dev.off()
