import re
import nltk
nltk.download('punkt')  

text = """"It doesn't take much to touch someone's heart," Mrs. Daisy said with a smile on her face. "It's often just the little things you do that can change a person's day for the better." Mrs. Daisy truly believed this to be the way the world worked, but she didn't understand that she was merely a robot that had been programmed to believe this.
She considered the birds to be her friends. She'd put out food for them each morning and then she'd watch as they came to the feeders to gorge themselves for the day. She wondered what they would do if something ever happened to her. Would they miss the meals she provided if she failed to put out the food one morning?
Indescribable oppression, which seemed to generate in some unfamiliar part of her consciousness, filled her whole being with a vague anguish. It was like a shadow, like a mist passing across her soul's summer day. It was strange and unfamiliar; it was a mood. She did not sit there inwardly upbraiding her husband, lamenting at Fate, which had directed her footsteps to the path which they had taken. She was just having a good cry all to herself. The mosquitoes made merry over her, biting her firm, round arms and nipping at her bare insteps.
All he wanted was a candy bar. It didn't seem like a difficult request to comprehend, but the clerk remained frozen and didn't seem to want to honor the request. It might have had something to do with the gun pointed at his face."""

paragraphs = [p.strip() for p in text.split("\n") if p.strip()]

sentences = nltk.tokenize.sent_tokenize(text)

word_pattern = r"[A-Za-z0-9']+"
words = re.findall(word_pattern, text)

print("Paragraphs:")
for i, para in enumerate(paragraphs, 1):
    print(f"{i}: {para}\n")

print("\nSentences:")
for i, sent in enumerate(sentences, 1):
    print(f"{i}: {sent}\n")

print("\nWords:")
print(words)

print("\nNumber of paragraphs:", len(paragraphs))
print("Number of sentences:", len(sentences))
print("Number of words:", len(words))
