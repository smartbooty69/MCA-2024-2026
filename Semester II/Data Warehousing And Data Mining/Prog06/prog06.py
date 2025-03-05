from collections import defaultdict

def hash_apriori(transactions, min_support):
    n_transactions = len(transactions)
    min_support_count = (min_support / 10) * n_transactions
    
    item_counts = defaultdict(int)
    for transaction in transactions:
        for item in transaction:
            item_counts[frozenset([item])] += 1
    L1 = {k: v for k, v in item_counts.items() if v >= min_support_count}
    
    hash_size = 10
    hash_table = [0] * hash_size
    C2 = set()
    
    for transaction in transactions:
        for i in range(len(transaction)):
            for j in range(i + 1, len(transaction)):
                hash_value = (hash(transaction[i]) + hash(transaction[j])) % hash_size
                hash_table[hash_value] += 1

    for item1 in L1:
        for item2 in L1:
            if item1 != item2:
                hash_value = (hash(list(item1)[0]) + hash(list(item2)[0])) % hash_size
                if hash_table[hash_value] >= min_support_count:
                    C2.add(item1.union(item2))

    C2_counts = defaultdict(int)
    for transaction in transactions:
        transaction_set = frozenset(transaction)
        for candidate in C2:
            if candidate.issubset(transaction_set):
                C2_counts[candidate] += 1

    L2 = {k: v for k, v in C2_counts.items() if v >= min_support_count}
    
    return {**L1, **L2}

def main():
    print("HASH-BASED APRIORI ALGORITHM")
    
    min_support = float(input("Enter minimum support (0-10): "))
    
    n_transactions = int(input("Enter number of transactions: "))
    transactions = [input(f"Transaction {i+1}: ").strip().lower().split(',') for i in range(n_transactions)]
    
    frequent_itemsets = hash_apriori(transactions, min_support)
    
    print("Frequent Itemsets:")
    for itemset, support in frequent_itemsets.items():
        print(f"Itemset: {set(itemset)}, Support: {support}")

if __name__ == "__main__":
    main()