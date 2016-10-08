
## Pearson and Spearman correlation tests

Rhino_LCbC_Xscan_Topics <- read.table("LCbC_XScan_vs_Topics_Rhino.csv", header=TRUE, sep=",")
rcorr(as.matrix(Rhino_LCbC_Xscan_Topics[,2:3]), type="pearson");
rcorr(as.matrix(Rhino_LCbC_Xscan_Topics[,2:3]), type="spearman");

Rhino_LCbC_MM_Topics <- read.table("LCbC_MM_vs_Topics_Rhino.csv", header=TRUE, sep=",")
rcorr(as.matrix(Rhino_LCbC_MM_Topics[,2:3]), type="pearson");
rcorr(as.matrix(Rhino_LCbC_MM_Topics[,2:3]), type="spearman");

Rhino_LCbC_MM_XScan <- read.table("LCbC_MM_vs_XScan_Rhino.csv", header=TRUE, sep=",")

rcorr(as.matrix(Rhino_LCbC_MM_XScan[,2:3]), type="pearson");
rcorr(as.matrix(Rhino_LCbC_MM_XScan[,2:3]), type="spearman");

Jedit_LCbC_MM_XScan <- read.table("LCbC_MM_vs_XScan_JEdit_4.3.2.csv", header=TRUE, sep=",")
rcorr(as.matrix(Jedit_LCbC_MM_XScan[,2:3]), type="pearson");
rcorr(as.matrix(Jedit_LCbC_MM_XScan[,2:3]), type="spearman");

Jedit_LCbC_MM_Topics <- read.table("LCbC_MM_vs_Topics_JEdit_4.3.2.csv", header=TRUE, sep=",")
rcorr(as.matrix(Jedit_LCbC_MM_Topics[,2:3]), type="pearson");
rcorr(as.matrix(Jedit_LCbC_MM_Topics[,2:3]), type="spearman");

Jedit_LCbC_XScan_Topics <- read.table("LCbC_XScan_vs_Topics_JEdit_4.3.2.csv", header=TRUE, sep=",")
rcorr(as.matrix(Jedit_LCbC_XScan_Topics[,2:3]), type="pearson");
rcorr(as.matrix(Jedit_LCbC_XScan_Topics[,2:3]), type="spearman");

JFreeChart_LCbC_Topics_XScan <- read.table("LCbC_Topics_vs_XScan_JFreeChart_1.0.6.csv", header=TRUE, sep=",")
rcorr(as.matrix(JFreeChart_LCbC_Topics_XScan[,2:3]), type="pearson");
rcorr(as.matrix(JFreeChart_LCbC_Topics_XScan[,2:3]), type="spearman");

Freecol_LCbC_Topics_XScan <- read.table("LCbC_Topics_vs_XScan_Freecol.csv", header=TRUE, sep=",")
rcorr(as.matrix(Freecol_LCbC_Topics_XScan[,2:3]), type="pearson");
rcorr(as.matrix(Freecol_LCbC_Topics_XScan[,2:3]), type="spearman");

Findbugs_LCbC_Topics_XScan <- read.table("LCbC_Topics_vs_XScan_Findbugs.csv", header=TRUE, sep=",")
rcorr(as.matrix(Findbugs_LCbC_Topics_XScan[,2:3]), type="pearson")
rcorr(as.matrix(Findbugs_LCbC_Topics_XScan[,2:3]), type="spearman")

Tomcat_LCbC_Topics_XScan <- read.table("LCbC_Topics_vs_XScan_Tomcat.csv", header=TRUE, sep=",")
rcorr(as.matrix(Tomcat_LCbC_Topics_XScan[,2:3]), type="pearson")
rcorr(as.matrix(Tomcat_LCbC_Topics_XScan[,2:3]), type="spearman")
