## 2. Array comparisons ##

import numpy as np

countries_canada = world_alcohol[:,2]=="Canada" 

years_1984 = world_alcohol[:,0] == "1984"

## 3. Selecting elements ##

country_is_algeria = world_alcohol[:,2] == "Algeria"
country_algeria = world_alcohol[country_is_algeria]

## 4. Comparisons with multiple conditions ##

is_algeria_and_1986 = (world_alcohol[:,0] == "1986") & (world_alcohol[:,2] == "Algeria")
rows_with_algeria_and_1986 = world_alcohol[is_algeria_and_1986]

## 5. Replacing values ##

rows_1986 = world_alcohol[:,0] == "1986"
world_alcohol[rows_1986,0] = "2014"

rows_wine = world_alcohol[:,3] == "Wine"
world_alcohol[rows_wine,3] = "Grog"

## 6. Replacing empty strings ##

is_value_empty = world_alcohol[:,4] == ''
world_alcohol[is_value_empty,4] = 0

## 7. Converting data types ##

alcohol_consumption = world_alcohol[:,4]
alcohol_consumption = alcohol_consumption.astype(float)

## 8. Computing with NumPy ##

total_alcohol = alcohol_consumption.sum()
average_alcohol = alcohol_consumption.mean()

## 9. Total alcohol consumption in a year ##

is_canada_1986 = (world_alcohol[:,2] == "Canada") & (world_alcohol[:,0] == '1986')
canada_1986 = world_alcohol[is_canada_1986,:]
canada_alcohol = canada_1986[:,4]
empty_strings = canada_alcohol == ''
canada_alcohol[empty_strings] = "0"
canada_alcohol = canada_alcohol.astype(float)
total_canadian_drinking = canada_alcohol.sum()

## 10. Calculating consumption for each country ##

totals = {}

year = world_alcohol[:,0] == "1989"

for c in countries:
    country_year = (world_alcohol[:,2] == c) & (year)
    country_consumption = world_alcohol[country_year,:]
    country_alcohol = country_consumption[:,4]
    empty_strings = country_alcohol == ''
    country_alcohol[empty_strings] == "0"
    country_alcohol = country_alcohol.astype(float)
    total = country_alcohol.sum()
    totals[c] = total
    


## 11. Finding the country that drinks the most ##

highest_value = 0
highest_key = None
for c in totals:
    if totals[c] > highest_value:
        highest_value = totals[c]
        highest_key = c