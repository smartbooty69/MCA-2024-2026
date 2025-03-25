from gtts import gTTS
import speech_recognition as sr
import os

def text_to_speech(text, file='output.wav'):
    gTTS(text=text, lang='en', slow=False).save(file)
    os.system(f"start {file}" if os.name == 'nt' else f"xdg-open {file}")

def audio_to_text(file):
    with sr.AudioFile(file) as source:
        return sr.Recognizer().record(source).recognize_google()

while True:
    choice = input("\n1. Text to Speech\n2. Speech to Text\n3. Exit\nChoice: ")
    if choice == '1':
        text_to_speech(input("Enter text: "), input("Filename (default 'output.wav'): ") or 'output.wav')
    elif choice == '2':
        file = input("Enter audio file path: ")
        print("\nTranscribed:", audio_to_text(file) if os.path.exists(file) else "File not found!")
    elif choice == '3':
        break
    else:
        print("Invalid choice!")
