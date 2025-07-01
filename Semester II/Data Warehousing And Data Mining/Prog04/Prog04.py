from imblearn.over_sampling import SMOTE
from sklearn.datasets import make_classification
from collections import Counter

X, Y = make_classification(n_samples=1000, weights=[0.9, 0.1], n_features=4, random_state=42)
print("Before:", Counter(Y))

X_res, Y_res = SMOTE().fit_resample(X, Y)
print("After :", Counter(Y_res))