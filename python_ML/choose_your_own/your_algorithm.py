#!/usr/bin/python

import matplotlib.pyplot as plt
from prep_terrain_data import makeTerrainData
from class_vis import prettyPicture

features_train, labels_train, features_test, labels_test = makeTerrainData()


### the training data (features_train, labels_train) have both "fast" and "slow"
### points mixed together--separate them so we can give them different colors
### in the scatterplot and identify them visually
grade_fast = [features_train[ii][0] for ii in range(0, len(features_train)) if labels_train[ii]==0]
bumpy_fast = [features_train[ii][1] for ii in range(0, len(features_train)) if labels_train[ii]==0]
grade_slow = [features_train[ii][0] for ii in range(0, len(features_train)) if labels_train[ii]==1]
bumpy_slow = [features_train[ii][1] for ii in range(0, len(features_train)) if labels_train[ii]==1]


#### initial visualization
plt.xlim(0.0, 1.0)
plt.ylim(0.0, 1.0)
plt.scatter(bumpy_fast, grade_fast, color = "b", label="fast")
plt.scatter(grade_slow, bumpy_slow, color = "r", label="slow")
plt.legend()
plt.xlabel("bumpiness")
plt.ylabel("grade")
plt.show()
################################################################################


### your code here!  name your classifier object clf if you want the 
### visualization code (prettyPicture) to show you the decision boundary

from sklearn import tree
clfTree = tree.DecisionTreeClassifier(min_samples_split=40)
clfTree = clfTree.fit(features_train,labels_train)

from sklearn.svm import SVC
#clfSVM = SVC(kernel = "linear")
clfSVM = SVC(kernel = "rbf", C=100000)
clfSVM = clfSVM.fit(features_train, labels_train)

from sklearn.naive_bayes import GaussianNB
clfNB = GaussianNB()
clfNB.fit(features_train, labels_train)

from sklearn.neighbors import KNeighborsClassifier
clfKNN = KNeighborsClassifier(n_neighbors=20)
clfKNN.fit(features_train, labels_train)

from sklearn.ensemble import RandomForestClassifier
clfRF = RandomForestClassifier()
clfRF = clfRF.fit(features_train, labels_train)

from sklearn.ensemble import AdaBoostClassifier
clfAda = AdaBoostClassifier()
clfAda = clfAda.fit(features_train, labels_train)

#===
predictionsTree = clfTree.predict(features_test)
predictionsSVM = clfSVM.predict(features_test)
predictionsNB = clfNB.predict(features_test)
predictionsKNN = clfKNN.predict(features_test)
predictionsRF = clfRF.predict(features_test)
predictionsAda = clfAda.predict(features_test)

#===
from sklearn.metrics import accuracy_score
accuracyTree = accuracy_score(labels_test, predictionsTree)
print "Accuracy Tree:", accuracyTree
accuracySVM = accuracy_score(labels_test, predictionsSVM)
print "Accuracy SVM:", accuracySVM
accuracyNB = accuracy_score(labels_test, predictionsNB)
print "Accuracy NB:", accuracyNB
accuracyKNN = accuracy_score(labels_test, predictionsKNN)
print "Accuracy KNN:", accuracyKNN
accuracyRF = accuracy_score(labels_test, predictionsRF)
print "Accuracy RF:", accuracyRF
accuracyAda = accuracy_score(labels_test, predictionsAda)
print "Accuracy Ada:", accuracyAda


try:
    prettyPicture(clfAda, features_test, labels_test)
except NameError:
    pass


