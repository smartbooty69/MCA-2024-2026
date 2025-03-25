import nltk
from nltk import CFG

grammar = CFG.fromstring("""
    S -> NP VP | S Conj S
    NP -> Det N | Det Adj N | N
    VP -> V NP | V NP PP | VP Adv | NP VP Adv
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

def check_sentence(sentence):
    tokens = sentence.lower().split()
    try:
        parses = list(parser.parse(tokens))
        print(f"{'✓' if parses else '✗'} {sentence}")
        for tree in parses: tree.pretty_print()
    except ValueError:
        print(f"✗ Error parsing: {sentence}")

while (s := input("\nEnter sentence ('exit' to quit): ").strip().lower()) != 'exit':
    check_sentence(s)
