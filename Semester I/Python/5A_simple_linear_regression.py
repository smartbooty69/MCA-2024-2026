import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt


def main():
    data = {
        'Experience': [0.5, 1, 1.5, 2.3, 3, 3.8, 4.5, 5.2, 6, 6.5,
                       7.1, 8, 8.5, 9.3, 10, 11, 12, 13.5, 15, 16],
        'Salary': [
            28000, 30000, 32000, 34000, 36000,
            39000, 41000, 43000, 46000, 48000,
            50000, 52000, 55000, 57000, 59000,
            61000, 63000, 66000, 68000, 70000
        ]
    }

    df = pd.DataFrame(data)

    X_train, X_test, y_train, y_test = train_test_split(
        df[['Experience']], df['Salary'], test_size=0.2, random_state=1
    )

    model = LinearRegression().fit(X_train, y_train)
    y_pred = model.predict(X_test)

    mse = mean_squared_error(y_test, y_pred)
    rmse = mse ** 0.5
    r2 = r2_score(y_test, y_pred)

    print(f"MSE: {mse:.2f}, RMSE: {rmse:.2f}, R2: {r2:.2f}")

    plt.scatter(X_test, y_test, color='blue', label='Actual')
    plt.plot(X_test, y_pred, color='red', label='Predicted')
    plt.xlabel('Experience (Years)')
    plt.ylabel('Salary')
    plt.title('Simple Linear Regression')
    plt.legend()
    plt.show()


if __name__ == "__main__":
    main()


