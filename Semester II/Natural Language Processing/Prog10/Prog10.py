import nltk
from nltk.chat.util import Chat, reflections

pairs = [
    (r"hi|hello|hey", ["Hello!", "Hey there!", "Hi! How can I assist you?"]),
    (r"how are you?", ["I'm just a bot, but I'm doing great!", "I'm fine, thanks!"]),
    (r"what is your name?", ["I'm ChatBot!", "You can call me ChatBot."]),
    (r"who created you?", ["A programmer!", "I'm a result of some cool coding skills."]),
    (r"what can you do?", ["I can chat, answer simple questions, and keep you entertained!"]),
    (r"bye|goodbye", ["Goodbye!", "See you soon!", "Bye! Have a great day!"]),
    (r"(.*)", ["I'm not sure how to respond to that.", "Can you ask something else?", "Interesting! Tell me more."])
]

chatbot = Chat(pairs, reflections)

print("Hello! I'm ChatBot. Type 'bye' to exit.")
while (user := input("You: ").lower()) not in ["bye", "exit", "quit"]:
    print("ChatBot:", chatbot.respond(user))
print("ChatBot: Goodbye! Have a great day!")
