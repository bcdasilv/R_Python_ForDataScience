#!/usr/bin/python

""" 
    This is the code to accompany the Lesson 1 (Naive Bayes) mini-project. 

    Use a Naive Bayes Classifier to identify emails by their authors
    
    authors and labels:
    Sara has label 0
    Chris has label 1
"""
    
import sys
from time import time
sys.path.append("../tools/")
from email_preprocess import preprocess


### features_train and features_test are the features for the training
### and testing datasets, respectively
### labels_train and labels_test are the corresponding item labels
features_train, features_test, labels_train, labels_test = preprocess()

#########################################################
### your code goes here ###
#from sklearn.naive_bayes import GaussianNB
#clf = GaussianNB()
#from sklearn.svm import SVC
#clf = SVC(kernel = "linear")
#clf = SVC(kernel = "rbf", C=10000)

from sklearn import tree
clf = tree.DecisionTreeClassifier(min_samples_split=40)

# tracking time
t0 = time()

#features_train2 = features_train[:len(features_train)/100]
#labels_train2 = labels_train[:len(labels_train)/100]
clf.fit(features_train, labels_train)
print "training time:", round(time()-t0, 3), "s"

t1 = time()
predictions = clf.predict(features_test)
print "prediction time:", round(time()-t1, 3), "s"

from sklearn.metrics import accuracy_score
print(accuracy_score(labels_test, predictions))

#print "10th email is: ", predictions[10]
#print "26th email is: ", predictions[26]
#print "50th email is: ", predictions[50]

#import numpy as np
#print "Chris has", np.count_nonzero(predictions == 1), "emails."
#########################################################


