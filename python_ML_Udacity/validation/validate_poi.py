#!/usr/bin/python


"""
    Starter code for the validation mini-project.
    The first step toward building your POI identifier!

    Start by loading/formatting the data

    After that, it's not our code anymore--it's yours!
"""

import pickle
import sys
sys.path.append("../tools/")
from feature_format import featureFormat, targetFeatureSplit

data_dict = pickle.load(open("../final_project/final_project_dataset.pkl", "r") )

### first element is our labels, any added elements are predictor
### features. Keep this the same for the mini-project, but you'll
### have a different feature list when you do the final project.
features_list = ["poi", "salary"]

data = featureFormat(data_dict, features_list)
labels, features = targetFeatureSplit(data)

### it's all yours from here forward!  
from sklearn import tree
clf = tree.DecisionTreeClassifier()

from sklearn import cross_validation
features_train, features_test, labels_train, labels_test = cross_validation.train_test_split(features, labels, test_size=0.3, random_state=42)

clf.fit(features_train, labels_train)
predictions = clf.predict(features_test)

from sklearn.metrics import accuracy_score
print('Accurracy score by spltting 30%', accuracy_score(labels_test, predictions))



#now, 10-fold cross validation
# this was not instructed by udacity course. Made by myself.
from sklearn.cross_validation import KFold
kf = KFold(len(features), n_folds=10)
for train, test in kf:
    features_train_fold = []    
    features_test_fold = []    
    labels_train_fold = []    
    labels_test_fold = []
    for i in train:
        features_train_fold.append(features[i])       
        labels_train_fold.append(labels[i])
    for i in test:
        features_test_fold.append(features[i])        
        labels_test_fold.append(labels[i])
        
    clf.fit(features_train_fold, labels_train_fold)
    predictions = clf.predict(features_test_fold)
    print('Accurracy score using 10-fold CV', accuracy_score(labels_test_fold, predictions))
    