import pandas as pd
from mlxtend.frequent_patterns import apriori, fpgrowth, association_rules
import time

df = pd.DataFrame({
    "Milk":   [1, 0, 1, 1, 0],
    "Bread":  [1, 1, 0, 1, 1],
    "Butter": [0, 1, 1, 1, 0]
}, dtype=bool)

start = time.time()
ap_items = apriori(df, min_support=0.1, use_colnames=True)
ap_rules = association_rules(ap_items, metric="confidence", min_threshold=0.6)
print("\nApriori Itemsets:\n", ap_items)
print("\nApriori Rules:\n", ap_rules[['antecedents', 'consequents', 'lift']])
print(f"Apriori Time: {time.time() - start:.4f} sec")

start = time.time()
fp_items = fpgrowth(df, min_support=0.1, use_colnames=True)
fp_rules = association_rules(fp_items, metric="confidence", min_threshold=0.6)
print("\nFP-Growth Itemsets:\n", fp_items)
print("\nFP-Growth Rules:\n", fp_rules[['antecedents', 'consequents', 'lift']])
print(f"FP-Growth Time: {time.time() - start:.4f} sec")
