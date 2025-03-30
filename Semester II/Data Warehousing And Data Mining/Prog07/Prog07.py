import pandas as pd
from mlxtend.frequent_patterns import apriori, fpgrowth, association_rules

data = {"Milk": [1, 0, 1, 1, 0],
        "Bread": [1, 1, 0, 1, 1],
        "Butter": [0, 1, 1, 1, 0]}

df = pd.DataFrame(data, dtype=bool)

apriori_items = apriori(df, min_support=0.1, use_colnames=True)
apriori_rules = association_rules(apriori_items, metric="confidence", min_threshold=0.6)

fp_growth_items = fpgrowth(df, min_support=0.1, use_colnames=True)
fp_growth_rules = association_rules(fp_growth_items, metric="confidence", min_threshold=0.6)

print("Apriori Frequent Itemsets:\n", apriori_items)
print("\nApriori Association Rules:\n", apriori_rules[['antecedents', 'consequents', 'lift']])

print("\nFP-Growth Frequent Itemsets:\n", fp_growth_items)
print("\nFP-Growth Association Rules:\n", fp_growth_rules[['antecedents', 'consequents', 'lift']])
