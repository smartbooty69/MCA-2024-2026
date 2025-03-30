import pandas as pd, numpy as np, matplotlib.pyplot as plt, seaborn as sns
from sklearn.datasets import load_iris
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import confusion_matrix

iris = load_iris()
df = pd.DataFrame(iris.data, columns=iris.feature_names)
df_scaled = StandardScaler().fit_transform(df)

kmeans = KMeans(n_clusters=3, random_state=42, n_init=10).fit(df_scaled)
df['Cluster'] = kmeans.labels_

plt.figure(figsize=(8, 6))
sns.scatterplot(x=df.iloc[:, 0], y=df.iloc[:, 1], hue=df['Cluster'], palette='viridis', s=100)
plt.scatter(*kmeans.cluster_centers_[:, :2].T, c='red', s=200, marker='X', label='Centroids')
plt.title("K-Means Clustering on Iris"); plt.xlabel('Sepal Length'); plt.ylabel('Sepal Width'); plt.legend(); plt.show()

sns.heatmap(confusion_matrix(iris.target, kmeans.labels_), annot=True, fmt='d', cmap='Blues',
            xticklabels=iris.target_names, yticklabels=iris.target_names)
plt.title('Confusion Matrix'); plt.xlabel('Predicted Clusters'); plt.ylabel('True Labels'); plt.show()
