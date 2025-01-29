from nltk.stem import PorterStemmer

def morphological_analyzer(word):
    stemmer = PorterStemmer()
    return stemmer.stem(word)

words = ["running", "flies", "happiness", "arguing", "jumped"]
for word in words:
    print(f"{word} -> {morphological_analyzer(word)}")
