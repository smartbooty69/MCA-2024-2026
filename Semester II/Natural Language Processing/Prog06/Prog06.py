from collections import defaultdict

class FiniteStateTransducer:
    def __init__(self):
        self.transitions = defaultdict(dict)
        self.outputs = defaultdict(dict)
        self.start_state = "q0"
        self.final_states = set()

    def add_transition(self, state, input_symbol, next_state, output_symbol):
        self.transitions[state][input_symbol] = next_state
        self.outputs[state][input_symbol] = output_symbol

    def set_final_state(self, state):
        self.final_states.add(state)

    def parse(self, word):
        current_state = self.start_state
        output = []
        
        for char in word:
            if char in self.transitions[current_state]:
                output.append(self.outputs[current_state][char])
                current_state = self.transitions[current_state][char]
            else:
                return "Parsing failed"

        return "".join(output) if current_state in self.final_states else "Not a valid form"

fst = FiniteStateTransducer()
fst.add_transition("q0", "w", "q1", "w")
fst.add_transition("q1", "a", "q2", "a")
fst.add_transition("q2", "l", "q3", "l")
fst.add_transition("q3", "k", "q4", "k")
fst.add_transition("q4", "e", "q5", "e")
fst.add_transition("q5", "d", "q6", "d")

fst.set_final_state("q6")

print(fst.parse("walked"))  
