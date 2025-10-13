import pandas as pd
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler


def main():
    data = {'Age': [25, 30, 22, 28, 35], 'Salary': [50000, 60000, 58000, 62000, 70000]}
    df = pd.DataFrame(data)

    scaler = StandardScaler()
    scaled_data = scaler.fit_transform(df)

    pca = PCA(n_components=2)
    pca_result = pca.fit_transform(scaled_data)

    print("Original Data:\n", df)
    print("\nPCA Result (2 components):\n", pca_result)


if __name__ == "__main__":
    main()


