def morphological_parse(word):
    rules = {
        "ing": "Present participle", "ed": "Past tense", "s": "Plural/third-person", 
        "er": "Comparative/Agent", "est": "Superlative", "ly": "Adverb", 
        "ness": "State of being", "un": "Negation", "re": "Repetition"
    }
    
    affixes, root = [], word  
    for prefix in ["un", "re"]:
        if root.startswith(prefix): 
            affixes.append((prefix, rules[prefix])); root = root[len(prefix):]
    
    for suffix in sorted(rules, key=len, reverse=True):
        if root.endswith(suffix) and suffix not in ["un", "re"]:
            affixes.append((suffix, rules[suffix])); root = root[:-len(suffix)]
    
    return {"root": root, "affixes": affixes}

for word in ["unhappy", "redoing", "walked", "teacher", "happily", "restart"]:
    print(f"\n{word} -> {morphological_parse(word)}")
