chapter2 = F
chapter3 = T
chapter4 = F
if(chapter2){
	#Chapter2: Null
	setwd("~/Dropbox/Tesis/Figures/Chapter2/Null/")
	source("zcript_Fig1.R")

	setwd("~/Dropbox/Tesis/")
	system("cp Figures/Chapter2/Null/Plots/Fig1.pdf Tesis/img/Fig_chap2_null_networks.pdf")

	#Chapter2: Graphs
	setwd("~/Dropbox/Tesis/")
	system("cp Figures/Chapter2/Graphs/graphs.pdf Tesis/img/Fig_chap2_graphs.pdf")
	system("cp Figures/Chapter2/Graphs/Fig1.pdf Tesis/img/Fig_chap2_graphs_scheme.pdf")

	#Chapter2: Anomalies
	setwd("~/Dropbox/Tesis/Figures/Chapter2/Anomalies")
	source("zcript_Fig1.R")
	source("zcript_Fig2.R")
	source("zcript_Fig3.R")
	source("zcript_Fig4.R")

	setwd("~/Dropbox/Tesis/")
	system("cp Figures/Chapter2/Anomalies/Plots/Fig1.pdf Tesis/img/Fig_chap2_anomalies_AIR.pdf")
	system("cp Figures/Chapter2/Anomalies/Plots/Fig2.pdf Tesis/img/Fig_chap2_anomalies_AIR_weight.pdf")
	system("cp Figures/Chapter2/Anomalies/Plots/Fig3.pdf Tesis/img/Fig_chap2_anomalies_networks.pdf")
	system("cp Figures/Chapter2/Anomalies/Plots/Fig4.pdf Tesis/img/Fig_chap2_anomalies_all.pdf")

	#Chapter2: Generating
	setwd("~/Dropbox/Tesis/Figures/Chapter2/Generating")
	source("zcript_Fig2.R")

	setwd("~/Dropbox/Tesis/")
	system("cp Figures/Chapter2/Generating/Plots/scheme.pdf Tesis/img/Fig_chap2_generating_scheme.pdf")
	system("cp Figures/Chapter2/Generating/Plots/Fig2.pdf Tesis/img/Fig_chap2_generating_data.pdf")
	system("cp Figures/Chapter2/Generating/Plots/Fig3.pdf Tesis/img/Fig_chap2_generating_network.pdf")
}

if(chapter3){
	#Chapter3: Homo
	setwd("~/Dropbox/Tesis/Figures/Chapter3/Homo")
	source("zcript_Fig1.R")
	source("zcript_Fig2.R")
	source("zcript_Fig3.R")
	source("zcript_Fig4.R")
	source("zcript_Fig5.R")

	setwd("~/Dropbox/Tesis/")
	system("cp Figures/Chapter3/Homo/Plots/Fig1.pdf Tesis/img/Fig_chap3_homo_homo.pdf")
	system("cp Figures/Chapter3/Homo/Plots/Fig2.pdf Tesis/img/Fig_chap3_homo_measles.pdf")
	system("cp Figures/Chapter3/Homo/Plots/Fig3.pdf Tesis/img/Fig_chap3_homo_data.pdf")
	system("cp Figures/Chapter3/Homo/Plots/Fig4.pdf Tesis/img/Fig_chap3_homo_reciprocity.pdf")
	system("cp Figures/Chapter3/Homo/Plots/Fig5.pdf Tesis/img/Fig_chap3_homo_difference.pdf")

	#Chapter3: R0
	setwd("~/Dropbox/Tesis/Figures/Chapter3/R0")
	source("zcript_Fig1.R")
	source("zcript_Fig2.R")

	setwd("~/Dropbox/Tesis/")
	system("cp Figures/Chapter3/R0/Plots/Fig0.pdf Tesis/img/Fig_chap3_r0_scheme.pdf")
	system("cp Figures/Chapter3/R0/Plots/Fig1.pdf Tesis/img/Fig_chap3_r0_r0tg.pdf")
	system("cp Figures/Chapter3/R0/Plots/Fig2.pdf Tesis/img/Fig_chap3_r0_attack.pdf")

	#Chapter3: Redes
	setwd("~/Dropbox/Tesis/Figures/Chapter3/Redes")
	source("zcript_Fig1.R")
	source("zcript_Fig3.R")
	source("zcript_Fig5.R")

	setwd("~/Dropbox/Tesis/")
	system("cp Figures/Chapter3/Redes/Plots/Fig1.pdf Tesis/img/Fig_chap3_redes_comparison.pdf")
	system("cp Figures/Chapter3/Redes/Plots/Fig2.pdf Tesis/img/Fig_chap3_redes_generating.pdf")
	system("cp Figures/Chapter3/Redes/Plots/Fig3.pdf Tesis/img/Fig_chap3_redes_simulations.pdf")
	system("cp Figures/Chapter3/Redes/Plots/Fig4.pdf Tesis/img/Fig_chap3_redes_h.pdf")
	system("cp Figures/Chapter3/Redes/Plots/Fig5.pdf Tesis/img/Fig_chap3_redes_simTeo.pdf")
	system("cp Figures/Chapter3/Redes/Plots/Fig6.pdf Tesis/img/Fig_chap3_redes_social.pdf")

	#Chapter3: Age
	setwd("~/Dropbox/Tesis/Figures/Chapter3/Age")
	source("zcript_Fig1.R")
	source("zcript_Fig2.R")

	setwd("~/Dropbox/Tesis/")
	system("cp Figures/Chapter3/Age/Plots/Fig1.pdf Tesis/img/Fig_chap3_age_comparison.pdf")
	system("cp Figures/Chapter3/Age/Plots/Fig2.pdf Tesis/img/Fig_chap3_age_diff.pdf")
}

if(chapter4)
{
	#Chapter4: FC
	setwd("~/Dropbox/Tesis/Figures/Chapter4/FC")
	source("zcript_Fig0.R")
	source("zcript_Fig2.R")
	source("zcript_Fig3.R")
	source("zcript_Fig4.R")
	source("zcript_Fig5.R")
	source("zcript_Fig6.R")

	setwd("~/Dropbox/Tesis/")
	system("cp Figures/Chapter4/FC/Plots/Fig0.pdf Tesis/img/Fig_chap4_fc_evolution.pdf")
	system("cp Figures/Chapter4/FC/Plots/Fig1.pdf Tesis/img/Fig_chap4_fc_wordcloud.pdf")
	system("cp Figures/Chapter4/FC/Plots/Fig2.pdf Tesis/img/Fig_chap4_fc_activity.pdf")
	system("cp Figures/Chapter4/FC/Plots/Fig3.pdf Tesis/img/Fig_chap4_fc_slang.pdf")
	system("cp Figures/Chapter4/FC/Plots/Fig4.pdf Tesis/img/Fig_chap4_fc_poisson.pdf")
	system("cp Figures/Chapter4/FC/Plots/Fig5.pdf Tesis/img/Fig_chap4_fc_fit.pdf")
	system("cp Figures/Chapter4/FC/Plots/Fig6.pdf Tesis/img/Fig_chap4_fc_fit_n_time.pdf")

	#Chapter4: Pkmn
	setwd("~/Dropbox/Tesis/Figures/Chapter4/Pkmn")
	source("zcript_Fig0.R")
	source("zcript_Fig1.R")
	source("zcript_Fig2.R")
	source("zcript_Fig3.R")
	source("zcript_Fig4.R")
	source("zcript_Fig5.R")
	source("zcript_Fig6.R")
	source("zcript_Fig7.R")

	setwd("~/Dropbox/Tesis/")
	system("cp Figures/Chapter4/Pkmn/Plots/Fig0.pdf Tesis/img/Fig_chap4_pkmn_activity.pdf")
	system("cp Figures/Chapter4/Pkmn/Plots/Fig1.pdf Tesis/img/Fig_chap4_pkmn_start9.pdf")
	system("cp Figures/Chapter4/Pkmn/Plots/Fig2.pdf Tesis/img/Fig_chap4_pkmn_ledgemap.pdf")
	system("cp Figures/Chapter4/Pkmn/Plots/Fig3.pdf Tesis/img/Fig_chap4_pkmn_ledge.pdf")
	system("cp Figures/Chapter4/Pkmn/Plots/Fig4.pdf Tesis/img/Fig_chap4_pkmn_politics.pdf")
	system("cp Figures/Chapter4/Pkmn/Plots/Fig5.pdf Tesis/img/Fig_chap4_pkmn_start9_p2.pdf")
	system("cp Figures/Chapter4/Pkmn/Plots/Fig6.pdf Tesis/img/Fig_chap4_pkmn_frustration.pdf")
	system("cp Figures/Chapter4/Pkmn/Plots/Fig7.pdf Tesis/img/Fig_chap4_pkmn_politics_p2.pdf")
}
