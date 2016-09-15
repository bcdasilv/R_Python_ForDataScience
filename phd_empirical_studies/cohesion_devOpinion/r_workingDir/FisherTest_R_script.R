# http://stat.ethz.ch/R-manual/R-patched/library/stats/html/fisher.test.html

# Creating matrix: cohesion familiarity vs. ratings
cohFam_Ratings1 <- matrix(c(41,4,26,0, 4,0,4,1), nrow = 2, ncol = 4, byrow = TRUE, dimnames = list(c("Yes", "No"), c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know")))
cohFam_Ratings1

cohFam_Ratings2 <- matrix(c(50,9,12,0, 4,1,3,1), nrow = 2, ncol = 4, byrow = TRUE, dimnames = list(c("Yes", "No"), c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know")))
cohFam_Ratings2
 
cohFam_Ratings3 <- matrix(c(5,41,24,1, 1,2,6,0), nrow = 2, ncol = 4, byrow = TRUE, dimnames = list(c("Yes", "No"), c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know")))
cohFam_Ratings3

# Executing the Fisher exact test between Cohesion familiarity and Ratings
fisher.test(cohFam_Ratings1, simulate.p.value = TRUE)
fisher.test(cohFam_Ratings1)

fisher.test(cohFam_Ratings2, simulate.p.value = TRUE)
fisher.test(cohFam_Ratings2)

fisher.test(cohFam_Ratings3, simulate.p.value = TRUE)
fisher.test(cohFam_Ratings3)

### --------------------------------------------------------------------------- ###

# Creating matrix: academic degree vs. cohesion familiarity

cohFam_AcadDegree <- matrix(c(2,20,10,31,8,0, 0,5,1,2,1,0), nrow = 2, ncol = 6, byrow = TRUE, dimnames = list(c("Yes", "No"), c("Undergrad", "Grad", "Grad Cert Expert", "Master", "PhD", "No degree")))
cohFam_AcadDegree

# Executing the Fisher exact test between Academic degree and Cohesion Familiarity

fisher.test(cohFam_AcadDegree, simulate.p.value = TRUE)
fisher.test(cohFam_AcadDegree)

### --------------------------------------------------------------------------- ###

# Creating matrix: academic degree vs. ratings

ratings1_AcadDegree <- matrix(c(1,12,5,21,6,0, 0,2,0,2,1,0, 1,10,6,10,3,0, 0,1,0,0,0,0), nrow = 4, ncol = 6, byrow = TRUE, dimnames = list(c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know"), c("Undergrad", "Grad", "Grad Cert Expert", "Master", "PhD", "No degree")))
ratings1_AcadDegree

ratings2_AcadDegree <- matrix(c(2,17,9,22,5,0, 0,3,2,1,4,0, 0,4,0,10,0,0, 0,1,0,0,0,0), nrow = 4, ncol = 6, byrow = TRUE, dimnames = list(c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know"), c("Undergrad", "Grad", "Grad Cert Expert", "Master", "PhD", "No degree")))
ratings2_AcadDegree

ratings3_AcadDegree <- matrix(c(0,1,1,3,1,0, 1,15,5,17,5,0, 1,9,4,13,3,0, 0,0,1,0,0,0), nrow = 4, ncol = 6, byrow = TRUE, dimnames = list(c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know"), c("Undergrad", "Grad", "Grad Cert Expert", "Master", "PhD", "No degree")))
ratings3_AcadDegree

# Executing the Fisher exact test between Academic degree and Ratings
fisher.test(ratings1_AcadDegree, simulate.p.value = TRUE)
fisher.test(ratings1_AcadDegree)

fisher.test(ratings2_AcadDegree, simulate.p.value = TRUE)
fisher.test(ratings2_AcadDegree)

fisher.test(ratings3_AcadDegree, simulate.p.value = TRUE)
fisher.test(ratings3_AcadDegree)

### --------------------------------------------------------------------------- ###

# Creating matrix: years of programming experience vs. ratings

ratings1_1_YearsProg <- matrix(c(10,11,24, 1,1,2, 10,11,9, 0,1,0), nrow = 4, ncol = 3, byrow = TRUE, dimnames = list(c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know"), c("<=5", ">5 AND <15", ">=15")))
ratings1_1_YearsProg

ratings2_1_YearsProg <- matrix(c(14,14,26, 3,4,3, 4,5,6, 0,1,0), nrow = 4, ncol = 3, byrow = TRUE, dimnames = list(c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know"), c("<=5", ">5 AND <15", ">=15")))
ratings2_1_YearsProg

ratings3_1_YearsProg <- matrix(c(2,2,2, 10,12,21, 9,9,12, 0,1,0), nrow = 4, ncol = 3, byrow = TRUE, dimnames = list(c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know"), c("<=5", ">5 AND <15", ">=15")))
ratings3_1_YearsProg

# Executing the Fisher exact test between Years of Prog. Exp. and Ratings

fisher.test(ratings1_1_YearsProg, simulate.p.value = TRUE)
fisher.test(ratings1_1_YearsProg)

fisher.test(ratings2_1_YearsProg, simulate.p.value = TRUE)
fisher.test(ratings2_1_YearsProg)

fisher.test(ratings3_1_YearsProg, simulate.p.value = TRUE)
fisher.test(ratings3_1_YearsProg)

### --------------------------------------------------------------------------- ###
#    **** NOW having the three categories according to 1st, IQR, and 3rd quartile: #

# Creating matrix: years of programming experience vs. ratings

ratings1_1_YearsProg <- matrix(c(10,21,14, 1,2,1, 10,15,5, 0,1,0), nrow = 4, ncol = 3, byrow = TRUE, dimnames = list(c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know"), c("<=5", ">5 AND <12.25", ">=12.25")))
ratings1_1_YearsProg

ratings2_1_YearsProg <- matrix(c(14,24,16, 3,5,2, 4,9,2, 0,1,0), nrow = 4, ncol = 3, byrow = TRUE, dimnames = list(c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know"), c("<=5", ">5 AND <12.25", ">=12.25")))
ratings2_1_YearsProg

ratings3_1_YearsProg <- matrix(c(2,4,0, 10,19,14, 9,15,6, 0,1,0), nrow = 4, ncol = 3, byrow = TRUE, dimnames = list(c("1st more cohesive", "2nd more cohesive", "Equally coh", "Don't know"), c("<=5", ">5 AND <12.25", ">=12.25")))
ratings3_1_YearsProg

# Executing the Fisher exact test between Years of Prog. Exp. and Ratings
fisher.test(ratings1_1_YearsProg, simulate.p.value = TRUE)
fisher.test(ratings1_1_YearsProg)

fisher.test(ratings2_1_YearsProg, simulate.p.value = TRUE)
fisher.test(ratings2_1_YearsProg)

fisher.test(ratings3_1_YearsProg, simulate.p.value = TRUE)
fisher.test(ratings3_1_YearsProg)
