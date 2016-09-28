# -*- coding: utf-8 -*-
"""
Created on Wed Jun  1 14:06:56 2016

@author: bruno
"""
import numpy as np
from sklearn.datasets import load_iris
from sklearn import tree

iris= load_iris()

#features (their like fields or attributes... or variables representing measurements)
print(iris.feature_names)
# targes are actually the labels representing a category (group)
print(iris.target_names)

#some data
print("\n Some data:")
print(iris.data[0], " -> ", iris.target[0])
print(iris.data[5], " -> ", iris.target[5])
print(iris.data[10], " -> ", iris.target[10])

## all dataset
#print("\n All dataset:")
#for i in range(len(iris.target)):
#    print(iris.data[i], " -> ", iris.target[i])
    

def getLabel(targetValue):
    if (targetValue == 0):
        return "setosa"
    elif (targetValue == 1):
        return "versicolor"
    elif (targetValue == 2):
        return "virginica"
    else:
        return "invalid"

def getLabelBetter(targetValue):
    return iris.target_names[targetValue]
    
# all dataset
print("\n All dataset:")
for i in range(len(iris.target)):
    print(iris.data[i], " -> ", getLabelBetter(iris.target[i]))


##### Now sepataring the test data and trainning data
test_idx = [0, 50, 100]

train_target = np.delete(iris.target, test_idx)
train_data = np.delete(iris.data, test_idx, axis=0)

test_target = iris.target[test_idx]
test_data = iris.data[test_idx]

#printting our test dataset
print("\n Our test data:")
for i in range(len(test_target)):
    print(test_data[i], " -> ", getLabelBetter(test_target[i]))


##### Defining a classifier and training it 
clf = tree.DecisionTreeClassifier()
clf.fit(train_data, train_target)


##### Showing what it predicts with our test data
print("\nPrediction of our test data:")
print(getLabelBetter(clf.predict(test_data)))

##### Now visualizing the classification tree
from sklearn.externals.six import StringIO
import pydot

dot_data = StringIO()
tree.export_graphviz(clf,
            out_file=dot_data,
            feature_names=iris.feature_names,
            class_names=iris.target_names,
            filled=True,
            rounded=True,
            impurity=False)
            
graph = pydot.graph_from_dot_data(dot_data.getvalue())
graph.write_pdf("iris.pdf")