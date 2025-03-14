import pandas as pd
import numpy as np

data = {
    'Age': [22, 25, 47, 35, 46, 23, 34, 29, 50, 60],
    'Income': [15000, 18000, 25000, 30000, 32000, 20000, 27000, 22000, 40000, 50000]
}

df = pd.DataFrame(data)

def discretize_data(df, column, bins, labels):
    df[column + '_discretized'] = pd.cut(df[column], bins=bins, labels=labels)
    return df

def generate_concept_hierarchy(df, column):
    hierarchy = df[column].value_counts().reset_index()
    hierarchy.columns = [column, 'Count']
    return hierarchy

age_bins = [0, 18, 35, 50, 100]
age_labels = ['Child', 'Young Adult', 'Adult', 'Senior']
df = discretize_data(df, 'Age', age_bins, age_labels)

income_bins = [0, 20000, 30000, 40000, 60000]
income_labels = ['Low', 'Medium', 'High', 'Very High']
df = discretize_data(df, 'Income', income_bins, income_labels)

age_hierarchy = generate_concept_hierarchy(df, 'Age_discretized')

income_hierarchy = generate_concept_hierarchy(df, 'Income_discretized')

print("Original DataFrame:")
print(df)
print("\nAge Concept Hierarchy:")
print(age_hierarchy)
print("\nIncome Concept Hierarchy:")
print(income_hierarchy)