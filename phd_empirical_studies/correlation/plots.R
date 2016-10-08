par(mfrow=c(2,3))
plot(TOMCAT$LCbC_XScan, type="p")
plot(TOMCAT$LCbC_XScan, type="l")
plot(TOMCAT$LCbC_XScan, type="b")
plot(TOMCAT$LCbC_XScan, type="s")
plot(TOMCAT$LCbC_XScan, type="h")
boxplot(TOMCAT$LCbC_XScan, type="h")

par(mfrow=c(2,6))
boxplot(RHINO$LCbC_XScan, main="Rhino - LCbC_XScan")
boxplot(JEDIT$LCbC_XScan, main="jEdit - LCbC_XScan")
boxplot(JFREECHART$LCbC_XScan, main="JFreeChart - LCbC_XScan")
boxplot(FINDBUGS$LCbC_XScan, main="Findbugs - LCbC_XScan")
boxplot(TOMCAT$LCbC_XScan, main="Tomcat - LCbC_XScan")
boxplot(FREECOL$LCbC_XScan, main="Freecol - LCbC_XScan")
boxplot(RHINO$LCbC_Topics, main="Rhino - LCbC_Topics")
boxplot(JEDIT$LCbC_Topics, main="jEdit - LCbC_Topics")
boxplot(JFREECHART$LCbC_Topics, main="JFreeChart - LCbC_Topics")
boxplot(FINDBUGS$LCbC_Topics, main="Findbugs - LCbC_Topics")
boxplot(TOMCAT$LCbC_Topics, main="Tomcat - LCbC_Topics")
boxplot(FREECOL$LCbC_Topics, main="Freecol - LCbC_Topics")


FINDBUGS <- read.table("LCCcounting_findbugs.csv", header=TRUE, sep=",")
FREECOL <- read.table("LCbCcounting_Freecol_0.8.4.csv", header=TRUE, sep=",")
JEDIT <- read.table("LCbCcounting_XScan_jedit-4.3.2.csv", header=TRUE, sep=",")
JFREECHART <- read.table("LCbCcounting_JFreeChart_1.0.6.csv", header=TRUE, sep=",")
RHINO <- read.table("LCCcounting_Rhino_1_6R5.csv", header=TRUE, sep=",")
TOMCAT <- read.table("LCbCcounting_tomcat6.csv", header=TRUE, sep=",")

par(mfrow=c(2,6))

plot(FINDBUGS$LCbC)
plot(FREECOL$LCbC)
plot(JEDIT$LCbC)
plot(JFREECHART$LCbC)
plot(RHINO$LCC)
plot(TOMCAT$LCbC)

hist(FINDBUGS$LCbC)
hist(FREECOL$LCbC)
hist(JEDIT$LCbC)
hist(JFREECHART$LCbC)
hist(RHINO$LCC)
hist(TOMCAT$LCbC)


FINDBUGS <- read.table("LCbC_andCC_Findbugs_2014.csv", header=TRUE, sep=",")
FREECOL <- read.table("LCbC_andCC_Freecol_2014.csv", header=TRUE, sep=",")
JFREECHART <- read.table("LCbC_andCC_JFreeChart_2014.csv", header=TRUE, sep=",")
TOMCAT <- read.table("LCbC_andCC_Tomcat_2014.csv", header=TRUE, sep=",")
JEDIT <- read.table("cohesionMetricsFinal_andCC_jEdit_4.3.2.csv", header=TRUE, sep=",")
RHINO <- read.table("cohesionMetricsFinal_andCC_Rhino_1.6R5.csv", header=TRUE, sep=",")

par(mfrow=c(2,3))

plot(FINDBUGS$LCbC_XScan, ylim=c(0,20))
plot(FREECOL$LCbC_XScan, ylim=c(0,20))
plot(JEDIT$LCbC_XScan, ylim=c(0,20))
plot(JFREECHART$LCbC_XScan, ylim=c(0,20))
plot(RHINO$LCbC_XScan, ylim=c(0,20))
plot(TOMCAT$LCbC_XScan, ylim=c(0,20))

par(mfrow=c(2,3))

plot(JFREECHART$LCbC_XScan, ylim=c(0,20))
plot(FREECOL$LCbC_XScan, ylim=c(0,20))
plot(RHINO$LCbC_XScan, ylim=c(0,20))

plot(JFREECHART$CC)
plot(FREECOL$CC)
plot(RHINO$CC)

par(mfrow=c(2,3))

plot(TOMCAT$LCbC_XScan, ylim=c(0,20))
plot(FINDBUGS$LCbC_XScan, ylim=c(0,20))
plot(JEDIT$LCbC_XScan, ylim=c(0,20))

plot(TOMCAT$CC)
plot(FINDBUGS$CC)
plot(JEDIT$CC)

par(mfrow=c(2,3))

plot(FINDBUGS$LCbC_XScan, FINDBUGS$CC)
abline(lm(FINDBUGS$CC~FINDBUGS$LCbC_XScan), col="red") # regression line (y~x) 
lines(lowess(FINDBUGS$LCbC_XScan,FINDBUGS$CC), col="blue") # lowess line (x,y)

plot(FREECOL$LCbC_XScan, FREECOL$CC)
abline(lm(FREECOL$CC~FREECOL$LCbC_XScan), col="red") # regression line (y~x) 
lines(lowess(FREECOL$LCbC_XScan,FREECOL$CC), col="blue") # lowess line (x,y)

plot(JEDIT$LCbC_XScan, JEDIT$CC)
abline(lm(JEDIT$CC~JEDIT$LCbC_XScan), col="red") # regression line (y~x) 
lines(lowess(JEDIT$LCbC_XScan,JEDIT$CC), col="blue") # lowess line (x,y)

plot(JFREECHART$CC, JFREECHART$LCbC_XScan)
abline(lm(JFREECHART$CC~JFREECHART$LCbC_XScan), col="red") # regression line (y~x) 
lines(lowess(JFREECHART$LCbC_XScan,JFREECHART$CC), col="blue") # lowess line (x,y)


plot(RHINO$LCbC_XScan, RHINO$CC)
abline(lm(RHINO$CC~RHINO$LCbC_XScan), col="red") # regression line (y~x) 
lines(lowess(RHINO$LCbC_XScan,RHINO$CC), col="blue") # lowess line (x,y)

plot(TOMCAT$LCbC_XScan, TOMCAT$CC)
abline(lm(TOMCAT$CC~TOMCAT$LCbC_XScan), col="red") # regression line (y~x) 
lines(lowess(TOMCAT$LCbC_XScan,TOMCAT$CC), col="blue") # lowess line (x,y)

par(mfrow=c(2,3))

boxplot(JFREECHART$LCbC_XScan, main="JFreeChart - LCbC_XScan", ylim=c(0,40))
boxplot(FREECOL$LCbC_XScan, main="FreeCol - LCbC_XScan", ylim=c(0,40))
boxplot(RHINO$LCbC_XScan, main="Rhino - LCbC_XScan", ylim=c(0,40))

boxplot(JFREECHART$CC, main="JFreeChart - CC")
boxplot(FREECOL$CC, main="FreeCol - CC")
boxplot(RHINO$CC, main="Rhino - CC")

par(mfrow=c(2,3))

boxplot(TOMCAT$LCbC_XScan, main="Tomcat - LCbC_XScan", ylim=c(0,20))
boxplot(FINDBUGS$LCbC_XScan, main="Findbugs - LCbC_XScan", ylim=c(0,20))
boxplot(JEDIT$LCbC_XScan, main="JEdit - LCbC_XScan", ylim=c(0,20))

boxplot(TOMCAT$CC, main="Tomcat - CC")
boxplot(FINDBUGS$CC, main="Findbugs - CC")
boxplot(JEDIT$CC, main="JEdit - CC")


par(mfrow=c(2,3))

boxplot(JFREECHART$LCbC_Topics, main="JFreeChart - LCbC_Topics", ylim=c(0,8))
boxplot(FREECOL$LCbC_Topics, main="FreeCol - LCbC_Topics", ylim=c(0,8))
boxplot(RHINO$LCbC_Topics, main="Rhino - LCbC_Topics", ylim=c(0,8))

boxplot(JFREECHART$CC, main="JFreeChart - CC")
boxplot(FREECOL$CC, main="FreeCol - CC")
boxplot(RHINO$CC, main="Rhino - CC")

par(mfrow=c(2,3))

boxplot(TOMCAT$LCbC_Topics, main="Tomcat - LCbC_Topics", ylim=c(0,20))
boxplot(FINDBUGS$LCbC_Topics, main="Findbugs - LCbC_Topics", ylim=c(0,20))
boxplot(JEDIT$LCbC_Topics, main="JEdit - LCbC_Topics", ylim=c(0,20))

boxplot(TOMCAT$CC, main="Tomcat - CC")
boxplot(FINDBUGS$CC, main="Findbugs - CC")
boxplot(JEDIT$CC, main="JEdit - CC")

par(mfrow=c(2,3))
boxplot(JFREECHART[2:4], outline=FALSE, main="JFreeChart")
boxplot(FREECOL[2:4], outline=FALSE, main="Freecol")
boxplot(RHINO[10:13], outline=FALSE, main="Rhino")

boxplot(TOMCAT[2:4], outline=FALSE, main="Tomcat")
boxplot(FINDBUGS[2:4], outline=FALSE, main="Findbugs")
boxplot(JEDIT[10:13], outline=FALSE, main="JEdit")

par(mfrow=c(1,2))
boxplot(RHINO[9:13], outline=FALSE, main="Rhino")
boxplot(JEDIT[9:13], outline=FALSE, main="JEdit")

par(mfrow=c(2,3))

plot(JFREECHART$CC)
lines(JFREECHART$LCbC_XScan, col="red")
lines(JFREECHART$LCbC_Topics, col="blue")

plot(FREECOL$CC)
lines(FREECOL$LCbC_XScan, col="red")
lines(FREECOL$LCbC_Topics, col="blue")


plot(TOMCAT$CC)
lines(TOMCAT$LCbC_XScan, col="red")
lines(TOMCAT$LCbC_Topics, col="blue")

plot(FINDBUGS$CC)
lines(FINDBUGS$LCbC_XScan, col="red")
lines(FINDBUGS$LCbC_Topics, col="blue")

plot(JEDIT$CC)
lines(JEDIT$LCbC_XScan, col="red")
lines(JEDIT$LCbC_Topics, col="blue")
lines(JEDIT$LCbC_MM, col="green")

plot(RHINO$CC)
lines(RHINO$LCbC_XScan, col="red")
lines(RHINO$LCbC_Topics, col="blue")
lines(RHINO$LCbC_MM, col="green")

par(mfrow=c(2,3))
boxplot(JFREECHART[2:3], main="JFreeChart")
boxplot(FREECOL[2:3], main="Freecol")
boxplot(RHINO[11:10], main="Rhino")
boxplot(TOMCAT[2:3], main="Tomcat")
boxplot(FINDBUGS[2:3], main="Findbugs")
boxplot(JEDIT[11:10], main="jEdit")