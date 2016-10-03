## 3. Seaborn styling ##

import seaborn as sns


births.hist('agepreg')

## 6. Practice: customizing distplot() ##

sns.set_style("dark")
sns.distplot(births['birthord'], kde=False, axlabel='Birth number')
sns.plt.show()

## 7. Boxplots: boxplot() ##

births = pd.read_csv('births.csv')

sns.boxplot(x=births['birthord'], y=births['agepreg'])
sns.plt.show()

## 8. Pair plot: pairplot() ##

sns.pairplot(births[['agepreg', 'prglngth','birthord']])
sns.plt.show()