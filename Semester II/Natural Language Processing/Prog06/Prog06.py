import spacy
from nltk.stem import WordNetLemmatizer
import nltk; nltk.download('wordnet'); nltk.download('omw-1.4')

nlp = spacy.load("en_core_web_sm")
irregular = {
    "eat": "eaten", "write": "written", "break": "broken", "see": "seen", "take": "taken",
    "give": "given", "drive": "driven", "speak": "spoken", "choose": "chosen", "forget": "forgotten",
    "steal": "stolen", "freeze": "frozen", "ride": "ridden", "fall": "fallen", "do": "done",
    "go": "gone", "be": "been"
}

get_pp = lambda v: irregular.get((b := WordNetLemmatizer().lemmatize(v, "v")), b + "ed")

def active_to_passive(sent):
    doc = nlp(sent)
    subj = next((t for t in doc if t.dep_ == "nsubj"), None)
    verb = next((t for t in doc if t.dep_ == "ROOT"), None)
    obj = next((t for t in doc if t.dep_ == "dobj"), None)
    if subj and verb and obj:
        obj_txt = " ".join([c.text for c in obj.lefts if c.dep_ in ("det", "amod")] + [obj.text])
        return f"{obj_txt.capitalize()} was {get_pp(verb.text)} by {subj.text.lower()}."
    return "Conversion not possible."

sent = input("Enter active sentence: ")
print("\nActive Voice:  ", sent)
print("Passive Voice: ", active_to_passive(sent))
