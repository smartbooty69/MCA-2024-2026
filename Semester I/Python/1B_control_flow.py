def check_even_odd(num):
    if num % 2 == 0:
        print(num, "is Even")
    else:
        print(num, "is Odd")


def find_factorial(num):
    if num < 0:
        print("Factorial not defined for negative numbers.")
    else:
        fact = 1
        for i in range(1, num + 1):
            fact *= i
        print("Factorial of", num, "is", fact)


def main():
    while True:
        print("\n--- MENU ---")
        print("1. Check Even or Odd")
        print("2. Find Factorial")
        print("3. Exit")

        try:
            choice = int(input("Enter your choice (1-3): "))
        except ValueError:
            print("Invalid input. Please enter a number.")
            continue

        if choice == 1:
            try:
                number = int(input("Enter a number: "))
            except ValueError:
                print("Invalid number.")
                continue
            check_even_odd(number)
        elif choice == 2:
            try:
                number = int(input("Enter a number: "))
            except ValueError:
                print("Invalid number.")
                continue
            find_factorial(number)
        elif choice == 3:
            print("Exiting program.!")
            break
        else:
            print("Invalid input.")


if __name__ == "__main__":
    main()


