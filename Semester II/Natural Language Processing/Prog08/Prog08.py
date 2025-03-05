import nltk
import random
from nltk.corpus import brown
from collections import defaultdict, Counter

nltk.download("brown")
nltk.download("universal_tagset")

tagged_sentences = list(brown.tagged_sents(tagset="universal"))  
random.shuffle(tagged_sentences)  

train_size = int(0.8 * len(tagged_sentences))
train_data = tagged_sentences[:train_size]
test_data = tagged_sentences[train_size:]

tag_counts = Counter()
word_tag_counts = defaultdict(Counter)
transition_counts = defaultdict(Counter)

for sentence in train_data:
    prev_tag = "<s>"  
    for word, tag in sentence:
        tag_counts[tag] += 1
        word_tag_counts[word.lower()][tag] += 1
        transition_counts[prev_tag][tag] += 1
        prev_tag = tag
    transition_counts[prev_tag]["</s>"] += 1  

total_tags = sum(tag_counts.values())
tag_probabilities = {tag: count / total_tags for tag, count in tag_counts.items()}

transition_probabilities = {
    prev_tag: {tag: count / sum(transition_counts[prev_tag].values())
               for tag, count in transition_counts[prev_tag].items()}
    for prev_tag in transition_counts
}

emission_probabilities = {
    word: {tag: count / tag_counts[tag] for tag, count in tags.items()}
    for word, tags in word_tag_counts.items()
}

def viterbi(sentence, transition_probs, emission_probs, tagset):
    V = [{}]  
    path = {}  
    
    for tag in tagset:
        V[0][tag] = transition_probs.get("<s>", {}).get(tag, 0.0001) * emission_probs.get(sentence[0].lower(), {}).get(tag, 0.0001)
        path[tag] = [tag]
    
    for t in range(1, len(sentence)):
        V.append({})
        new_path = {}
        for curr_tag in tagset:
            (prob, best_prev_tag) = max(
                (V[t-1][prev_tag] * transition_probs.get(prev_tag, {}).get(curr_tag, 0.0001) * 
                 emission_probs.get(sentence[t].lower(), {}).get(curr_tag, 0.0001), prev_tag)
                for prev_tag in tagset
            )
            V[t][curr_tag] = prob
            new_path[curr_tag] = path[best_prev_tag] + [curr_tag]
        path = new_path
    
    (prob, best_final_tag) = max((V[-1][tag], tag) for tag in tagset)
    return path[best_final_tag]

tagset = list(tag_counts.keys())

test_sentence = [word for word, _ in test_data[0]]  
predicted_tags = viterbi(test_sentence, transition_probabilities, emission_probabilities, tagset)
actual_tags = [tag for _, tag in test_data[0]]

correct = sum(p == a for p, a in zip(predicted_tags, actual_tags))
accuracy = correct / len(actual_tags)

print("\nTest Sentence:", " ".join(test_sentence))
print("Predicted Tags:", predicted_tags)
print("Actual Tags:   ", actual_tags)
print(f"Accuracy: {accuracy:.2%}")
