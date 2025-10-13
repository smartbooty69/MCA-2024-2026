import matplotlib.pyplot as plt


def line_plot():
    x = [1, 2, 3, 4, 5]
    y = [2, 4, 6, 8, 10]
    plt.figure(figsize=(8, 4))
    plt.plot(x, y, marker='o', color='violet', linestyle='-')
    plt.title('Line Plot')
    plt.xlabel('X Axis')
    plt.ylabel('Y Axis')
    plt.grid(True)
    plt.show()


def bar_chart():
    x = [1, 2, 3, 4, 5]
    y = [5, 7, 3, 8, 6]
    plt.figure(figsize=(8, 4))
    plt.bar(x, y, color='pink')
    plt.title('Bar Chart')
    plt.xlabel('X Axis')
    plt.ylabel('Values')
    plt.show()


def scatter_plot():
    x = [1, 2, 3, 4, 5]
    y = [2.5, 3.5, 7, 1, 9]
    plt.figure(figsize=(8, 4))
    plt.scatter(x, y, color='red', marker='x')
    plt.title('Scatter Plot')
    plt.xlabel('X Axis')
    plt.ylabel('Y Axis')
    plt.grid(True)
    plt.show()


def main():
    while True:
        print("\n--- Matplotlib Plot Menu ---")
        print("1. Line Plot")
        print("2. Bar Chart")
        print("3. Scatter Plot")
        print("4. Exit")

        choice = input("Enter your choice (1-4): ")

        if choice == '1':
            line_plot()
        elif choice == '2':
            bar_chart()
        elif choice == '3':
            scatter_plot()
        elif choice == '4':
            print("Exiting program.")
            break
        else:
            print("Invalid choice. Please enter a number between 1 and 4.")


if __name__ == "__main__":
    main()


