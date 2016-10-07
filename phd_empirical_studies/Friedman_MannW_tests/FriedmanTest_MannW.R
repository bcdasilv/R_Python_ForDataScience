#SUMMARY:
#	LCbC measurements for both Rhino and jEdit are not identical/similar according 
#	to Friedman and Mann Whitney Wilcoxon test.

friedman.test(as.matrix(JEDIT))

friedman.test(as.matrix(RHINO))

friedman.test(as.matrix(Tomcat_LCbC_Topics_XScan[,2:3]))

friedman.test(as.matrix(JFreeChart_LCbC_Topics_XScan[,2:3]))

friedman.test(as.matrix(Freecol_LCbC_Topics_XScan[,2:3]))

friedman.test(as.matrix(Findbugs_LCbC_Topics_XScan[,2:3]))


###
### http://www.graphpad.com/guides/prism/6/statistics/index.htm?how_the_friedman_test_works.htm
#If the P value is small, you can reject the idea that all of the differences between columns are due to random sampling, and conclude instead that at least one of the treatments (columns) differs from the rest. Then look at post test results to see which groups differ from which other groups.
#If the P value is large, the data do not give you any reason to conclude that the overall medians differ. This is not the same as saying that the medians are the same. You just have no compelling evidence that they differ. If you have small samples, Friedman's test has little power.

###
### http://www.r-statistics.com/2010/02/post-hoc-analysis-for-friedmans-test-r-code/
#The hypotheses for the comparison across repeated measures are:
#    H0: The distributions (whatever they are) are the same across repeated measures
#    H1: The distributions across repeated measures are different

### Now exercising the same, however, we now use the Man-Whitney U test, which test a pair of variables instead of all of the variables together.

#Mann–Whitney U test (Mann–Whitney–Wilcoxon, Wilcoxon rank-sum test, or Wilcoxon–Mann–Whitney test)
#is a nonparametric test of the null hypothesis that two populations are the same against an alternative hypothesis, especially that a particular population tends to have larger values than the other.

# Null Hypothesis: asserts that the medians of the two samples are identical.

#The Mann-Whitney U-test is used to test whether two independent samples of observations are drawn from the same or identical distributions.
#we can decide whether the corresponding data population distributions are identical without assuming them to follow the normal distribution. 

wilcox.test(JEDIT[,1], JEDIT[,2])
wilcox.test(JEDIT[,1], JEDIT[,3])
wilcox.test(JEDIT[,2], JEDIT[,3])

wilcox.test(RHINO[,1], RHINO[,2])
wilcox.test(RHINO[,1], RHINO[,3])
wilcox.test(RHINO[,2], RHINO[,3])

wilcox.test(Tomcat_LCbC_Topics_XScan[,2], Tomcat_LCbC_Topics_XScan[,3])
wilcox.test(JFreeChart_LCbC_Topics_XScan[,2], JFreeChart_LCbC_Topics_XScan[,3])
wilcox.test(Freecol_LCbC_Topics_XScan[,2], Freecol_LCbC_Topics_XScan[,3])
wilcox.test(Findbugs_LCbC_Topics_XScan[,2], Findbugs_LCbC_Topics_XScan[,3])
q