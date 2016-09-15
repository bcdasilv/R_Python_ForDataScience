#$Rev: 12179 $ filter.
data <- read.table("survey_44763_R_data_file.csv", sep=",", quote = "'", na.strings=c("","\"\""), stringsAsFactors=FALSE)

data[, 1] <- as.character(data[, 1])
attributes(data)$variable.labels[1] <- "First name"
names(data)[1] <- "firstname"

data[, 2] <- as.character(data[, 2])
attributes(data)$variable.labels[2] <- "Last name"
names(data)[2] <- "lastname"

data[, 3] <- as.character(data[, 3])
attributes(data)$variable.labels[3] <- "Email address"
names(data)[3] <- "email"

data[, 4] <- as.character(data[, 4])
attributes(data)$variable.labels[4] <- "Language code"
names(data)[4] <- "language"

data[, 5] <- as.character(data[, 5])
attributes(data)$variable.labels[5] <- "Invitation sent date"
names(data)[5] <- "sent"

data[, 6] <- as.character(data[, 6])
attributes(data)$variable.labels[6] <- "Last Reminder sent date"
names(data)[6] <- "remindersent"

data[, 7] <- as.character(data[, 7])
attributes(data)$variable.labels[7] <- "Total numbers of sent reminders"
names(data)[7] <- "remindercount"

data[, 8] <- as.character(data[, 8])
attributes(data)$variable.labels[8] <- "Uses left"
names(data)[8] <- "usesleft"

data[, 9] <- as.numeric(data[, 9])
attributes(data)$variable.labels[9] <- "id"
names(data)[9] <- "id"

data[, 10] <- as.character(data[, 10])
attributes(data)$variable.labels[10] <- "submitdate"
names(data)[10] <- "submitdate"

#Field hidden

data[, 11] <- as.character(data[, 11])
attributes(data)$variable.labels[11] <- "startlanguage"
names(data)[11] <- "startlanguage"

data[, 12] <- as.character(data[, 12])
attributes(data)$variable.labels[12] <- "token"
names(data)[12] <- "token"

data[, 13] <- as.character(data[, 13])
attributes(data)$variable.labels[13] <- "datestamp"
names(data)[13] <- "datestamp"

data[, 14] <- as.character(data[, 14])
attributes(data)$variable.labels[14] <- "startdate"
names(data)[14] <- "startdate"

data[, 15] <- as.character(data[, 15])
attributes(data)$variable.labels[15] <- "ipaddr"
names(data)[15] <- "ipaddr"

data[, 16] <- as.character(data[, 16])
attributes(data)$variable.labels[16] <- "Are you familiar with the concept of \"Cohesion\" in the context of software development?"
data[, 16] <- factor(data[, 16], levels=c("A1","A2"),labels=c("Yes.","No."))
names(data)[16] <- "q0"

data[, 17] <- as.character(data[, 17])
attributes(data)$variable.labels[17] <- "[Comment] Are you familiar with the concept of \"Cohesion\" in the context of software development?"
names(data)[17] <- "q0_comment"

data[, 18] <- as.character(data[, 18])
attributes(data)$variable.labels[18] <- "How would you explain to someone else what a highly cohesive class is?"
names(data)[18] <- "q_CohExplanation"

#Field hidden

data[, 19] <- as.character(data[, 19])
attributes(data)$variable.labels[19] <- "Consider the following two Java classes that belongs to a hotel management system. 

	 

	The system supports the management of a hotel, i.e. creating/canceling/editing of bookings, billing, creating/editing rooms/categories/users and storing guest data.

	 

	These two classes are utility classes for the data base access.

	The first one, DB_Backend.java (click here to access the source code), is responsible for managing data base connections.

	(Click here if you want to download the java source code to open on your favorite editor)

	 

	The second one, DB_InsertUpdate.java (click here to access the source code), is responsible for writing data to the data base either by inserting or by updating information.

	(Click here if you want to download the java source code to open on your favorite editor)

	 

	The Java classes were taken from a real and open source software hosted at SourceForge (http://fgmp-hm.sourceforge.net/).

	 
Please, analyze them and regarding their cohesion"
data[, 19] <- factor(data[, 19], levels=c("A1","A2","A3","A4"),labels=c("The first class (DB_Backend) is more cohesive than the second one  (DB_InsertUpdate)","The second class (DB_InsertUpdate) is more cohesive than the first one  (DB_Backend)","Both classes have quite similar cohesion.","I don't know."))
names(data)[19] <- "q_DBbackend_DBinsert"

data[, 20] <- as.character(data[, 20])
attributes(data)$variable.labels[20] <- "Why did you pick that option? What was your rationale to answer this question?"
names(data)[20] <- "q3.1"

data[, 21] <- as.character(data[, 21])
attributes(data)$variable.labels[21] <- "Now consider the following two Java classes that belongs to the same project (a hotel management System). 

	 

	The system supports the management of a hotel, i.e. creating/canceling/editing of bookings, billing, creating/editing rooms/categories/users and storing guest data.

	 

	These are the two classes for analysis: 

	 

	Main_Config2.java (click here to access the source code): a utility class for saving and loading system configuration properties from a text file.

	(Click here if you want to download the java source code to open on your favorite editor)

	 

	DB_Helpers.java (click here to access the source code): a utility class for providing general methods for data base accessing.

	(Click here if you want to download the java source code to open on your favorite editor)

	 

	The Java classes were taken from a real and open source software hosted at SourceForge (http://fgmp-hm.sourceforge.net/).

	 
Please, analyze them and regarding their cohesion"
data[, 21] <- factor(data[, 21], levels=c("A1","A2","A3","A4"),labels=c("The first class (Main_Config2) is more cohesive than the second one  (DB_Helpers)","The second class (DB_Helpers) is more cohesive than the first one  (Main_Config2)","Both classes have quite similar cohesion.","I don't know."))
names(data)[21] <- "q_MainConfig_DBhelp"

data[, 22] <- as.character(data[, 22])
attributes(data)$variable.labels[22] <- "Why did you pick that option? What was your rationale to answer this question?"
names(data)[22] <- "q5"

data[, 23] <- as.character(data[, 23])
attributes(data)$variable.labels[23] <- "Consider the following two Java classes that belongs to the FamilyTree project. 

	 

	This Java project implements family relationships between husband and wife, and between parents and their children. 

	 

	The relationships may be stored in disk and also they may be displayed in a graphical user interface.

	 

	RelationSpouse.java (click here to access the source code): represents the relationship between husband and wife.

	(Click here if you want to download the java source code to open on your favorite editor)

	 

	RelationParentChild.java (click here to access the source code): represents the relationship between a parent and his child.

	(Click here if you want to download the java source code to open on your favorite editor)

	 

	The Java classes were taken from an open source software hosted at http://www.soberit.tkk.fi/~mmantyla/ISESE2006/.

	 
Please, analyze them and regarding their cohesion"
data[, 23] <- factor(data[, 23], levels=c("A1","A2","A3","A4"),labels=c("The first class (RelationSpouse) is more cohesive than the second one  (RelationParentChild)","The second class (RelationParentChild) is more cohesive than the first one  (RelationSpouse)","Both classes have quite similar cohesion.","I don't know."))
names(data)[23] <- "q_Spouse_Parent"

data[, 24] <- as.character(data[, 24])
attributes(data)$variable.labels[24] <- "Why did you pick that option? What was your rationale to answer this question?"
names(data)[24] <- "q3.2"

data[, 25] <- as.character(data[, 25])
attributes(data)$variable.labels[25] <- "What is your academic degree?"
data[, 25] <- factor(data[, 25], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("Undergraduate","Graduate","Graduate (Certified expert)","Graduate (Master)","Graduate (PhD)","No academic degree"))
names(data)[25] <- "q6"

data[, 26] <- as.numeric(data[, 26])
attributes(data)$variable.labels[26] <- "[Software developer] What is your job position?"
data[, 26] <- factor(data[, 26], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[26] <- "q7_SQ001"

data[, 27] <- as.numeric(data[, 27])
attributes(data)$variable.labels[27] <- "[System analyst] What is your job position?"
data[, 27] <- factor(data[, 27], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[27] <- "q7_SQ002"

data[, 28] <- as.numeric(data[, 28])
attributes(data)$variable.labels[28] <- "[Tester] What is your job position?"
data[, 28] <- factor(data[, 28], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[28] <- "q7_SQ003"

data[, 29] <- as.numeric(data[, 29])
attributes(data)$variable.labels[29] <- "[Software architect/designer] What is your job position?"
data[, 29] <- factor(data[, 29], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[29] <- "q7_SQ004"

data[, 30] <- as.numeric(data[, 30])
attributes(data)$variable.labels[30] <- "[Business analyst] What is your job position?"
data[, 30] <- factor(data[, 30], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[30] <- "q7_SQ005"

data[, 31] <- as.numeric(data[, 31])
attributes(data)$variable.labels[31] <- "[Project manager] What is your job position?"
data[, 31] <- factor(data[, 31], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[31] <- "q7_SQ006"

data[, 32] <- as.numeric(data[, 32])
attributes(data)$variable.labels[32] <- "[Professor/Lecturer] What is your job position?"
data[, 32] <- factor(data[, 32], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[32] <- "q7_SQ007"

data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[33] <- "[Researcher] What is your job position?"
data[, 33] <- factor(data[, 33], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[33] <- "q7_SQ008"

data[, 34] <- as.numeric(data[, 34])
attributes(data)$variable.labels[34] <- "[Student] What is your job position?"
data[, 34] <- factor(data[, 34], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[34] <- "q7_SQ009"

data[, 35] <- as.numeric(data[, 35])
attributes(data)$variable.labels[35] <- "[Unemployed or Retired] What is your job position?"
data[, 35] <- factor(data[, 35], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[35] <- "q7_SQ010"

data[, 36] <- as.character(data[, 36])
attributes(data)$variable.labels[36] <- "[Other] What is your job position?"
names(data)[36] <- "q7_other"

data[, 37] <- as.numeric(data[, 37])
attributes(data)$variable.labels[37] <- "[My programming experience.] On a scale from 1 (Very Unexperienced) to 10 (Very Experienced), how do you measure your programming experience?"
names(data)[37] <- "q8_SQ001"

data[, 38] <- as.numeric(data[, 38])
attributes(data)$variable.labels[38] <- "[How do you estimate your programming experience compared to your colleagues?] Related to your programming experience, please answer from 1 (Very Unexperienced) to 5 (Very Experienced):"
names(data)[38] <- "q9_SQ001"

data[, 39] <- as.numeric(data[, 39])
attributes(data)$variable.labels[39] <- "[How experienced are you with the Java programming language?] Related to your programming experience, please answer from 1 (Very Unexperienced) to 5 (Very Experienced):"
names(data)[39] <- "q9_SQ002"

data[, 40] <- as.numeric(data[, 40])
attributes(data)$variable.labels[40] <- "[How experienced are you with the object-oriented programming paradigm?] Related to your programming experience, please answer from 1 (Very Unexperienced) to 5 (Very Experienced):"
names(data)[40] <- "q9_SQ003"

data[, 41] <- as.numeric(data[, 41])
attributes(data)$variable.labels[41] <- "For how many years have you been programming?"
names(data)[41] <- "q10"

data[, 42] <- as.numeric(data[, 42])
attributes(data)$variable.labels[42] <- "For how many years have you been programming for large software projects, e.g. in a company?"
names(data)[42] <- "q11"

data[, 43] <- as.character(data[, 43])
attributes(data)$variable.labels[43] <- "Do you have any comments regarding this study? Feel free to ask, suggest or criticize anything you want. (Optional)"
names(data)[43] <- "q12"

