## 2. Lists of lists ##

import csv
f = open("world_alcohol.csv")
reader = csv.reader(f)
world_alcohol = list(reader)

years = []
for row in world_alcohol:
    years.append(row[0])

years = years[1:]

total = 0
for year in years:
    total = total + float(year)

avg_year = total / len(years)

## 4. Using NumPy ##


import numpy
world_alcohol = numpy.genfromtxt("world_alcohol.csv", delimiter=",")

## 5. Creating arrays ##


vector = numpy.array([10, 20, 30])
matrix = numpy.array([[5, 10, 15], [20, 25, 30], [35, 40, 45]])

## 6. Array shape ##

vector = numpy.array([10, 20, 30])
matrix = numpy.array([[5, 10, 15], [20, 25, 30], [35, 40, 45]])
vector_shape = vector.shape
matrix_shape = matrix.shape

## 7. Data types ##


world_alcohol_dtype = world_alcohol.dtype

## 9. Reading in the data properly ##


world_alcohol = numpy.genfromtxt("world_alcohol.csv", delimiter=",", dtype="U75", skip_header=1)
print(world_alcohol)

## 10. Indexing arrays ##


uruguay_other_1986 = world_alcohol[1,4]
third_country = world_alcohol[2,2]

## 11. Slicing arrays ##


countries = world_alcohol[:,2]
alcohol_consumption = world_alcohol[:,4]

## 12. Slicing one dimension ##


first_two_columns = world_alcohol[:,0:2]
first_ten_years = world_alcohol[0:10,0]
first_ten_rows = world_alcohol[0:10,:]

## 13. Slicing arrays ##


first_twenty_regions = world_alcohol[0:20,1:3]