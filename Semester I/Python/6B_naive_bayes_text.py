from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.metrics import accuracy_score


def main():
    texts = ["Win money now", "Hello friend", "Free offer today", "Let's meet tomorrow"]
    labels = ["spam", "ham", "spam", "ham"]

    X_train_texts, X_test_texts, y_train, y_test = train_test_split(
        texts, labels, test_size=0.5, random_state=42
    )

    vec = CountVectorizer()
    X_train = vec.fit_transform(X_train_texts)
    X_test = vec.transform(X_test_texts)

    nb = MultinomialNB()
    nb.fit(X_train, y_train)

    y_pred = nb.predict(X_test)

    print("Predictions:", y_pred)
    print("Actual labels:", y_test)
    print("Accuracy:", accuracy_score(y_test, y_pred))


if __name__ == "__main__":
    main()


