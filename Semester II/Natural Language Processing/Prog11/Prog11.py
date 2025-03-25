import nltk
from nltk import CFG, ChartParser, word_tokenize

nltk.download('punkt_tab')

grammar = CFG.fromstring("""
    S -> NP VP
    VP -> V NP | V
    NP -> Det N | Det N PP | N
    PP -> P NP
    Det -> 'a' | 'the'
    N -> 'man' | 'dog' | 'cat' | 'telescope' | 'park' | 'monkey'
    V -> 'saw' | 'ate' | 'walked'
    P -> 'in' | 'on' | 'by' | 'with'
""")

parser = ChartParser(grammar)

def grammar_checker(sentence):
    try:
        trees = list(parser.parse(word_tokenize(sentence)))
        return "Grammar is correct\n" + "\n".join(t.pretty_print() or "" for t in trees) if trees else "Grammar is incorrect."
    except Exception as e:
        return "Grammar is incorrect: " + str(e)

print(grammar_checker(input("Enter a sentence: ")))
