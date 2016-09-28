#!/usr/bin/python 

""" 
    Skeleton code for k-means clustering mini-project.
"""




import pickle
import numpy
import matplotlib.pyplot as plt
import sys
sys.path.append("../tools/")
from feature_format import featureFormat, targetFeatureSplit




def Draw(pred, features, poi, mark_poi=False, name="image.png", f1_name="feature 1", f2_name="feature 2", f3_name="feature 3"):
    """ some plotting code designed to help you visualize your clusters """

    ### plot each cluster with a different color--add more colors for
    ### drawing more than five clusters
    colors = ["b", "c", "k", "m", "g"]
    for ii, pp in enumerate(pred):
        plt.scatter(features[ii][0], features[ii][1], color = colors[pred[ii]])

    ### if you like, place red stars over points that are POIs (just for funsies)
    if mark_poi:
        for ii, pp in enumerate(pred):
            if poi[ii]:
                plt.scatter(features[ii][0], features[ii][1], color="r", marker="*")
    plt.xlabel(f1_name)
    plt.ylabel(f2_name)
    plt.savefig(name)
    plt.show()



### load in the dict of dicts containing all the data on each person in the dataset
data_dict = pickle.load( open("../final_project/final_project_dataset.pkl", "r") )
### there's an outlier--remove it! 
data_dict.pop("TOTAL", 0)


### the input features we want to use 
### can be any key in the person-level dictionary (salary, director_fees, etc.) 
feature_1 = "salary"
feature_2 = "exercised_stock_options"
feature_3 = "total_payments"
poi  = "poi"
#features_list = [poi, feature_1, feature_2, feature_3]
features_list = [poi, feature_1, feature_2]
data = featureFormat(data_dict, features_list )
poi, finance_features = targetFeatureSplit( data )


### in the "clustering with 3 features" part of the mini-project,
### you'll want to change this line to 
### for f1, f2, f3 in finance_features:
### (as it's currently written, the line below assumes 2 features)
for f1, f2 in finance_features:
    plt.scatter( f1, f2 )
plt.show()

### cluster here; create predictions of the cluster labels
### for the data and store them to a list called pred
from sklearn import cluster

clf = cluster.KMeans(n_clusters = 2)
#clf = clf.fit(finance_features)
pred = clf.fit_predict(finance_features)

min = data_dict["STABLER FRANK"]["salary"]
max = 0
for elem in data_dict: 
    if data_dict[elem]["salary"] != "NaN" and data_dict[elem]["salary"] < min :
        min = data_dict[elem]["salary"]
    if data_dict[elem]["salary"] != "NaN" and data_dict[elem]["salary"] > max :
        max = data_dict[elem]["salary"]
    
print min
print max

## Feature scaling lesson
""" What would be the rescaled value of a "salary" feature that had an original
 value of $200,000, and an "exercised_stock_options" feature of $1 million? 
 (Be sure to represent these numbers as floats, not integers!)
"""
# For salary
# min = 477
# max = 1111258
# 200,000 rescaled is 200000 - 477 / 1111258 - 477
# which is 199523 / 1110781 = 0.179

min = data_dict["STABLER FRANK"]["exercised_stock_options"]
max = 0
for elem in data_dict: 
    if data_dict[elem]["exercised_stock_options"] != "NaN" and data_dict[elem]["exercised_stock_options"] < min :
        min = data_dict[elem]["exercised_stock_options"]
    if data_dict[elem]["exercised_stock_options"] != "NaN" and data_dict[elem]["exercised_stock_options"] > max :
        max = data_dict[elem]["exercised_stock_options"]
    
print min
print max

# For exercised stock options
# min = 3285
# max = 34348384
# 1000000 rescaled is 1000000 - 3285 / 34348384 - 3285
# which is 996715 / 34345099 = 0.029


### rename the "name" parameter when you change the number of features
### so that the figure gets saved to a different file
try:
    Draw(pred, finance_features, poi, mark_poi=False, name="clusters.pdf", f1_name=feature_1, f2_name=feature_2, f3_name=feature_3)
except NameError:
    print "no predictions object named pred found, no clusters to plot"
