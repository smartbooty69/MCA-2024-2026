import pandas as pd
from sklearn.preprocessing import MinMaxScaler

df1 = pd.read_csv('Prog02/dataset1.csv').dropna()
df2 = pd.read_csv('Prog02/dataset2.csv').ffill()
df = pd.merge(df1, df2, on='ID')

cols = ['value1', 'value2']
df[cols] = MinMaxScaler().fit_transform(df[cols])

print(df[['ID', 'value1']].head())
