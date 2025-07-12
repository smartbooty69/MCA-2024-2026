import numpy as np
from sklearn.datasets import make_classification
from sklearn.preprocessing import StandardScaler

class Adaline:
    def __init__(self, learning_rate=0.01, n_epochs=20):
        self.learning_rate = learning_rate
        self.n_epochs = n_epochs
        self.w_ = None
        self.b_ = None

    def fit(self, X, y):
        n_samples, n_features = X.shape
        self.w_ = np.random.randn(n_features)
        self.b_ = 0.0

        for epoch in range(self.n_epochs):
            output = np.dot(X, self.w_) + self.b_
            errors = y - output
            self.w_ += self.learning_rate * np.dot(errors, X)
            self.b_ += self.learning_rate * errors.sum()
            mse = (errors ** 2).mean()
            print(f"Epoch {epoch+1}/{self.n_epochs}, MSE: {mse:.4f}")

    def net_input(self, X):
        return np.dot(X, self.w_) + self.b_

    def predict(self, X):
        return np.where(self.net_input(X) >= 0.0, 1, -1)

if __name__ == "__main__":
    
    X, y = make_classification(n_samples=100, n_features=2, n_informative=2,
                               n_redundant=0, n_clusters_per_class=1, random_state=1)
    y = np.where(y == 0, -1, 1)  

    X = StandardScaler().fit_transform(X)
    
    model = Adaline(learning_rate=0.01, n_epochs=20)
    model.fit(X, y)

    preds = model.predict(X)
    print(preds) 