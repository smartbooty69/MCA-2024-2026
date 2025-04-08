import pandas as pd
from mlxtend.preprocessing import TransactionEncoder
from mlxtend.frequent_patterns import apriori, association_rules

dataset = [
    ['milk', 'bread', 'nuts', 'apple'],
    ['milk', 'bread', 'nuts'],
    ['milk', 'bread'],
    ['milk', 'apple'],
    ['bread', 'nuts', 'apple'],
    ['milk', 'bread', 'apple'],
    ['bread', 'nuts'],
]

te = TransactionEncoder()
df = pd.DataFrame(te.fit(dataset).transform(dataset), columns=te.columns_)

items = apriori(df, min_support=0.3, use_colnames=True)

rules = association_rules(items, metric='lift', min_threshold=1.0)

print("Frequent Itemsets:\n", items)
print("\nAssociation Rules:\n", rules)
