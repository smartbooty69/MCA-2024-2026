import pandas as pd
from sklearn.impute import SimpleImputer


def handle_missing_values():
    data = {'Age': [25, 30, None, 22, None], 'Salary': [50000, None, 60000, 58000, 62000]}
    df = pd.DataFrame(data)
    print("Original Data:\n", df)

    choice = input("Choose method:\n1) Drop rows with missing values\n2) Impute missing values with mean\nYour choice: ")

    if choice == '1':
        df_dropped = df.dropna()
        print("\nData after dropping missing values:\n", df_dropped)
    elif choice == '2':
        imputer = SimpleImputer(strategy='mean')
        df_imputed = df.copy()
        df_imputed[['Age', 'Salary']] = imputer.fit_transform(df_imputed[['Age', 'Salary']])
        print("\nData after imputing missing values:\n", df_imputed)
    else:
        print("Invalid choice.")


if __name__ == "__main__":
    handle_missing_values()


