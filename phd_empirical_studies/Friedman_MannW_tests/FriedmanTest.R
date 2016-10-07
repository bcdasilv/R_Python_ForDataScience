# It is necessary to load the LCbC columns for each system beforehand.

# Tomcat, JFreeChart, Freecol and Findbugs: only two columns (LCbC_XScan vs. LCbC_Topics)
friedman.test(as.matrix(Tomcat_LCbC_Topics_XScan[,2:3]))
friedman.test(as.matrix(JFreeChart_LCbC_Topics_XScan[,2:3]))
friedman.test(as.matrix(Freecol_LCbC_Topics_XScan[,2:3]))
friedman.test(as.matrix(Findbugs_LCbC_Topics_XScan[,2:3]))

# jEdit and Rhino: three columns (all three LCbC variations)
friedman.test(as.matrix(JEDIT))
friedman.test(as.matrix(RHINO))