import pandas as pd
import time

from mlxtend.frequent_patterns import apriori, fpgrowth, association_rules
from mlxtend.preprocessing import TransactionEncoder

dataset = [
    ['Milk', 'Bread', 'Butter'],
    ['Bread', 'Butter', 'Jam'],
    ['Milk', 'Bread', 'Butter', 'Jam'],
    ['Milk', 'Bread'],
    ['Butter', 'Jam']
]

te = TransactionEncoder()
te_data = te.fit(dataset).transform(dataset)
df = pd.DataFrame(te_data, columns=te.columns_)

fp_growth_result = fpgrowth(df, min_support=0.4, use_colnames=True)
print("Frequent Itemsets using FP-Growth:")
print(fp_growth_result)

apriori_result = apriori(df, min_support=0.4, use_colnames=True)
print("\nFrequent Itemsets using Apriori:")
print(apriori_result)

start_fp = time.time()
fpgrowth(df, min_support=0.4, use_colnames=True)
end_fp = time.time()
fp_time = end_fp - start_fp

start_ap = time.time()
apriori(df, min_support=0.4, use_colnames=True)
end_ap = time.time()
ap_time = end_ap - start_ap

print(f"\nExecution Time:\nFP-Growth: {fp_time:.6f} sec\nApriori: {ap_time:.6f} sec")

rules_fp = association_rules(fp_growth_result, metric="confidence", min_threshold=0.5)
print("\nAssociation Rules using FP-Growth:")
print(rules_fp)

rules_ap = association_rules(apriori_result, metric="confidence", min_threshold=0.5)
print("\nAssociation Rules using Apriori:")
print(rules_ap)
