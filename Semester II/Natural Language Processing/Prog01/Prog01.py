from gtts import gTTS
import speech_recognition as sr
import os

def text_to_speech(text, language='en', output_file='output.wav'):
    tts = gTTS(text=text, lang=language, slow=False)
    tts.save(output_file)
    print(f"Speech saved as {output_file}")
    os.system(f"start {output_file}" if os.name == 'nt' else f"xdg-open {output_file}")
    return True

def audio_to_text(file_path):
    recognizer = sr.Recognizer()
    with sr.AudioFile(file_path) as source:
        print("Loading audio file...")
        audio_data = recognizer.record(source)
        print("Recognizing speech...")
        text = recognizer.recognize_google(audio_data)
        return text

def display_menu():
    print("\n=== Speech Processing Menu ===")
    print("1. Convert Text to Speech")
    print("2. Convert Speech to Text")
    print("3. Exit")
    print("===========================")

def main():
    while True:
        display_menu()
        choice = input("Enter your choice (1-3): ")

        if choice == '1':
            text = input("Enter the text to convert to speech: ")
            output_file = input("Enter output file name (press Enter for default 'output.wav'): ")
            if not output_file:
                output_file = 'output.wav'
            text_to_speech(text, output_file=output_file)

        elif choice == '2':
            file_path = input("Enter the audio file path (.wav format): ")
            if os.path.exists(file_path):
                result = audio_to_text(file_path)
                if result:
                    print("\nTranscribed Text:")
                    print(result)
            else:
                print("Error: File does not exist!")

        elif choice == '3':
            print("Thank you for using the Speech Processing Program!")
            break

        else:
            print("Invalid choice! Please select 1, 2, or 3.")

if __name__ == "__main__":
    main()
