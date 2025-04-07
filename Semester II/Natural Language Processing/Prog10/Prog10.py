from nltk.chat.util import Chat, reflections

chat = Chat([
    (r"hi|hello|hey", ["Hello!", "Hey!", "Hi there!"]),
    (r"how are you?", ["I'm good!", "All fine here."]),
    (r"what is your name?", ["I'm ChatBot."]),
    (r"who created you?", ["Clancy Mendonca did."]),
    (r"what can you do?", ["Chat, answer, entertain!"]),
    (r"bye|exit|quit", ["Bye!"]),
    (r"(.*)", ["Hmm...", "Interesting.", "Go on..."])
], reflections)

print("ChatBot: Hi! (type 'bye' to quit)")
while True:
    msg = input("You: ").lower()
    print("ChatBot:", chat.respond(msg))
    if msg in ["bye", "exit", "quit"]: break
