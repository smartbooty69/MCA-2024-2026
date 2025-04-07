import nltk
from nltk import CFG, ChartParser, word_tokenize

nltk.download('punkt_tab')

grammar = CFG.fromstring("""
    S -> NP VP
    VP -> V NP | V
    NP -> Det N | Det N PP | N
    PP -> P NP
    Det -> 'a' | 'the'
    N -> 'man' | 'dog' | 'cat' | 'park' 
    V -> 'saw' | 'ate' | 'walked'
    P -> 'in' | 'on' | 'by' | 'with'
""")

parser = ChartParser(grammar)

sentence = input("Enter a sentence: ").lower()
try:
    trees = list(parser.parse(word_tokenize(sentence)))
    print("Grammar correct\n" + "".join(t.pretty_print() or "" for t in trees) if trees else "Grammar incorrect.")
except Exception as e:
    print("Error:", e)
# the man saw a dog