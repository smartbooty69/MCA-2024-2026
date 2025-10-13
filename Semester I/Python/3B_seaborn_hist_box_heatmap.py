import seaborn as sns
import matplotlib.pyplot as plt


# Load the Iris dataset
data = sns.load_dataset("iris")


def plot_histogram():
    sns.histplot(data['sepal_length'], kde=True)
    plt.title("Histogram of Sepal Length")
    plt.xlabel("Sepal Length")
    plt.ylabel("Frequency")
    plt.show()


def plot_boxplot():
    sns.boxplot(data=data, y='sepal_width')
    plt.title("Box Plot of Sepal Width")
    plt.ylabel("Sepal Width")
    plt.show()


def plot_heatmap():
    corr = data.select_dtypes(include='number').corr()
    sns.heatmap(corr, annot=True, cmap='coolwarm')
    plt.title("Correlation Heatmap")
    plt.show()


def show_menu():
    print("\n--- Data Visualization Menu ---")
    print("1. Histogram (sepal_length)")
    print("2. Box Plot (sepal_width)")
    print("3. Heatmap (correlation matrix)")
    print("4. Exit")


def main():
    while True:
        show_menu()
        choice = input("Enter your choice (1-4): ")

        if choice == '1':
            plot_histogram()
        elif choice == '2':
            plot_boxplot()
        elif choice == '3':
            plot_heatmap()
        elif choice == '4':
            print("Exiting.")
            break
        else:
            print("Invalid choice. Please enter 1-4.")


if __name__ == "__main__":
    main()


