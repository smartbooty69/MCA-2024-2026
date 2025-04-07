import nltk
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from nltk.stem import WordNetLemmatizer, PorterStemmer
import re, string

nltk.download('punkt')
nltk.download('stopwords')
nltk.download('wordnet')

text = """Hello, welcome to NLP! Let's preprocess this text: 
Visit http://www.example.com for details. Email help@nlp.com or call 123-456-7890. 
Let’s remove stopwords, punctuation, and normalize words.""".lower()

text = re.sub(r'http\S+|www\.\S+|[\w\.-]+@[\w\.-]+|\d+|[^\w\s]', '', text)

tokens = word_tokenize(text)

stop_words = set(stopwords.words('english'))
lemmatizer = WordNetLemmatizer()
stemmer = PorterStemmer()
tokens = [lemmatizer.lemmatize(stemmer.stem(w)) for w in tokens if w not in stop_words and len(w) > 1]

print("Final Cleaned Text:", ' '.join(tokens))