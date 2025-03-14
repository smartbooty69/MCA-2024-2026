import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from imblearn.over_sampling import SMOTE
from imblearn.under_sampling import RandomUnderSampler

df = pd.read_csv("Prog04/sample_dataset.csv")
print("Initial Data:\n", df.head())


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
    
    print("Data balancing complete.")
else:
    print("Target column not found in dataset.")