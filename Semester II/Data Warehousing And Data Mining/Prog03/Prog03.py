import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv('Data Warehousing And Data Mining\Prog03\dataset.csv')
print("Initial data shape:", df.shape)

print("\nLoaded data sample:")
print(df.head())

numeric_columns = df.select_dtypes(include=[np.number]).columns
categorical_columns = df.select_dtypes(include=['object']).columns

df[numeric_columns] = df[numeric_columns].fillna(df[numeric_columns].mean())
df[categorical_columns] = df[categorical_columns].fillna('Unknown')

print("\nData after handling missing values:")
print(df)

def remove_outliers(df, column):
    Q1 = df[column].quantile(0.25)
    Q3 = df[column].quantile(0.75)
    IQR = Q3 - Q1
    df = df[(df[column] >= Q1 - 1.5 * IQR) & (df[column] <= Q3 + 1.5 * IQR)]
    return df

for column in numeric_columns:
    df = remove_outliers(df, column)
    print(f"\nData after removing outliers from {column}:")
    print(df)
    plt.figure(figsize=(10, 6))
    sns.histplot(df[column], kde=True)
    plt.title(f'Data Distribution After Removing Outliers from {column}')
    plt.show()

for column in numeric_columns:
    df[column] = (df[column] - df[column].min()) / (df[column].max() - df[column].min())
    print(f"\nNormalization applied to {column}.")
    print(df)
    plt.figure(figsize=(10, 6))
    sns.histplot(df[column], kde=True)
    plt.title(f'Data Distribution After Normalization of {column}')
    plt.show()

print("\nFinal data shape:", df.shape)
print("\nSample of processed data:")
print(df.head())