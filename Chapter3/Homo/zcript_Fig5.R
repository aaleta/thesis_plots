source("zcript_Fig5A.R")
library(cowplot)

p1 = ggplotGrob(plotCountry(0,"Original",F))
p2 = ggplotGrob(plotCountry(2,"Corrected",F))

pdf("Plots/Fig5.pdf",width=24,height=10)
print(plot_grid(p1,p2, align = "h", nrow = 1, labels = c("A","B"),label_size=50,label_fontfamily=GlobalFont))
dev.off()

