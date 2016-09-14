#!/usr/bin/python

import sys
import pickle
sys.path.append("../tools/")

from feature_format import featureFormat, targetFeatureSplit
from tester import dump_classifier_and_data

### Task 1: Select what features you'll use.
### features_list is a list of strings, each of which is a feature name.
### The first feature must be "poi".
#features_list = ['poi','salary'] # You will need to use more features
features_list = ['poi', 'salary',
 'total_payments',
 'exercised_stock_options',
 'bonus',
 'restricted_stock',
 'shared_receipt_with_poi',
 'restricted_stock_deferred',
 'total_stock_value',
 'expenses',
 'loan_advances',
 'from_this_person_to_poi',
 'from_poi_to_this_person',
 'director_fees',
 'deferred_income',
 'long_term_incentive']

### Load the dictionary containing the dataset
with open("final_project_dataset.pkl", "r") as data_file:
    data_dict = pickle.load(data_file)

### Task 2: Remove outliers
### Task 3: Create new feature(s)
### Store to my_dataset for easy export below.
my_dataset = data_dict

### Extract features and labels from dataset for local testing
data = featureFormat(my_dataset, features_list, sort_keys = True)
labels, features = targetFeatureSplit(data)

### Task 4: Try a varity of classifiers
### Please name your classifier clf for easy export below.
### Note that if you want to do PCA or other multi-stage operations,
### you'll need to use Pipelines. For more info:
### http://scikit-learn.org/stable/modules/pipeline.html

# Provided to give you a starting point. Try a variety of classifiers.
#from sklearn.naive_bayes import GaussianNB
#clf = GaussianNB()

#from sklearn.tree import DecisionTreeClassifier
#clf = DecisionTreeClassifier()
"""
from sklearn.decomposition import PCA
pca = PCA(n_components=5)
pca.fit(features)

print pca.explained_variance_ratio_
for pc in pca.components_:
    print pc
"""
from sklearn.decomposition import PCA
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC
from sklearn.tree import DecisionTreeClassifier
from sklearn.pipeline import Pipeline
estimators1 = [('reduce_dim', PCA(n_components=10)), ('Naive Bayes', GaussianNB())]
estimators2 = [('reduce_dim', PCA(n_components=10)), ('SVM', SVC())]
estimators3 = [('reduce_dim', PCA(n_components=10)), ('Decision Tree', DecisionTreeClassifier())]


clf = Pipeline(estimators1)

### Task 5: Tune your classifier to achieve better than .3 precision and recall 
### using our testing script. Check the tester.py script in the final project
### folder for details on the evaluation method, especially the test_classifier
### function. Because of the small size of the dataset, the script uses
### stratified shuffle split cross validation. For more info: 
### http://scikit-learn.org/stable/modules/generated/sklearn.cross_validation.StratifiedShuffleSplit.html

# Example starting point. Try investigating other evaluation techniques!
from sklearn.cross_validation import train_test_split
features_train, features_test, labels_train, labels_test = \
    train_test_split(features, labels, test_size=0.3, random_state=42)

### Task 6: Dump your classifier, dataset, and features_list so anyone can
### check your results. You do not need to change anything below, but make sure
### that the version of poi_id.py that you submit can be run on its own and
### generates the necessary .pkl files for validating your results.

dump_classifier_and_data(clf, my_dataset, features_list)

"""
Logging the results after running tester.py

Pipeline(steps=[('reduce_dim', PCA(copy=True, n_components=10, whiten=False)), ('Naive Bayes', GaussianNB())])
        Accuracy: 0.86153       Precision: 0.47435      Recall: 0.35600 F1: 0.40674     F2: 0.37470
        Total predictions: 15000        True positives:  712    False positives:  789   False negatives: 1288   True negatives: 12211
        
Pipeline(steps=[('reduce_dim', PCA(copy=True, n_components=None, whiten=False)), ('Naive Bayes', GaussianNB())])
        Accuracy: 0.84320       Precision: 0.38406      Recall: 0.29150 F1: 0.33144     F2: 0.30626
        Total predictions: 15000        True positives:  583    False positives:  935   False negatives: 1417   True negatives: 12065

Pipeline(steps=[('reduce_dim', PCA(copy=True, n_components=5, whiten=False)), ('Naive Bayes', GaussianNB())])
        Accuracy: 0.84960       Precision: 0.40123      Recall: 0.26000 F1: 0.31553     F2: 0.27969
        Total predictions: 15000        True positives:  520    False positives:  776   False negatives: 1480   True negatives: 12224

Pipeline(steps=[('reduce_dim', PCA(copy=True, n_components=3, whiten=False)), ('Naive Bayes', GaussianNB())])
        Accuracy: 0.86200       Precision: 0.47078      Recall: 0.28200 F1: 0.35272     F2: 0.30659
        Total predictions: 15000        True positives:  564    False positives:  634   False negatives: 1436   True negatives: 12366
        
Pipeline(steps=[('reduce_dim', PCA(copy=True, n_components=5, whiten=False)), ('Decision Tree', DecisionTreeClassifier(class_weight=None, criterion='gini', max_depth=None,
            max_features=None, max_leaf_nodes=None, min_samples_leaf=1,
            min_samples_split=2, min_weight_fraction_leaf=0.0,
            presort=False, random_state=None, splitter='best'))])
        Accuracy: 0.80493       Precision: 0.24448      Recall: 0.22150 F1: 0.23242     F2: 0.22574
        Total predictions: 15000        True positives:  443    False positives: 1369   False negatives: 1557   True negatives: 11631     
"""