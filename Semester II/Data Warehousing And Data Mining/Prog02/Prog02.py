import pandas as pd
import sqlite3

def extract(file_path):
    print("Extracting data from CSV...")
    data = pd.read_csv(file_path)
    print("Data extracted successfully!")
    return data


def transform(data):
    print("Transforming data...")
    data.dropna(inplace=True)
    data['Full Name'] = data['First Name'] + " " + data['Last Name']
    data.rename(columns={'Age': 'Customer Age'}, inplace=True)
    print("Data transformed successfully!")
    return data

def load(data, db_name, table_name):
    print(f"Loading data into the database {db_name}...")
    conn = sqlite3.connect(db_name)
    data.to_sql(table_name, conn, if_exists='replace', index=False)
    conn.close()
    print(f"Data loaded successfully into the {table_name} table!")

def etl_process(file_path, db_name, table_name):
    raw_data = extract(file_path)
    transformed_data = transform(raw_data)
    load(transformed_data, db_name, table_name)

csv_file = "Prog02/customer_data.csv"  
database_name = "customer_data.db"
table_name = "customers"

etl_process(csv_file, database_name, table_name)