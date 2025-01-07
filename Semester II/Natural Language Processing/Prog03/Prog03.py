import nltk
import spacy

nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')
nltk.download('punkt_tab')
nltk.download('averaged_perceptron_tagger_eng')
from nltk.tokenize import word_tokenize
from nltk import pos_tag

nlp = spacy.load("en_core_web_sm")

while True:
    print("\nMenu:")
    print("1. Use NLTK for PoS Tagging")
    print("2. Use SpaCy for PoS Tagging")
    print("3. Exit")
    choice = input("Enter your choice: ")

    if choice == '1':
        text = input("Enter the text to be analyzed: ")
        words = word_tokenize(text)
        pos_tags = pos_tag(words)
        print("Original Text:")
        print(text)
        print("\nPoS Tagging Result:")
        for word, pos in pos_tags:
            print(f"{word}: {pos}")
    elif choice == '2':
        
        text = input("Enter the text to be analyzed: ")
        doc = nlp(text)
        print("Original Text: ", text)
        print("PoS Tagging Result:")
        for token in doc:
            print(f"{token.text}: {token.pos_}")
    elif choice == '3':
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please try again.")
