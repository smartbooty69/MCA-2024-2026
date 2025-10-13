import numpy as np


# Initial array (for this import numpy)
arr = np.array([[1, 2], [3, 4]])


def display_array():
    print("\nOriginal Array:\n", arr)


def reshape_array():
    reshaped = arr.reshape(4, 1)
    print("\nReshaped Array (4x1):\n", reshaped)


def access_element():
    print("\nElement at (1,1):", arr[1][1])


def add_five():
    print("\nArray + 5:\n", arr + 5)


def square_root():
    print("\nSquare Root of Elements:\n", np.sqrt(arr))


def main():
    while True:
        print("\n--- MENU ---")
        print("1. Display Original Array")
        print("2. Reshape Array to (4x1)")
        print("3. Access Element at (1,1)")
        print("4. Add 5 to Each Element")
        print("5. Square Root of Each Element")
        print("6. Exit")

        choice = input("Enter your choice (1-6): ")

        if choice == '1':
            display_array()
        elif choice == '2':
            reshape_array()
        elif choice == '3':
            access_element()
        elif choice == '4':
            add_five()
        elif choice == '5':
            square_root()
        elif choice == '6':
            print("Exiting the program.")
            break
        else:
            print("Invalid choice.")


if __name__ == "__main__":
    main()


