library(ggplot2)
library(ggthemes)
library(ggsci)
library(cowplot)
source("../../theme.R")

plot_histogram_validity = function(data,colors,labels,title){

	  p = ggplot(data, aes(x, y=y, fill=as.factor(x))) +
			theme_thesis() +
			geom_bar(stat="identity",alpha=1,color="black",size=1.5) +
			scale_fill_manual(values=colors) +
			ggtitle(title) +
			theme(legend.position = "none",
			  plot.margin=unit(c(10,10,10,10),"mm"),
			  axis.title.x=element_blank()
			) +
			ylab("Fraction") +
			coord_cartesian(clip = 'off') +
			scale_x_continuous(breaks=data$x,labels=labels) +
			scale_y_continuous(expand=c(0,0),limits=c(0,1))

  return(p)
}

load("Data/gof_stats_all_2011_2012.RData")

colors = c("#DF8F44","#00A1D5","#374E55","#B24745","#79AF97")

df1 = data.frame(x=c(0,1),y=c(sum(data$exp_valid_full)/nrow(data),sum(!data$exp_valid_full)/nrow(data)),color=c("0","1"))
df2 = data.frame(x=c(0,1),y=c(sum(data$pl_valid_full)/nrow(data),sum(!data$pl_valid_full)/nrow(data)),color=c("0","1"))
df3 = data.frame(x=c(0,1),y=c(sum(data$homo_valid_full)/nrow(data),sum(!data$homo_valid_full)/nrow(data)),color=c("0","1"))
df4 = data.frame(x=c(0,1),y=c(sum(data$pln_valid_full)/nrow(data),sum(!data$pln_valid_full)/nrow(data)),color=c("0","1"))

p1 = plot_histogram_validity(df1,colors=list("0"=colors[1],"1"=colors[3]),labels=c("VALID","NOT VALID"),title="EXP with CNST BACK")
p2 = plot_histogram_validity(df2,colors=list("0"=colors[4],"1"=colors[3]),labels=c("VALID","NOT VALID"),title="PL with CNST BACK")
p3 = plot_histogram_validity(df3,colors=list("0"=colors[2],"1"=colors[3]),labels=c("VALID","NOT VALID"),title="HOMOGENEOUS")
p4 = plot_histogram_validity(df4,colors=list("0"=colors[5],"1"=colors[3]),labels=c("VALID","NOT VALID"),title="PL without BACK")

pdf(paste0("Plots/Fig5.pdf"),width=16,height=10)
plot_grid(p1,p2,p3,p4,labels=c('A','B','C','D'),label_size=40,ncol=2)
dev.off()

