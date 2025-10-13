from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.neighbors import KNeighborsClassifier


def main():
    iris = load_iris()
    X, y = iris.data, iris.target

    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.3, random_state=0
    )

    log_reg = LogisticRegression(max_iter=200)
    log_reg.fit(X_train, y_train)
    print("Logistic Regression Accuracy:", log_reg.score(X_test, y_test))

    knn = KNeighborsClassifier(n_neighbors=5)
    knn.fit(X_train, y_train)
    print("k-NN Accuracy:", knn.score(X_test, y_test))


if __name__ == "__main__":
    main()


