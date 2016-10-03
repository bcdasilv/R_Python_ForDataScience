## 4. Practice: histograms ##

recent_grads.hist(column='Sample_size', bins=50)

## 7. Practice: box plots ##

recent_grads[['Sample_size', 'Major_category']].boxplot(by='Major_category')
plt.xticks(rotation=90)

recent_grads[['Total', 'Major_category']].boxplot(by='Major_category')
plt.xticks(rotation=90)

## 9. Practice: multiple plots in one chart ##

plt.scatter(recent_grads['Unemployment_rate'], recent_grads['P25th'], color='red')
plt.scatter(recent_grads['ShareWomen'], recent_grads['P25th'], color='blue')
plt.show()