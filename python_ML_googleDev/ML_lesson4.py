# -*- coding: utf-8 -*-
"""
Created on Sat Jun  4 22:29:03 2016

@author: bruno
"""

from sklearn import datasets

iris = datasets.load_iris()

X = iris.data 
y = iris.target

from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = .5)

from sklearn import tree
treeClf = tree.DecisionTreeClassifier()

treeClf.fit(X_train, y_train)
predictions = treeClf.predict(X_test)
print(predictions)

from sklearn.metrics import accuracy_score
print(accuracy_score(y_test, predictions))

from sklearn.neighbors import KNeighborsClassifier
knnClf = KNeighborsClassifier()
knnClf.fit(X_train, y_train)
predictions = knnClf.predict(X_test)
print(predictions)

print(accuracy_score(y_test, predictions))