def show_intro():
    print("Welcome to Python Programming!")


def variable_section():
    name = "Divya"
    age = 21
    is_student = True

    print("\n--- Variables and Data Types ---")
    print("Name:", name)
    print("Age:", age)
    print("Is Student?", is_student)

    print("\n--- Type Checking ---")
    print("Type of name:", type(name))
    print("Type of age:", type(age))
    print("Type of is_student:", type(is_student))


def arithmetic_operators():
    a = 10
    b = 3

    print("\n--- Arithmetic Operators ---")
    print(f"a = {a}, b = {b}")
    print(f"a + b = {a + b}")
    print(f"a - b = {a - b}")
    print(f"a * b = {a * b}")
    if b != 0:
        print(f"a / b = {a / b}")
        print(f"a % b = {a % b}")
        print(f"a // b = {a // b}")
    else:
        print("Division, Modulus and Floor division: Error - Division by zero")
    print(f"a ** b = {a ** b}")


def logical_operators():
    x = True
    y = False

    print("\n--- Logical Operators ---")
    print("x =", x, ", y =", y)
    print("x and y =", x and y)
    print("x or y =", x or y)
    print("not x =", not x)
    print("not y =", not y)


def comparison_operators():
    a = 10
    b = 3

    print("\n--- Comparison Operators ---")
    print("a =", a, ", b =", b)
    print("a == b:", a == b)
    print("a != b:", a != b)
    print("a > b:", a > b)
    print("a < b:", a < b)
    print("a >= b:", a >= b)
    print("a <= b:", a <= b)


def main_menu():
    while True:
        print("\n=== Python Basics Menu ===")
        print("1. Basic print")
        print("2. Variables and Data Types")
        print("3. Arithmetic Operators")
        print("4. Logical Operators")
        print("5. Comparison Operators")
        print("6. Exit")

        choice = input("Enter your choice (1-6): ")

        if choice == '1':
            show_intro()
        elif choice == '2':
            variable_section()
        elif choice == '3':
            arithmetic_operators()
        elif choice == '4':
            logical_operators()
        elif choice == '5':
            comparison_operators()
        elif choice == '6':
            print("Exiting program!")
            break
        else:
            print("Invalid choice! Please select between 1 to 6.")


if __name__ == "__main__":
    main_menu()


