import pandas as pd
import numpy as np
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.decomposition import PCA
from sklearn.model_selection import train_test_split
from imblearn.over_sampling import SMOTE
from imblearn.under_sampling import RandomUnderSampler
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv("sample_dataset.csv")
print("Initial Data:\n", df.head())

imputer = SimpleImputer(strategy='mean')
df[df.select_dtypes(include=['int64', 'float64']).columns] = imputer.fit_transform(df.select_dtypes(include=['int64', 'float64']))

df.drop_duplicates(inplace=True)

scaler = StandardScaler()
numeric_features = df.select_dtypes(include=['int64', 'float64'])
df[numeric_features.columns] = scaler.fit_transform(numeric_features)

categorical_features = df.select_dtypes(include=['object']).columns
one_hot_encoder = OneHotEncoder(sparse_output=False, drop='first')
df_encoded = pd.DataFrame(one_hot_encoder.fit_transform(df[categorical_features]))
df_encoded.columns = one_hot_encoder.get_feature_names_out(categorical_features)
df = df.drop(columns=categorical_features).reset_index(drop=True)
df = pd.concat([df, df_encoded], axis=1)

pca = PCA(n_components=min(5, df.shape[1]))
df_reduced = pca.fit_transform(df)

print("Reduced Data Shape:", df_reduced.shape)

feature = df[numeric_features.columns[0]]
bins = np.linspace(feature.min(), feature.max(), 4)
discretized_feature = np.digitize(feature, bins, right=True)
df['Discretized'] = discretized_feature

hierarchy_mapping = {1: 'low', 2: 'medium', 3: 'high'}
df['Concept_Hierarchy'] = df['Discretized'].map(hierarchy_mapping)

if 'target' in df.columns:
    X = df.drop(columns=['target'])
    y = df['target']
    
    sns.countplot(x=y)
    plt.title("Original Class Distribution")
    plt.show()
    
    smote = SMOTE()
    X_resampled, y_resampled = smote.fit_resample(X, y)
    sns.countplot(x=y_resampled)
    plt.title("Oversampled Class Distribution")
    plt.show()
    
    undersampler = RandomUnderSampler()
    X_under, y_under = undersampler.fit_resample(X, y)
    sns.countplot(x=y_under)
    plt.title("Undersampled Class Distribution")
    plt.show()
    
    print("Preprocessing Complete.")
else:
    print("Target column not found in dataset.")
