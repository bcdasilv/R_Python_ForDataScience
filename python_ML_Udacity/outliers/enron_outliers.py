#!/usr/bin/python

import pickle
import sys
import matplotlib.pyplot
sys.path.append("../tools/")
from feature_format import featureFormat, targetFeatureSplit


### read in data dictionary, convert to numpy array
data_dict = pickle.load( open("../final_project/final_project_dataset.pkl", "r") )

# identifying an outlier as a possible mistaken data preparation from a spreadsheet
for personName in data_dict :
    dictValues = data_dict[personName]
    if dictValues['salary'] != 'NaN' and dictValues['salary'] > 10000000:
        print personName, dictValues['salary'] 

#del data_dict['TOTAL']    
#OR
data_dict.pop('TOTAL', 0)

#identifying two outliers but not removed. They are essential and valid for the enron
#fraund detection. Two big bosses.
for personName in data_dict :
    dictValues = data_dict[personName]
    if dictValues['salary'] != 'NaN' and dictValues['salary'] > 1000000 and dictValues['bonus'] != 'NaN' and dictValues['bonus'] > 5000000:
        print personName


features = ["salary", "bonus"]
data = featureFormat(data_dict, features)


### your code below
for point in data:
    salary = point[0]
    bonus = point[1]
    matplotlib.pyplot.scatter( salary, bonus )

matplotlib.pyplot.xlabel("salary")
matplotlib.pyplot.ylabel("bonus")
matplotlib.pyplot.show()


