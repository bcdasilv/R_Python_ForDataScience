cohFam_Years <- read.csv(file="cohFam_Years.csv",head=TRUE,sep=";")
cohFam_yearsProg <- glm(cohFam ~ yearsProg, data=cohFam_Years, family=binomial())
summary(cohFam_yearsProg)

cohFam_yearsProgLargeProj <- glm(cohFam ~ yearsProgLargeProj, data=cohFam_Years, family=binomial())
summary(cohFam_yearsProgLargeProj)

cohFam_yearsProg_yearsProgLargProj <- glm(cohFam ~ yearsProg + yearsProgLargeProj, data=cohFam_Years, family=binomial())
summary(cohFam_yearsProg_yearsProgLargProj)