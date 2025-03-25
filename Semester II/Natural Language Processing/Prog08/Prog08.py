import nltk
from nltk.corpus import treebank
from nltk.tag import hmm

nltk.download('treebank', quiet=True)
tagger = hmm.HiddenMarkovModelTrainer().train(treebank.tagged_sents(tagset='universal'))

corrections = {"ate": "VERB", "for": "ADP", "yesterday": "ADV", "today": "ADV"}

def correct_tags(tags):
    return [(w, corrections.get(w.lower(), t)) for w, t in tags]

print("POS Tags:", correct_tags(tagger.tag(input("Enter a sentence: ").split())))
