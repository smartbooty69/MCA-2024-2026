import nltk
from nltk.corpus import wordnet
nltk.download('wordnet') 

synonyms = [] 
antonyms = [] 

word = input("Enter the word to find synonyms and antonyms: ")

for syn in wordnet.synsets(word): 
    for l in syn.lemmas(): 
        synonyms.append(l.name()) 
        if l.antonyms(): 
            antonyms.append(l.antonyms()[0].name()) 
  
print("Synonyms of", word, ":", set(synonyms)) 
print("\n")
print("Antonyms of", word, ":", set(antonyms)) 