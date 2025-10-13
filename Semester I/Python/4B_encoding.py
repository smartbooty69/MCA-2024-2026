import pandas as pd
from sklearn.preprocessing import LabelEncoder


def categorical_encoding():
    data = {'Color': ['Red', 'Blue', 'Green', 'Blue', 'Red']}
    df = pd.DataFrame(data)
    print("Original Data:\n", df)

    choice = input("Choose encoding method:\n1) Label Encoding\n2) One-Hot Encoding\nYour choice: ")

    if choice == '1':
        label_encoder = LabelEncoder()
        df['Color_Label'] = label_encoder.fit_transform(df['Color'])
        print("\nLabel Encoded Data:\n", df)
    elif choice == '2':
        df_onehot = pd.get_dummies(df['Color'], prefix='Color')
        print("\nOne-Hot Encoded Data:\n", df_onehot)
    else:
        print("Invalid choice.")


if __name__ == "__main__":
    categorical_encoding()


