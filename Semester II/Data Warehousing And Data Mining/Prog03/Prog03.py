import pandas as pd
from sklearn.preprocessing import KBinsDiscretizer

df = pd.read_csv('Prog03/data.csv')

df['binned_income'] = KBinsDiscretizer(n_bins=3, encode='ordinal').fit_transform(df[['income']])

df['age_category'] = df['age'].apply(lambda a: 'Child' if a < 18 else 'Adult' if a < 40 else 'Middle-aged' if a < 60 else 'Senior')

print(df[['income', 'name', 'binned_income', 'age', 'age_category']].head())
