import pandas as pd
import numpy as np


def main():
    while True:
        print("\n--- Pandas DataFrame Handling Menu ---")
        print("1. Create DataFrame")
        print("2. Handle Missing Values")
        print("3. Filter Data (Age > 25)")
        print("4. Sort by Score")
        print("5. Exit")

        choice = input("Enter your choice (1-5): ")

        data = {'Name': ['Alice', 'Bob', 'Charlie', None],
                'Age': [25, 30, np.nan, 22],
                'Score': [85, 90, 88, 95]}
        df = pd.DataFrame(data)

        if choice == '1':
            print("DataFrame:\n", df)

        elif choice == '2':
            df_filled = df.fillna({'Name': 'Unknown', 'Age': df['Age'].mean()})
            print("After handling missing values:\n", df_filled)

        elif choice == '3':
            print("Filtered Data (Age > 25):\n", df[df['Age'] > 25])

        elif choice == '4':
            print("Sorted by Score:\n", df.sort_values(by='Score'))

        elif choice == '5':
            print("Exiting DataFrame Menu.")
            break
        else:
            print("Invalid input. Try again.")


if __name__ == "__main__":
    main()


