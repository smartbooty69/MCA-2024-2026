function Book(title, author, year) {
    this.title = title;
    this.author = author;
    this.year = year;
}

let book1 = new Book("The Story of My Life", "Helen Keller", 1960);

function displayBookDetails(book) {
    console.log(`Book Details: 
    Title: ${book.title}
    Author: ${book.author}
    Year: ${book.year}`);
}

displayBookDetails(book1);
