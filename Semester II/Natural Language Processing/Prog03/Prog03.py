import nltk
from nltk import CFG, ChartParser

grammar = CFG.fromstring("""
S -> NP VP
NP -> Det N | Det Adj N | N
VP -> V NP | V
Det -> 'the' | 'a'
N -> 'cat' | 'dog' | 'man' | 'woman'
Adj -> 'angry' | 'small'
V -> 'saw' | 'ran' | 'chased'
""")
parser = ChartParser(grammar)

while (s := input("\nEnter sentence ('exit' to quit): ").strip().lower()) != 'exit':
    tokens = s.split()
    try:
        trees = list(parser.parse(tokens))
        print("Correct" if trees else "Incorrect", s)
        for t in trees: t.pretty_print()
    except:
        print("Incorrect Error parsing:", s)
# the angry dog chased a small cat
# woman saw the cat