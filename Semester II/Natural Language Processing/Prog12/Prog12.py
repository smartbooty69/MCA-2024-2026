import nltk, spacy
from nltk.corpus import wordnet
from nltk.wsd import lesk

nltk.download('wordnet'); nltk.download('punkt')
nlp = spacy.load("en_core_web_sm")

def wsd(sent, word):
    lesk_s = lesk(nltk.word_tokenize(sent), word)
    rel = {t.text: t.head.text for t in nlp(sent) if t.dep_ in ["nsubj", "dobj"]}
    if word in rel:
        v = rel[word]
        s = max(wn.synsets(word), key=lambda syn: sum(v in ex for ex in syn.examples()), default=None)
        return s.definition() if s else lesk_s.definition() if lesk_s else "No sense found."
    return lesk_s.definition() if lesk_s else "No sense found."

w = input("Word: ")
print("Best sense:", wsd(input("Sentence: "), w))
