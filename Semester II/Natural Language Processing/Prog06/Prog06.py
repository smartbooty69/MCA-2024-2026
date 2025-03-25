import spacy, nltk
from nltk.stem import WordNetLemmatizer

nltk.download('wordnet'); nltk.download('omw-1.4')

nlp = spacy.load("en_core_web_sm")
irregular_verbs = {"eat": "eaten", "write": "written", "break": "broken", "see": "seen", 
    "take": "taken", "give": "given", "drive": "driven", "speak": "spoken", "choose": "chosen", 
    "forget": "forgotten", "steal": "stolen", "freeze": "frozen", "ride": "ridden", "fall": "fallen", 
    "do": "done", "go": "gone", "be": "been"}

def get_past_participle(verb):
    return irregular_verbs.get((base := WordNetLemmatizer().lemmatize(verb, "v")), base + "ed")

def active_to_passive(sentence):
    doc = nlp(sentence)
    subj, verb, obj = next((t for t in doc if t.dep_ == "nsubj"), None), \
                      next((t for t in doc if t.dep_ == "ROOT"), None), \
                      next((t for t in doc if t.dep_ == "dobj"), None)

    if subj and verb and obj:
        obj_phrase = " ".join([c.text for c in obj.lefts if c.dep_ in ("det", "amod")] + [obj.text])
        return f"{obj_phrase.capitalize()} was {get_past_participle(verb.text)} by {subj.text.lower()}."
    return "Conversion not possible."

print("Passive Voice:", active_to_passive(input("Enter an active voice sentence: ")))
