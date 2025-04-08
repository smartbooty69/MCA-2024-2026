import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.datasets import load_wine
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import confusion_matrix

wine = load_wine()
df = pd.DataFrame(wine.data, columns=wine.feature_names)

scaler = StandardScaler()
df_scaled = scaler.fit_transform(df)

kmeans = KMeans(n_clusters=3, random_state=42, n_init=10)
kmeans.fit(df_scaled)
df['Cluster'] = kmeans.labels_

plt.figure(figsize=(8, 6))
sns.scatterplot(x=df.iloc[:, 0], y=df.iloc[:, 1], hue=df['Cluster'], palette='viridis', s=100)
plt.scatter(*kmeans.cluster_centers_[:, :2].T, c='red', s=200, marker='X', label='Centroids')
plt.title("K-Means Clustering on Wine Dataset")
plt.xlabel(wine.feature_names[0])
plt.ylabel(wine.feature_names[1])
plt.legend()
plt.show()

conf_matrix = confusion_matrix(wine.target, kmeans.labels_)
sns.heatmap(conf_matrix, annot=True, fmt='d', cmap='Blues',
            xticklabels=[f"Cluster {i}" for i in range(3)],
            yticklabels=wine.target_names)
plt.title('Confusion Matrix')
plt.xlabel('Predicted Clusters')
plt.ylabel('True Labels')
plt.show()
