source("zcript_Fig4A.R")
source("zcript_Fig4B.R")
source("zcript_Fig4C.R")
source("zcript_Fig4D.R")
library(cowplot)

pB = ggplotGrob(plotB(F))
pD = ggplotGrob(plotD(F))

gtA = ggplot_gtable(ggplot_build(plotA(F)))
gtA$layout$clip[gtA$layout$name == "panel"] <- "off"
gtC = ggplot_gtable(ggplot_build(plotC(F)))
gtC$layout$clip[gtC$layout$name == "panel"] <- "off"

cairo_pdf("Plots/Fig4.pdf",width=24,height=16)
print(plot_grid(gtA,pB,gtC,pD, align = "h", nrow = 2, rel_widths = c(1,2), 
		labels = c("A","B","C","D"),label_size=40,label_fontfamily=GlobalFont))
dev.off()

