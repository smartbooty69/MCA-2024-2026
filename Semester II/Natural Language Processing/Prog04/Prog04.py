def morphological_parse(word):
    rules = {
        "ing": "Participle", "ed": "Past", "s": "Plural/3rd", "er": "Comp/Agent",
        "est": "Superlative", "ly": "Adverb", "ness": "State", "un": "Negation", "re": "Repeat"
    }
    
    affixes, root = [], word  
    for prefix in ["un", "re"]:
        if root.startswith(prefix): 
            affixes.append((prefix, rules[prefix])); 
            root = root[len(prefix):]
    
    for suffix in sorted(rules, key=len, reverse=True):
        if root.endswith(suffix) and suffix not in ["un", "re"]:
            affixes.append((suffix, rules[suffix])); 
            root = root[:-len(suffix)]
    
    return {"root": root, "affixes": affixes}

for word in ["unhappy", "redoing", "walked", "teacher", "happily", "restart"]:
    print(f"\n{word} -> {morphological_parse(word)}")
