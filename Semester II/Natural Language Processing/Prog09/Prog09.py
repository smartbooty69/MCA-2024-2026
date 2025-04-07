from deep_translator import GoogleTranslator

codes = { "hindi": "hi", "spanish": "es", "japanese": "ja" }

print("Languages:", ", ".join(codes))
lang = input("Target language: ").strip().lower()
if lang in codes:
    text = input("Enter English text: ").strip()
    try:
        translated = GoogleTranslator(source="auto", target=codes[lang]).translate(text)
        print(f"Translated ({lang}): {translated}")
    except Exception as e:
        print(f"Error: {e}")
else:
    print("Invalid language.")
