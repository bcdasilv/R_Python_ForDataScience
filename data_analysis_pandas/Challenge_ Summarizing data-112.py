## 2. Introduction to the data ##

import pandas as pd
all_ages = pd.read_csv("all-ages.csv")
recent_grads = pd.read_csv("recent-grads.csv")
print(all_ages.head(5))
print(recent_grads.head(5))

## 3. Summarizing major categories ##

# Unique values in Major_category column.
print(all_ages['Major_category'].unique())

aa_cat_counts = dict()
rg_cat_counts = dict()
def calculate_major_cat_totals(df):
    cats = df['Major_category'].unique()
    counts_dictionary = dict()

    for c in cats:
        major_df = df[df["Major_category"] == c]
        total = major_df["Total"].sum()
        counts_dictionary[c] = total
    return counts_dictionary

aa_cat_counts = calculate_major_cat_totals(all_ages)
rg_cat_counts = calculate_major_cat_totals(recent_grads)

## 4. Low wage jobs rates ##

low_wage_percent = 0.0
low_wage_jobs_sum = recent_grads['Low_wage_jobs'].sum()
recent_grads_sum = recent_grads['Total'].sum()
low_wage_percent = low_wage_jobs_sum / recent_grads_sum
print(low_wage_percent)

## 5. Comparing datasets ##

# All majors, common to both DataFrames
majors = recent_grads['Major'].unique()

rg_lower_count = 0
for m in majors:
    recent_grads_row = recent_grads[recent_grads['Major'] == m]
    all_ages_row = all_ages[all_ages['Major'] == m]
    
    rg_unemp_rate = recent_grads_row.iloc[0]['Unemployment_rate']
    aa_unemp_rate = all_ages_row.iloc[0]['Unemployment_rate']
    
    if rg_unemp_rate < aa_unemp_rate:
        rg_lower_count += 1

print(rg_lower_count)