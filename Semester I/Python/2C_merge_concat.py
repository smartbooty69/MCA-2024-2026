import pandas as pd


def merge_names_with_pandas():
    first = input("Enter Your First Name: ")
    last = input("Enter Your Last Name: ")

    df = pd.DataFrame({'First Name': [first], 'Last Name': [last]})
    df['Full Name'] = df['First Name'] + " " + df['Last Name']
    print("Your Name:", df.loc[0, 'Full Name'])


def concatenate_words_with_pandas():
    words = ["My", "Name", "Is", "JK"]
    df = pd.DataFrame(words, columns=['Word'])
    sentence = df['Word'].str.cat(sep=' ')
    print("Concatenated Sentence:", sentence)


def main():
    while True:
        print("\n--- MENU ---")
        print("1. Merge First and Last Name using Pandas")
        print("2. Concatenate List of Words into Sentence using Pandas")
        print("3. Exit")

        choice = input("Enter your choice (1-3): ")

        if choice == '1':
            merge_names_with_pandas()
        elif choice == '2':
            concatenate_words_with_pandas()
        elif choice == '3':
            print("Exiting the program.")
            break
        else:
            print("Invalid choice. Please enter 1, 2, or 3.")


if __name__ == "__main__":
    main()


