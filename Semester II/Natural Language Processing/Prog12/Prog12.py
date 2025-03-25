import nltk, spacy
from nltk.corpus import wordnet
from nltk.wsd import lesk

nltk.download('wordnet'); nltk.download('punkt')
nlp = spacy.load("en_core_web_sm")

def hybrid_wsd(sentence, word):
    lesk_sense = lesk(nltk.word_tokenize(sentence), word)
    relations = {t.text: t.head.text for t in nlp(sentence) if t.dep_ in ["nsubj", "dobj"]}

    if word in relations:
        verb = relations[word]
        best_sense = max(wordnet.synsets(word), key=lambda s: sum(verb in ex for ex in s.examples()), default=None)
        return best_sense.definition() if best_sense else lesk_sense.definition() if lesk_sense else "No sense found."
    
    return lesk_sense.definition() if lesk_sense else "No sense found."

print(f"\nBest sense for '{(word := input('Word to disambiguate: '))}': {hybrid_wsd(input('Enter a sentence: '), word)}")
