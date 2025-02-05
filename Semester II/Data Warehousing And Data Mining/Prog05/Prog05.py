from collections import defaultdict

def apriori(transactions, min_support):

    n = len(transactions)

    def count_support(candidates):
        counts = defaultdict(int)
        for transaction in transactions:
            for candidate in candidates:
                if candidate.issubset(transaction):  
                    counts[candidate] += 1
        return counts

    items = {item for transaction in transactions for item in transaction}
    L1 = {frozenset([item]): count for item, count in count_support([frozenset([item]) for item in items]).items() if count / n >= min_support}
    
    L = [L1]  
    k = 2
    while True:
        
        Ck = set()
        for itemset1 in L[k - 2]:
            for itemset2 in L[k - 2]:
                candidate = itemset1 | itemset2
                if len(candidate) == k:
                    Ck.add(candidate)

        Ck_counts = count_support(Ck)

        Lk = {itemset: count for itemset, count in Ck_counts.items() if count / n >= min_support}

        if not Lk:
            break  
        L.append(Lk)
        k += 1

    frequent_itemsets = {}
    for itemset_dict in L:
        frequent_itemsets.update(itemset_dict)

    return frequent_itemsets

def get_transactions_and_min_support():

    num_transactions = int(input("Enter the number of transactions: "))
    
    transactions = []
    
    for i in range(num_transactions):
        transaction_input = input(f"Enter items for transaction {i + 1} (comma-separated): ")
        transaction = set(transaction_input.strip().split(","))
        transactions.append(transaction)
    
    min_support = int(input("Enter the minimum support (0 to 10): "))
    min_support = min_support / 10.0  
    
    return transactions, min_support

transactions, min_support = get_transactions_and_min_support()

frequent_itemsets = apriori(transactions, min_support)

print("\nFrequent Itemsets:")
for itemset, support in frequent_itemsets.items():
    print(f"Itemset: {set(itemset)}, Support: {support / len(transactions)}")
