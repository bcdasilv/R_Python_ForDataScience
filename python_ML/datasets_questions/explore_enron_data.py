#!/usr/bin/python

""" 
    Starter code for exploring the Enron dataset (emails + finances);
    loads up the dataset (pickled dict of dicts).

    The dataset has the form:
    enron_data["LASTNAME FIRSTNAME MIDDLEINITIAL"] = { features_dict }

    {features_dict} is a dictionary of features associated with that person.
    You should explore features_dict as part of the mini-project,
    but here's an example to get you started:

    enron_data["SKILLING JEFFREY K"]["bonus"] = 5600000
    
"""

import pickle

enron_data = pickle.load(open("../final_project/final_project_dataset.pkl", "r"))
print len(enron_data), 'people (i.e. #of keys)'
# or len(enron_data.keys())

print len(enron_data[enron_data.keys()[0]]), 'people (i.e. #of values for each key)'
#print len(enron_data[0]), 'features (i.e. #of columns)'

count = 0
for personName in enron_data :
    dictValues = enron_data[personName]
    for valueName in dictValues :
        if (valueName == 'poi' and dictValues[valueName] == True):
            count = count + 1
            print personName
            
print count

print enron_data['PRENTICE JAMES']['total_stock_value']

print enron_data['COLWELL WESLEY']['from_this_person_to_poi']

print enron_data['SKILLING JEFFREY K']['exercised_stock_options']

print enron_data['LAY KENNETH L']['total_payments']

print enron_data['SKILLING JEFFREY K']['total_payments']

print enron_data['FASTOW ANDREW S']['total_payments']

countPeopleWithEmail = 0
countPeopleWithSalary = 0
countPeopleWithoutTotalPayments = 0
for personName in enron_data :
    dictValues = enron_data[personName]
    for valueName in dictValues :
        if (valueName == 'salary' and dictValues[valueName] != 'NaN'):
            countPeopleWithSalary = countPeopleWithSalary + 1
        if (valueName == 'email_address' and dictValues[valueName] != 'NaN'):
            countPeopleWithEmail = countPeopleWithEmail + 1
        if (valueName == 'total_payments' and dictValues[valueName] == 'NaN'):
            countPeopleWithoutTotalPayments = countPeopleWithoutTotalPayments + 1            
            
print countPeopleWithSalary, 'people with salary.'
print countPeopleWithEmail, 'people with email.'
print countPeopleWithoutTotalPayments, 'people without total payments.'

# couting the number of POIs without total payments data
count = 0
isPOI = False
for personName in enron_data :
    dictValues = enron_data[personName]
    for valueName in dictValues :
        if (valueName == 'poi' and dictValues[valueName] == True):
            isPOI = True
        if (isPOI and valueName == 'total_payments' and dictValues[valueName] == 'NaN'):
            count = count + 1
    isPOI = False                  
print count
