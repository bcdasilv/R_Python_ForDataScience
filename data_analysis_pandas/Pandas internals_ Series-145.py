## 1. Data structures ##

import pandas as pd

fandango = pd.read_csv("fandango_score_comparison.csv")
print(fandango.head(2))

## 2. Integer index ##

fandango = pd.read_csv('fandango_score_comparison.csv')

series_film = fandango["FILM"]
print(series_film[:5])

series_rt = fandango["RottenTomatoes"]
print(series_rt[:5])

## 3. Custom index ##

# Import the Series object from pandas
from pandas import Series

film_names = series_film.values
rt_scores = series_rt.values

series_custom = Series(index=film_names, data=rt_scores)

print("The RottenTomatoes scores for Minions (2015) and Leviathan (2014) are", series_custom[['Minions (2015)', 'Leviathan (2014)']])

## 4. Integer index preserved ##

series_custom = Series(rt_scores , index=film_names)
series_custom[['Minions (2015)', 'Leviathan (2014)']]

fiveten = series_custom[5:10]
print(fiveten)

## 5. Reindexing ##

original_index = series_custom.index.tolist()
changed_index = sorted(original_index)
sorted_by_index = series_custom.reindex(changed_index)

## 6. Sorting ##

sc2 = series_custom.sort_index()

sc3 = series_custom.sort_values()

print("First 10 sorted by index:\n",sc2[:10])
print("First 10 sorted by values:\n",sc3[:10])

## 7. Vectorized operations ##

#Normalizing each value to transform the scores to a 0 to 5 scale
series_normalized = series_custom/20

## 8. Comparing and filtering ##

criteria_one = series_custom > 50
criteria_two = series_custom < 75

both_criteria = series_custom[criteria_one & criteria_two]

## 9. Alignment ##

rt_critics = Series(fandango['RottenTomatoes'].values, index=fandango['FILM'])
rt_users = Series(fandango['RottenTomatoes_User'].values, index=fandango['FILM'])

rt_mean = (rt_critics + rt_users)/2