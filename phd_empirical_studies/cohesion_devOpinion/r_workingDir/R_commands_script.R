
## Loading R file exported from the Limesurvey server

source("survey_44763_R_syntax_file.R", encoding = "UTF-8")

## The following file should be in the same folder: survey_44763_R_data_file.csv
## All the data collected and auxiliary functions created by the Limesurvey engine are going to be loaded

# Generating the boxplots for 'years of programming experience'.
par(mfrow = c(1,2)) 
boxplot(data[,41], ylim=c(0,30))
boxplot(data[,42], ylim=c(0,30))

# Loading the irr package containing various coefficients of interrater reliability and agreement
library(irr)

# I created this function to convert and transform the ratings to a target matrix of 0's and 1's
convertRatings <- function (ratings) 
{
    lev <- levels(as.factor(ratings))
    ratings <- as.matrix(na.omit(ratings))
    ns <- nrow(ratings)
    target <- array(0, dim=c(ns,4))
    for (i in 1:ns) {
	if(ratings[i] == lev[1])
		target[i, 1] <- 1
	else if(ratings[i] == lev[2])
		target[i, 2] <- 1
	else if(ratings[i] == lev[3])
		target[i, 3] <- 1
	else if(ratings[i] == lev[4])
		target[i, 4] <- 1
    }
    return(target)
}


# data[,19] is the column which contains the answers for the first comparison scenario
ratings1 <- convertRatings (data[,19])

kappam.fleiss(ratings1)

# data[,21] is the column which contains the answers for the second comparison scenario
ratings2 <- covertRatings (data[,21])

kappam.fleiss(ratings2)

# data[,23] is the column which contains the answers for the first comparison scenario
ratings3 <- covertRatings (data[,23])

kappam.fleiss(ratings3)

ratingsToRow <- function (ratings) 
+ {
+     #ns is used just to iterate the for loop
+     ns <- nrow(ratings)
+ 
+     # the row to represent the sum of ratings
+     target <- array(0, dim=c(1,4))
+ 
+     for (j in 1:4){
+        colSum <- 0
+        for (i in 1:ns) {
+           colSum <- colSum + ratings[i, j]  
+        }
+        target[j] <- colSum
+     }
+     return(target)
+ }

ratings1_row <- ratingsToRow(ratings1)

ratings2_row <- ratingsToRow(ratings2)

ratings3_row <- ratingsToRow(ratings3)

ratings <- array(dim=c(3,4))

ratings [1,] <- ratings1_row
ratings [2,] <- ratings2_row
ratings [3,] <- ratings3_row

kappam.fleiss(ratings)

# Final conversion to apply fleiss kappa per question
# the resulting matrix has 2 rows -- one for each class in the survey 
# comparison question. For each "first class is more cohesive" answer 
# row1 increments. For each "second class is more cohesive" answer row2
# increments. If "similar cohesion" or "i don't know" answers then 
# increments both rows
convertRatings2 <- function (ratings) 
{
    #ns is used just to iterate the for loop
    ns <- nrow(ratings)

    # the resulting matrix
    target <- array(0, dim=c(2,3))

    for (j in 1:4){
       for (i in 1:ns) {
	  if (j == 1)
	  	target[1,1] = target[1,1] + ratings[i,j]
	  else if (j == 2)
	  	target[2,1] = target[2,1] + ratings[i,j]
	  else if (j == 3){
	  	target[1,2] = target[1,2] + ratings[i,j]
	  	target[2,2] = target[2,2] + ratings[i,j]
	  }
	  else if (j == 4){
	  	target[1,3] = target[1,3] + ratings[i,j]
	  	target[2,3] = target[2,3] + ratings[i,j]
	  }
       }
    }
    return(target)
}

ratings1_1 <- convertRatings2(ratings1)

kappam.fleiss(ratings1_1)

ratings2_1 <- convertRatings2(ratings2)

kappam.fleiss(ratings2_1)

ratings3_1 <- convertRatings2(ratings3)

kappam.fleiss(ratings3_1)

#------------------------------------------------------------------------
#	AFTER ANALYZING THE PAPER ABOUT DEVELOPERS' OPINION ABOUT COMPLEXITY
#	...I organized the data in the same way the authors of that paper did
#------------------------------------------------------------------------

## Loading R file exported from the Limesurvey server
source("survey_44763_R_syntax_file.R", encoding = "UTF-8")

## The following file should be in the same folder: survey_44763_R_data_file.csv
## All the data collected and auxiliary functions created by the Limesurvey engine are going to be loaded

# Loading the irr package containing various coefficients of interrater reliability and agreement
library(irr)

# I created this function to convert and transform the ratings to a target matrix of 0's and 1's
convertRatings <- function (ratings) 
{
    lev <- levels(as.factor(ratings))
    ratings <- as.matrix(na.omit(ratings))
    ns <- nrow(ratings)
    target <- array(0, dim=c(ns,4))
    for (i in 1:ns) {
	if(ratings[i] == lev[1])
		target[i, 1] <- 1
	else if(ratings[i] == lev[2])
		target[i, 2] <- 1
	else if(ratings[i] == lev[3])
		target[i, 3] <- 1
	else if(ratings[i] == lev[4])
		target[i, 4] <- 1
    }
    return(target)
}

# data[,19] is the column which contains the answers for the first comparison scenario

ratings1 <- convertRatings (data[,19])

# creating a matrix of '>', '<' and '=' symbols representing participants' answers.
convertRatings3 <- function (ratings) 
{
    #ns is used just to iterate the for loop
    # and to define the number of columns in the target matrix
    ns <- nrow(ratings)

    # the resulting matrix
    target <- array(dim=c(2,ns))

    for (i in 1:ns){
       for (j in 1:4) {
	  if ((j == 1) && (ratings[i, j] == 1)){
		target[1,i] = ">"
		target[2,i] = "<"
		j = 5
	  }
	  else if ((j == 2) && (ratings[i, j] == 1)){
		target[1,i] = "<"
		target[2,i] = ">"
		j = 5
	  }
	  else if ((j == 3) && (ratings[i, j] == 1)){
		target[1,i] = "="
		target[2,i] = "="
		j = 5
	  }
	  else if ((j == 4) && (ratings[i, j] == 1)){
		target[1,i] = "?"
		target[2,i] = "?"
		j = 5
	  }
       }
    }
    return(target)
}

ratings1_1 <- convertRatings3(ratings1)
kappam.fleiss(ratings1_1)

#Now the same but excluding the column 52 (missing value)

convertRatings3 <- function (ratings) 
{
    #ns is used just to iterate the for loop
    # and to define the number of columns in the target matrix
    ns <- nrow(ratings)

    # the resulting matrix
    target <- array(dim=c(2,ns))

    for (i in 1:ns){
       for (j in 1:4) {
	  if ((j == 1) && (ratings[i, j] == 1)){
		target[1,i] = ">"
		target[2,i] = "<"
		j = 5
	  }
	  else if ((j == 2) && (ratings[i, j] == 1)){
		target[1,i] = "<"
		target[2,i] = ">"
		j = 5
	  }
	  else if ((j == 3) && (ratings[i, j] == 1)){
		target[1,i] = "="
		target[2,i] = "="
		j = 5
	  }
       }
    }
    return(target)
}

ratings1_1 <- convertRatings3(ratings1)
ratings1_1_NAomited <- ratings1_1[,-52]
ratings1_1_NAomited

kappam.fleiss(ratings1_1_NAomited)

ratings2 <- convertRatings (data[,21])
ratings2_1 <- convertRatings3(ratings2)
ratings2_1_NAomited <- ratings2_1[,-52]
kappam.fleiss(ratings2_1_NAomited)

ratings3 <- convertRatings (data[,23])
ratings3_1 <- convertRatings3(ratings3)
ratings3_1_NAomited <- ratings3_1[,-41]
kappam.fleiss(ratings3_1_NAomited)


#--------------------------------------------------
#--------------------------------------------------
#Now redoing everything considering the correction
#of mistakes made by some participants on the 
#third comparison
#
# This is just a test to see if that change would
# affect the results in a significant way.
#--------------------------------------------------
#--------------------------------------------------
ratings3 <- convertRatings (data[,23])
ratings3_1 <- convertRatings3(ratings3)

ratings3_1[,4] <- "<"
ratings3_1[,10] <- "<"
ratings3_1[,71] <- "<"
ratings3_1[,80] <- "<"
ratings3_1_NAomited <- ratings3_1[,-41]
kappam.fleiss(ratings3_1_NAomited)

#=======================================================================
#=======================================================================
#Now crossing programming experience with coh familiarity question
#=======================================================================
#=======================================================================

cohFamiliarity_Experience <- matrix(ncol=7, nrow=80)
colnames(cohFamiliarity_Experience ) <- c("Coh_Familiarity", "AcademicDegree", "ProgExp", "ProgExpCompColleagues", "Exp_OOP", "Years_Prog", "Years_ProgLargeProj")
cohFamiliarity_Experience[,1] <- data[,16]
cohFamiliarity_Experience[,2] <- data[,25]
cohFamiliarity_Experience[,3] <- data[,37]
cohFamiliarity_Experience[,4] <- data[,38]
cohFamiliarity_Experience[,5] <- data[,40]
cohFamiliarity_Experience[,6] <- data[,41]
cohFamiliarity_Experience[,7] <- data[,42]
cohFamiliarity_Experience <- as.table(cohFamiliarity_Experience)
cohFamiliarity_Experience

#=======================================================================
#=======================================================================
#Now crossing programming experience with cohesion ratings
#=======================================================================
#=======================================================================

ratingsVSexperience <- matrix(ncol=12, nrow=80)
colnames(ratingsVSexperience) <- c("comp1", "comp1_expl", "comp2", "comp2_expl", "comp3", "comp3_expl", "AcademicDegree", "ProgExp", "ProgExpCompColleagues", "Exp_OOP", "Years_Prog", "Years_ProgLargeProj")
ratingsVSexperience [,1] <- data[,19]
ratingsVSexperience [,2] <- data[,20]
ratingsVSexperience [,3] <- data[,21]
ratingsVSexperience [,4] <- data[,22]
ratingsVSexperience [,5] <- data[,23]
ratingsVSexperience [,6] <- data[,24]
ratingsVSexperience [,7] <- data[,25]
ratingsVSexperience [,8] <- data[,37]
ratingsVSexperience [,9] <- data[,38]
ratingsVSexperience [,10] <- data[,40]
ratingsVSexperience [,11] <- data[,41]
ratingsVSexperience [,12] <- data[,42]
ratingsVSexperience <- as.table(ratingsVSexperience)

write.csv(ratingsVSexperience, file = "ratingsVSexperience.csv", quote = TRUE, sep = ",", ow.names = FALSE, col.names = TRUE)

ratingsVSexperience <- matrix(ncol=13, nrow=80)
colnames(ratingsVSexperience) <- c("comp1", "comp1_expl", "comp2", "comp2_expl", "comp3", "comp3_expl", "AcademicDegree", "ProgExp", "ProgExpCompColleagues", "Exp_OOP", "Years_Prog", "Years_ProgLargeProj", "coh_Familiarity")
ratingsVSexperience [,1] <- data[,19]
ratingsVSexperience [,2] <- data[,20]
ratingsVSexperience [,3] <- data[,21]
ratingsVSexperience [,4] <- data[,22]
ratingsVSexperience [,5] <- data[,23]
ratingsVSexperience [,6] <- data[,24]
ratingsVSexperience [,7] <- data[,25]
ratingsVSexperience [,8] <- data[,37]
ratingsVSexperience [,9] <- data[,38]
ratingsVSexperience [,10] <- data[,40]
ratingsVSexperience [,11] <- data[,41]
ratingsVSexperience [,12] <- data[,42]
ratingsVSexperience [,13] <- data[,16]
ratingsVSexperience <- as.table(ratingsVSexperience)
