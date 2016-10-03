## 1. Introduction to the data ##

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
%matplotlib inline

hollywood_movies = pd.read_csv("hollywood_movies.csv")

hollywood_movies.head(5)

hollywood_movies['exclude'].value_counts()

hollywood_movies = hollywood_movies.drop("exclude", axis=1)

## 2. Scatter plots - profitability and audience ratings ##

fig = plt.figure(figsize=(6,10))
ax1 = fig.add_subplot(2,1,1)
ax2 = fig.add_subplot(2,1,2)

ax1.set(xlabel='Profitability', ylabel='Audience Rating', title='Hollywood Movies, 2007-2011')
ax1.scatter(hollywood_movies['Profitability'], hollywood_movies['Audience Rating'])

ax2.set(xlabel='Profitability', ylabel='Profitability', title='Hollywood Movies, 2007-2011')
ax2.scatter(hollywood_movies['Audience Rating'], hollywood_movies['Profitability'])

plt.show()

## 3. Scatter matrix - profitability and critic ratings ##

from pandas.tools.plotting import scatter_matrix

normal_movies = hollywood_movies[hollywood_movies.Film != 'Paranormal Activity']
normal_movies_filtered = normal_movies[['Profitability','Audience Rating']]
scatter_matrix(normal_movies_filtered, figsize=(6, 6))

## 4. Box plot - audience and critic ratings ##

movies_filtered = normal_movies[['Critic Rating', 'Audience Rating']]
movies_filtered.plot(kind='box')

## 5. Box plot - critic vs audience ratings per year ##

fig = plt.figure(figsize=(8,4))
ax1 = fig.add_subplot(1,2,1)
ax2 = fig.add_subplot(1,2,2)

normal_movies = normal_movies.sort_values("Year")

sns.boxplot(data=normal_movies[pd.notnull(normal_movies["Genre"])], x="Year", y="Critic Rating", ax=ax1)

sns.boxplot(data=normal_movies[pd.notnull(normal_movies["Genre"])], x="Year", y="Audience Rating", ax=ax2)
plt.show()

## 6. Box plots - profitable vs unprofitable movies ##

def is_profitable(row):
    if row["Profitability"] <= 1.0:
        return False
    return True

normal_movies["Profitable"] = normal_movies.apply(is_profitable, axis=1)

print(normal_movies["Profitable"].value_counts())

fig = plt.figure(figsize=(12,6))
ax1 = fig.add_subplot(1,2,1)
ax2 = fig.add_subplot(1,2,2)

sns.boxplot(data=normal_movies, x="Profitable", y="Audience Rating", ax=ax1)
sns.boxplot(data=normal_movies, x="Profitable", y="Critic Rating", ax=ax2)

plt.show()