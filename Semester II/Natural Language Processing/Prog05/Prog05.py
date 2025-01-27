import nltk
from nltk import CFG

grammar = CFG.fromstring("""
    S -> NP VP | S Conj S | NP VP PP | NP VP NP | NP VP Adv | S PP
    NP -> Det N | Det Adj N | N | Det N PP
    VP -> V NP | V NP PP | V
    PP -> P NP
    Det -> 'the' | 'a' | 'an'
    N -> 'cat' | 'dog' | 'man' | 'woman' | 'telescope' | 'park' | 'child' | 'teacher' | 'city'
    Adj -> 'big' | 'small' | 'angry' | 'happy' | 'tall' | 'short'
    V -> 'saw' | 'walked' | 'ran' | 'chased' | 'likes' | 'hates'
    P -> 'in' | 'on' | 'with' | 'to' | 'from'
    Conj -> 'and' | 'or'
    Adv -> 'quickly' | 'silently' | 'happily' | 'sadly'
""")

parser = nltk.ChartParser(grammar)

def suggest_correction(sentence):
    """
    Suggest corrections for invalid sentences.
    
    Args:
        sentence (str): The sentence to analyze.
    
    Returns:
        str: Suggested correction or feedback.
    """
    
    tokens = sentence.lower().split()
    if len(tokens) < 3:
        return "Sentence is too short. Try adding more words."
    if tokens[0] not in ['the', 'a', 'an']:
        return "Consider starting with a determiner like 'the', 'a', or 'an'."
    if ' ' not in sentence:
        return "Make sure to include spaces between words."
    if not any(token in tokens for token in ['saw', 'walked', 'ran', 'chased', 'likes', 'hates']):
        return "Try using a verb like 'saw', 'walked', or 'likes' to make your sentence complete."
    if not any(token in tokens for token in ['quickly', 'silently', 'happily', 'sadly']):
        return "Consider adding an adverb to provide more detail."
    return "The sentence structure seems incorrect. Try rephrasing."

def check_sentence(sentence):
    """
    Parse the sentence and verify its grammatical correctness.
    
    Args:
        sentence (str): The sentence to parse.
    
    Returns:
        bool: True if the sentence is grammatically correct, False otherwise.
    """
    
    tokens = sentence.lower().split()
    
    try:
        parses = list(parser.parse(tokens))
        if parses:
            print(f"Sentence is grammatically correct!")
            for tree in parses:
                tree.pretty_print()  
            return True
        else:
            print(f"Sentence is not grammatically correct.")
            print(suggest_correction(sentence))  
            return False
    except ValueError as e:
        print(f"Error parsing sentence: {e}")
        return False

if __name__ == "__main__":
    while True:
        user_input = input("\nEnter a sentence to check (or type 'exit' to quit): ").strip()
        if user_input.lower() == 'exit':
            break
        check_sentence(user_input)
