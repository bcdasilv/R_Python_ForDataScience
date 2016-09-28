# -*- coding: utf-8 -*-
"""
Created on Thu Jul 28 20:29:05 2016

@author: bruno
"""
from scipy.spatial import distance
class ScrappyKNN():
    def fit(self, X_train, Y_train):
        self.X_train = X_train
        self.Y_train = Y_train
    
    def predict(self, X_test):
        predictions = []
        for row in X_test:
            label = self.closest(row)
            predictions.append(label)
        return predictions

    def eucDistance(self, a, b):
        return distance.euclidean(a,b)
        
    def closest(self, row):
        label = 0
        bestIndex = 0
        bestDist = self.eucDistance(row, self.X_train[0])
        for i in range(1, len(self.X_train)):
            xDist = self.eucDistance(row, self.X_train[i])
            if xDist < bestDist :
                bestDist = xDist
                bestIndex = i
                
        label = self.Y_train[bestIndex]
        return label

from sklearn import datasets

iris = datasets.load_iris()

X = iris.data 
y = iris.target

from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = .5)

#from sklearn import tree
#treeClf = tree.DecisionTreeClassifier()
ownClf = ScrappyKNN()
ownClf.fit(X_train, y_train)
predictions = ownClf.predict(X_test)
print(predictions)

from sklearn.metrics import accuracy_score
print(accuracy_score(y_test, predictions))

from sklearn.neighbors import KNeighborsClassifier
knnClf = KNeighborsClassifier()
knnClf.fit(X_train, y_train)
predictions = knnClf.predict(X_test)
print(predictions)

print(accuracy_score(y_test, predictions))