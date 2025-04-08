import pandas as pd
import sqlite3

csv = pd.read_csv('Prog01/data.csv')
json = pd.read_json('Prog01/data.json')
db = pd.read_sql("SELECT * FROM users", sqlite3.connect('Prog01/data.db'))

def clean(df):
    df = df.dropna()
    df = df.apply(lambda x: x.str.strip().str.lower() if x.dtype == "object" else x)
    return df.reset_index(drop=True)

csv, json, db = clean(csv), clean(json), clean(db)

pd.concat([csv, json, db]).to_csv('Prog01/data_warehouse.csv', index=False)
print("ETL done. Data saved to data_warehouse.csv")
