import pandas as pd
from sklearn.preprocessing import MinMaxScaler, StandardScaler


def scaling_techniques():
    data = {'Age': [25, 30, 22, 28, 35], 'Salary': [50000, 60000, 58000, 62000, 70000]}
    df = pd.DataFrame(data)
    print("Original Data:\n", df)

    choice = input("Choose scaling technique:\n1) Min-Max Scaling\n2) Standardization\nYour choice: ")

    if choice == '1':
        scaler = MinMaxScaler()
        df_scaled = df.copy()
        df_scaled[['Age', 'Salary']] = scaler.fit_transform(df_scaled[['Age', 'Salary']])
        print("\nMin-Max Scaled Data:\n", df_scaled)
    elif choice == '2':
        scaler = StandardScaler()
        df_scaled = df.copy()
        df_scaled[['Age', 'Salary']] = scaler.fit_transform(df_scaled[['Age', 'Salary']])
        print("\nStandardized Data:\n", df_scaled)
    else:
        print("Invalid choice.")


if __name__ == "__main__":
    scaling_techniques()


