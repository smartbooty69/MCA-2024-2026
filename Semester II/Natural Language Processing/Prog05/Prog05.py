from nltk.stem import PorterStemmer
import nltk; nltk.download('punkt')

ps = PorterStemmer()
print([ps.stem(w) for w in ["running", "happiness", "playing", "argued", "flies", "denied", "agreeing", "singing"]])
