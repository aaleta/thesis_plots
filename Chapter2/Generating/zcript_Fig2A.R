library(ggplot2)
library(cowplot)
library(fitdistrplus)
library(data.table)
source("../../theme.R")

buildFitDF = function(data)
{
	df = data.frame(left=c(seq(1,41,by=4),45),right=c(seq(4,44,by=4),NA))
	df = df[rep(row.names(df),c(data$Count[data$Contacts=="1 - 4"],
					data$Count[data$Contacts=="5 - 8"],
					data$Count[data$Contacts=="9 - 12"],
					data$Count[data$Contacts=="13 - 16"],
					data$Count[data$Contacts=="17 - 20"],
					data$Count[data$Contacts=="21 - 24"],
					data$Count[data$Contacts=="25 - 28"],
					data$Count[data$Contacts=="29 - 32"],
					data$Count[data$Contacts=="33 - 36"],
					data$Count[data$Contacts=="37 - 40"],
					data$Count[data$Contacts=="41 - 44"],
					data$Count[data$Contacts=="45 +"])),]
	return(df)
}

countBracket = function(data)
{
	data = hist(data, breaks = seq(1,49,by=4), plot = F, right = F)$counts
	data = data.frame(Contacts = c(paste(seq(1,41,by=4),seq(4,44,by=4),sep=" - "),"45 +"),
				Count = data)
	return(data)
}

singlePlot = function(data,color,title,fit)
{
	a = data.frame(x=c(0:46))
	a$y = dnbinom(a$x,mu=fit$mu,size=fit$size)
	
	a$y = a$y*max(data$y)/max(a$y)

	p = ggplot(data,aes(x=x,y=y,fill=color)) +
		theme_thesis() +
		geom_bar(stat="identity",color="black",fill=color)+
		geom_line(data=a,aes(x=x,y=y),color="orange",size=2) +
		xlab("Number of contacts") +
		ylab("Frequency") +
		theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 20)) +
		ggtitle(title)+
		scale_y_continuous(expand=c(0,0),limits=c(0,.8),breaks=seq(0,.8,by=.2))  +
		scale_x_continuous(expand=c(0,0),breaks=seq(2.5,48.5,by=4),labels=c(paste(seq(1,41,by=4),seq(4,44,by=4),sep="-"),"45+"),limits=c(0,50))+
		annotate("text",x=26,y=0.52,label=paste0("mu==","'",sprintf("%.2f",round(fit$mu,2)),"'","~~theta==","'",sprintf("%.2f",round(fit$size,2)),"'"),parse=T,size=12)
}

fitDF = function(data)
{
	fit = fitdistcens(data,"nbinom")
	fit = data.frame(mu=fit$estimate[2],mu_se=fit$sd[2],
					size=fit$estimate[1],size_se=fit$sd[1])
	return(fit)
}

reshapeDF = function(data)
{
	data = data.table(interval=paste(data$left,data$right,sep=" - "))
	data = data[,list(y=.N),by=interval]
	data$y = data$y/sum(data$y)

	reference = data.frame(interval = c(paste(seq(1,41,by=4),seq(4,44,by=4),sep=" - "),"45 - NA"), x = seq(2.5,48.5,by=4))
	data$x = reference$x[match(data$interval,reference$interval)]

	return(data)
}

allPlots = function(print.plot=T)
{
	data = buildFitDF(countBracket(read.table("Data/YY.txt")[,1]))
	fit = fitDF(data)
	data = reshapeDF(data)
	p1 = singlePlot(data,"#8AB943","Child-Child",fit)

	data = buildFitDF(countBracket(read.table("Data/YA.txt")[,1]))
	fit = fitDF(data)
	data = reshapeDF(data)
	p2 = singlePlot(data,"#8AB943","Child-Adult",fit)

	data = buildFitDF(countBracket(read.table("Data/AY.txt")[,1]))
	fit = fitDF(data)
	data = reshapeDF(data)
	p3 = singlePlot(data,"#8AB943","Adult-Child",fit)

	data = buildFitDF(countBracket(read.table("Data/AA.txt")[,1]))
	fit = fitDF(data)
	data = reshapeDF(data)
	p4 = singlePlot(data,"#8AB943","Adult-Adult",fit)

	if(print.plot){
		pdf("Plots/Fig2A.pdf",width=18,height=12)
		print(plot_grid(p1,p2,p3,p4,ncol=2))
		dev.off()
	}
	left_plot = plot_grid(p1,p2,p3,p4,ncol=2)
	return(left_plot)
}
