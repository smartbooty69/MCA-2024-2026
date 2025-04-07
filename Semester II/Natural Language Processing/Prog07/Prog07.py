import nltk
from nltk.corpus import words
from difflib import get_close_matches

nltk.download('words')
word_list = set(map(str.lower, words.words()))

def suggest_correction(word):
    return [word] if word in word_list else get_close_matches(word.lower(), word_list, 3, 0.7)

print(f"Did you mean: {', '.join(suggest_correction(input('Enter a misspelled word: ').strip())) or 'No suggestions found.'}")