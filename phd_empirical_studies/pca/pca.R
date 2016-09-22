library(psych) # library for the 'principal()' function

#the distributions analyzed here do not include CC (change count) metric. Only cohesion metrics

TOMCAT <- read.table("cohesionMetricsFinal_with_MWE_tomcat_without_LCbC_Topics.csv", header=TRUE, sep=",");
TOMCAT2 <- TOMCAT[,c(2,3,4,5,6,7,8)] # keeping only desired columns
TOMCAT2 <- na.omit(TOMCAT2) # omiting N/A measures

# PCA function with varimax rotation
TOMCAT_PCA2 <- principal(TOMCAT2, nfactors=5, rotate="varimax")
TOMCAT_PCA2


JFREECHART <- read.table("cohesionMetricsFinal_with_MWE_tomcat_without_LCbC_Topics.csv", header=TRUE, sep=",");
JFREECHART2 <- JFREECHART[,c(2,3,4,5,6,7,8)]
JFREECHART2 <- na.omit(JFREECHART2)

JFREECHART_PCA2 <- principal(JFREECHART2, nfactors=5, rotate="varimax")
JFREECHART_PCA2


FINDBUGS <- read.table("cohesionMetricsFinal_with_MWE_Findbugs_without_LCbC_Topics.csv", header=TRUE, sep=",");
FINDBUGS2 <- FINDBUGS[,c(2,3,4,5,6,7,8)]
FINDBUGS2 <- na.omit(FINDBUGS2)

FINDBUGS_PCA2 <- principal(FINDBUGS2, nfactors=5, rotate="varimax")
FINDBUGS_PCA2


FREECOL <- read.table("cohesionMetricsFinal_with_MWE_Freecol_without_LCbC_Topics.csv", header=TRUE, sep=",");
FREECOL2 <- FREECOL[,c(2,3,4,5,6,7,8)]
FREECOL2 <- na.omit(FREECOL2)

FREECOL_PCA2 <- principal(FREECOL2, nfactors=5, rotate="varimax")
FREECOL_PCA2


JEDIT <- read.table("cohesionMetrics_MERGED_V3_jEdit-4.3.2_without_LCbC_MM_Topics.csv", header=TRUE, sep=",");
JEDIT2 <- JEDIT[,c(2,3,4,5,6,7,8)]
JEDIT2 <- na.omit(JEDIT2)
 
JEDIT_PCA2 <- principal(JEDIT2, nfactors=5, rotate="varimax")
JEDIT_PCA2


RHINO <- read.table("cohesionMetrics_MERGED_V3_Rhino_1.6R5_without_LCbC_MM_Topics.csv", header=TRUE, sep=",");
RHINO2 <- RHINO[,c(2,3,4,5,6,7,8)]
RHINO2 <- na.omit(RHINO2)

RHINO_PCA2 <- principal(RHINO2, nfactors=5, rotate="varimax")
RHINO_PCA2