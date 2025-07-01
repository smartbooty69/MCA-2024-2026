import pandas as pd
from mlxtend.frequent_patterns import apriori, fpgrowth, association_rules
from mlxtend.preprocessing import TransactionEncoder
import time

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

start = time.time()
apitems = apriori(df, min_support=0.1, use_colnames=True)
aprules = association_rules(apitems, metric="confidence", min_threshold=0.6)
print("\nApriori Itemsets:\n", apitems)
print("\nApriori Rules:\n", aprules)
print(f"Apriori Time: {time.time() - start:.4f} sec")

start = time.time()
fpitems = fpgrowth(df, min_support=0.1, use_colnames=True)
fprules = association_rules(fpitems, metric="confidence", min_threshold=0.6)
print("\nFP-Growth Itemsets:\n", fpitems)
print("\nFP-Growth Rules:\n", fprules)
print(f"FP-Growth Time: {time.time() - start:.4f} sec")
