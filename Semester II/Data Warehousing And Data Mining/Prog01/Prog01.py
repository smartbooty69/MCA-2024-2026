import pandas as pd
from sqlalchemy import create_engine

def extract_data():
    sales_data = pd.read_csv('Data Warehousing And Data Mining\Prog01\sales.csv')
    customer_data = pd.DataFrame({
        'CustomerID': [1, 2, 3],
        'Name': ['Alice', 'Bob', 'Charlie'],
        'Country': ['USA', 'UK', 'Canada']
    })
    return sales_data, customer_data

def transform_data(sales_data, customer_data):
    sales_data.fillna(0, inplace=True)
    customer_data.columns = ['customer_id', 'name', 'country']
    # Add a Total Sales column
    sales_data['Total Sales'] = sales_data['Quantity'] * sales_data['Price']
    return sales_data, customer_data

def load_data(sales_data, customer_data):
    engine = create_engine('sqlite:///data_warehouse.db')
    sales_data.to_sql('sales', engine, if_exists='replace', index=False)
    customer_data.to_sql('customers', engine, if_exists='replace', index=False)
    print("Data successfully loaded into the warehouse.")

if __name__ == "__main__":
    sales_data, customer_data = extract_data()
    sales_data, customer_data = transform_data(sales_data, customer_data)
    load_data(sales_data, customer_data)

    # Check the columns of sales_data
    print("Sales Data Columns:", sales_data.columns)

    # Create a pivot table with the new 'Total Sales' column
    pivot_data = sales_data.pivot_table(
        index='Location', columns='Time', values='Total Sales', aggfunc='sum'
    )
    print(pivot_data)
