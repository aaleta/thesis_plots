source("zcript_Fig3A.R")
source("zcript_Fig3B.R")
library(cowplot)

p1 = ggplotGrob(plotMatrix("Belgium","BE","#DF8F44",F))
p2 = ggplotGrob(plotMatrix("Finland","FI","#DF8F44",F))
p3 = ggplotGrob(plotMatrix("Germany","DE","#DF8F44",F))
p4 = ggplotGrob(plotMatrix("Great Britain","GB","#DF8F44",F))
p5 = ggplotGrob(plotMatrix("Italy","IT","#DF8F44",F))
p6 = ggplotGrob(plotMatrix("Luxembourg","LU","#DF8F44",F))
p7 = ggplotGrob(plotMatrix("Netherlands","NL","#DF8F44",F))
p8 = ggplotGrob(plotMatrix("Poland","PL","#DF8F44",F))
p9 = ggplotGrob(plotMatrix("France","FR","#00A1D5",F))
p10 = ggplotGrob(plotMatrix("China","CH","#374E55",F))
p11 = ggplotGrob(plotMatrix("Japan","JP","#374E55",F))
p12 = ggplotGrob(plotMatrix("Hong Kong","HK","#374E55",F))
p13 = ggplotGrob(plotMatrix("Russia","RU","#00A1D5",F))
p14 = ggplotGrob(plotMatrix("Kenya","KE","#B24745",F))
p15 = ggplotGrob(plotMatrix("Uganda","UG","#B24745",F))
p16 = ggplotGrob(plotMatrix("Zimbabwe","ZW","#B24745",F))

pb = ggplotGrob(plotr(F))

pdf("Plots/Fig3.pdf",width=40,height=16)
print(plot_grid(plot_grid(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,
			align="h",nrow=4),
		pb, align = "h", nrow = 1, rel_widths = c(3,2), labels = c("A","B"),label_size=70,label_fontfamily=GlobalFont))
dev.off()

