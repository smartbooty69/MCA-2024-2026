import csv
import json


def write_initial_csv(filename):
    with open(filename, 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(['Name', 'Age'])
        writer.writerow(['Alice', '30'])
        writer.writerow(['Bob', '25'])


def read_csv(filename):
    with open(filename, 'r') as file:
        reader = csv.reader(file)
        return list(reader)


def write_csv(filename, rows):
    with open(filename, 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerows(rows)


def display_csv(filename):
    rows = read_csv(filename)
    print("\nCSV content:")
    for row in rows:
        print(row)


def modify_csv(filename):
    rows = read_csv(filename)
    for row in rows:
        if row[0] == 'Bob':
            row[1] = '26'
    write_csv(filename, rows)
    print("Bob's age updated to 26 in CSV.")


def write_initial_json(filename):
    data = {
        "people": [
            {"name": "Alice", "age": 30},
            {"name": "Bob", "age": 25}
        ]
    }
    with open(filename, 'w') as file:
        json.dump(data, file)


def read_json(filename):
    with open(filename, 'r') as file:
        return json.load(file)


def write_json(filename, data):
    with open(filename, 'w') as file:
        json.dump(data, file)


def display_json(filename):
    content = read_json(filename)
    print("\nJSON content:")
    print(json.dumps(content, indent=2))


def modify_json(filename):
    content = read_json(filename)
    for person in content["people"]:
        if person["name"] == "Bob":
            person["age"] = 26
    write_json(filename, content)
    print("Bob's age updated to 26 in JSON.")


def main():
    csv_file = 'simple.csv'
    json_file = 'simple.json'

    # Initialize files with starting data
    write_initial_csv(csv_file)
    write_initial_json(json_file)

    while True:
        print("\nMenu:")
        print("1. Display CSV content")
        print("2. Modify Bob's age in CSV")
        print("3. Display JSON content")
        print("4. Modify Bob's age in JSON")
        print("5. Exit")

        choice = input("Enter your choice (1-5): ")

        if choice == '1':
            display_csv(csv_file)
        elif choice == '2':
            modify_csv(csv_file)
        elif choice == '3':
            display_json(json_file)
        elif choice == '4':
            modify_json(json_file)
        elif choice == '5':
            print("Exiting program.")
            break
        else:
            print("Invalid choice, please enter a number between 1 and 5.")


if __name__ == "__main__":
    main()


